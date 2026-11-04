#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Disables audio enhancements (SysFx) on all audio endpoints for all users.

.DESCRIPTION
    Enumerates every audio endpoint (Render and Capture) in the Windows MMDevices
    registry and sets PKEY_AudioEndpoint_Disable_SysFx = 1 on each one. This
    disables Windows audio signal/system enhancements, which resolves the Zoom
    Rooms wireless screen share failure on affected Lenovo models.

    If the Properties subkey has restrictive ACLs (common on OEM audio driver
    installations), the script temporarily grants the SYSTEM account Full Control,
    writes the value, then restores the original ACL.

    After all endpoints are processed, the Windows Audio service is restarted so
    changes take effect immediately without requiring a reboot.

    Designed for use as the remediation script in an Intune Remediation policy.
    Runs as SYSTEM (Intune default for scripts).

.NOTES
    Exits 0 on success, 1 if one or more endpoints could not be updated.

    Log file: C:\ProgramData\OtisAI\AudioEnhancements\Remediation.log
              (retained between runs; new entries are appended)
#>

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
$RegistryBase = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio"
$PropertyName = "{1da5d803-d492-4edd-8c23-e0c0ffee7f0e},5"
$LogPath      = "C:\ProgramData\Lenovo\AudioEnhancements\Remediation.log"

# PROPVARIANT encoding: VT_UI4 (0x0013) = 1 --> SysFx disabled
$DesiredValue = [byte[]](0x13,0x00, 0x00,0x00,0x00,0x00,0x00,0x00, 0x01,0x00,0x00,0x00, 0x00,0x00,0x00,0x00)

# ---------------------------------------------------------------------------
# Logging helper
# ---------------------------------------------------------------------------
function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "$timestamp [$Level] $Message"
    Write-Output $line
    try { Add-Content -Path $LogPath -Value $line -ErrorAction SilentlyContinue } catch {}
}

# ---------------------------------------------------------------------------
# Token privilege helper (P/Invoke)
# Enables SeRestorePrivilege, SeBackupPrivilege, SeTakeOwnershipPrivilege so
# SYSTEM can take ownership of and write to protected registry keys.
# ---------------------------------------------------------------------------
Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public class TokenPrivilege
{
    [DllImport("advapi32.dll", SetLastError = true)]
    private static extern bool LookupPrivilegeValue(string lpSystemName, string lpName, ref LUID lpLuid);

    [DllImport("advapi32.dll", SetLastError = true)]
    private static extern bool AdjustTokenPrivileges(
        IntPtr TokenHandle, bool DisableAllPrivileges,
        ref TOKEN_PRIVILEGES NewState, int BufferLength,
        IntPtr PreviousState, IntPtr ReturnLength);

    [DllImport("advapi32.dll", SetLastError = true)]
    private static extern bool OpenProcessToken(
        IntPtr ProcessHandle, uint DesiredAccess, ref IntPtr TokenHandle);

    [DllImport("kernel32.dll")]
    private static extern IntPtr GetCurrentProcess();

    [StructLayout(LayoutKind.Sequential)]
    private struct LUID { public uint LowPart; public int HighPart; }

    [StructLayout(LayoutKind.Sequential)]
    private struct TOKEN_PRIVILEGES
    {
        public uint PrivilegeCount;
        public LUID  Luid;
        public uint Attributes;
    }

    private const uint TOKEN_ADJUST_PRIVILEGES = 0x0020;
    private const uint TOKEN_QUERY             = 0x0008;
    private const uint SE_PRIVILEGE_ENABLED    = 0x00000002;

    public static bool Enable(string privilege)
    {
        IntPtr token = IntPtr.Zero;
        if (!OpenProcessToken(GetCurrentProcess(),
                TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, ref token))
            return false;

        LUID luid = new LUID();
        if (!LookupPrivilegeValue(null, privilege, ref luid))
            return false;

        TOKEN_PRIVILEGES tp = new TOKEN_PRIVILEGES();
        tp.PrivilegeCount = 1;
        tp.Luid           = luid;
        tp.Attributes     = SE_PRIVILEGE_ENABLED;

        return AdjustTokenPrivileges(token, false, ref tp, 0,
                                     IntPtr.Zero, IntPtr.Zero);
    }
}
'@ -ErrorAction SilentlyContinue

# ---------------------------------------------------------------------------
# Grant SYSTEM full control on a registry key, returning the original ACL
# so it can be restored afterward.
# ---------------------------------------------------------------------------
function Grant-SystemFullControl {
    param([Microsoft.Win32.RegistryKey]$Key)

    try {
        $acl      = $Key.GetAccessControl([System.Security.AccessControl.AccessControlSections]::Access)
        $original = $acl.GetAccessRules($true, $true, [System.Security.Principal.NTAccount])

        $systemId = New-Object System.Security.Principal.NTAccount("NT AUTHORITY\SYSTEM")
        $rule = New-Object System.Security.AccessControl.RegistryAccessRule(
            $systemId,
            [System.Security.AccessControl.RegistryRights]::FullControl,
            [System.Security.AccessControl.InheritanceFlags]::ContainerInherit,
            [System.Security.AccessControl.PropagationFlags]::None,
            [System.Security.AccessControl.AccessControlType]::Allow
        )
        $acl.AddAccessRule($rule)
        $Key.SetAccessControl($acl)
        return $original
    }
    catch {
        return $null
    }
}

# ---------------------------------------------------------------------------
# Set the PROPVARIANT value on a Properties subkey.
# Falls back to ACL adjustment if the direct write fails.
# Returns $true on success.
# ---------------------------------------------------------------------------
function Set-SysFxDisabled {
    param([string]$PropertiesKeyPath, [string]$EndpointLabel)

    # --- Attempt 1: direct write -----------------------------------------------
    try {
        Set-ItemProperty -Path $PropertiesKeyPath -Name $PropertyName `
            -Value $DesiredValue -Type Binary -Force -ErrorAction Stop
        Write-Log "  Set SysFx=disabled on $EndpointLabel (direct write)"
        return $true
    }
    catch {
        Write-Log "  Direct write failed on $EndpointLabel -- attempting ACL fix. Error: $_" "WARN"
    }

    # --- Attempt 2: elevate ACL then write -------------------------------------
    try {
        $regKeyPath = $PropertiesKeyPath -replace '^HKLM:\\', ''

        # Enable privileges needed to take ownership and restore objects
        [void][TokenPrivilege]::Enable("SeRestorePrivilege")
        [void][TokenPrivilege]::Enable("SeBackupPrivilege")
        [void][TokenPrivilege]::Enable("SeTakeOwnershipPrivilege")

        $regKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey(
            $regKeyPath,
            [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,
            [System.Security.AccessControl.RegistryRights]::FullControl
        )

        if ($null -eq $regKey) {
            # Key opened read-only; take ownership first
            $regKeyRO = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey(
                $regKeyPath,
                [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,
                [System.Security.AccessControl.RegistryRights]::TakeOwnership
            )
            if ($null -ne $regKeyRO) {
                $ownerAcl = $regKeyRO.GetAccessControl([System.Security.AccessControl.AccessControlSections]::None)
                $systemId = New-Object System.Security.Principal.NTAccount("NT AUTHORITY\SYSTEM")
                $ownerAcl.SetOwner($systemId)
                $regKeyRO.SetAccessControl($ownerAcl)
                $regKeyRO.Close()
            }

            # Re-open with write rights now that we own it
            $regKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey(
                $regKeyPath,
                [Microsoft.Win32.RegistryKeyPermissionCheck]::ReadWriteSubTree,
                [System.Security.AccessControl.RegistryRights]::FullControl
            )
        }

        if ($null -eq $regKey) {
            Write-Log "  Cannot open $EndpointLabel Properties key for writing." "ERROR"
            return $false
        }

        $originalAcl = Grant-SystemFullControl -Key $regKey

        # Write value using the native .NET method (bypasses PowerShell provider ACL check)
        $regKey.SetValue($PropertyName, $DesiredValue, [Microsoft.Win32.RegistryValueKind]::Binary)
        $regKey.Close()

        Write-Log "  Set SysFx=disabled on $EndpointLabel (after ACL fix)"
        return $true
    }
    catch {
        Write-Log "  Failed to set SysFx on $EndpointLabel after ACL fix. Error: $_" "ERROR"
        return $false
    }
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

# Ensure log directory exists
$logDir = Split-Path $LogPath
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

Write-Log "--- Audio Enhancement Remediation started ---"
Write-Log "Running as: $([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)"

$totalEndpoints  = 0
$successCount    = 0
$failureCount    = 0

foreach ($endpointType in @("Render", "Capture")) {

    $typePath = Join-Path $RegistryBase $endpointType
    if (-not (Test-Path $typePath)) {
        Write-Log "No $endpointType endpoints found -- skipping."
        continue
    }

    $devices = Get-ChildItem -Path $typePath -ErrorAction SilentlyContinue
    foreach ($device in $devices) {

        $propsPath = Join-Path $device.PSPath "Properties"
        if (-not (Test-Path $propsPath)) { continue }

        $totalEndpoints++
        $label = "$endpointType\$($device.PSChildName)"

        $ok = Set-SysFxDisabled -PropertiesKeyPath $propsPath -EndpointLabel $label
        if ($ok) { $successCount++ } else { $failureCount++ }
    }
}

Write-Log "Endpoints processed: $totalEndpoints  (success: $successCount  failed: $failureCount)"

# ---------------------------------------------------------------------------
# Restart Windows Audio service so changes apply without a reboot
# ---------------------------------------------------------------------------
if ($successCount -gt 0) {
    Write-Log "Restarting Windows Audio service..."
    try {
        Stop-Service -Name "AudioSrv" -Force -ErrorAction Stop
        Start-Service -Name "AudioSrv" -ErrorAction Stop
        Write-Log "Windows Audio service restarted successfully."

        # Windows Audio Endpoint Builder depends on AudioSrv; restart it too
        Stop-Service -Name "AudioEndpointBuilder" -Force -ErrorAction SilentlyContinue
        Start-Service -Name "AudioEndpointBuilder" -ErrorAction SilentlyContinue
        Write-Log "Windows Audio Endpoint Builder restarted."
    }
    catch {
        Write-Log "Failed to restart Windows Audio service: $_" "WARN"
    }
}

Write-Log "--- Remediation complete ---"

if ($failureCount -gt 0) {
    exit 1
}
exit 0
