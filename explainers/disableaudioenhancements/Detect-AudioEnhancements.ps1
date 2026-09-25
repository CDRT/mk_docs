#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Detects whether audio enhancements (SysFx) are disabled on all audio endpoints.

.DESCRIPTION
    Checks each audio endpoint (Render and Capture) in the Windows MMDevices registry
    for the PKEY_AudioEndpoint_Disable_SysFx property. Returns exit code 0 (compliant)
    if all endpoints have enhancements disabled, or exit code 1 (non-compliant) if any
    endpoint is missing the property or has it set to a value other than 1.

    Designed for use as the detection script in an Intune Remediation policy.
    Runs as SYSTEM (Intune default for scripts).

.NOTES
    Exit codes:
        0 = Compliant   (all endpoints have SysFx disabled -- no remediation needed)
        1 = Non-compliant (one or more endpoints have SysFx enabled -- remediation needed)

    Registry path:
        HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\{Render|Capture}\{GUID}\Properties

    Property:
        Name  : {1da5d803-d492-4edd-8c23-e0c0ffee7f0e},5   (PKEY_AudioEndpoint_Disable_SysFx)
        Type  : REG_BINARY (PROPVARIANT, VT_UI4)
        Value : 13 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00  (ulVal = 1 = disabled)
#>

$RegistryBase  = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio"
$PropertyName  = "{1da5d803-d492-4edd-8c23-e0c0ffee7f0e},5"

# PROPVARIANT encoding of VT_UI4 = 1 (SysFx disabled)
# Structure: vt(2) + reserved(6) + ulVal(4) + padding(4) = 16 bytes
$ExpectedValue = [byte[]](0x13,0x00, 0x00,0x00,0x00,0x00,0x00,0x00, 0x01,0x00,0x00,0x00, 0x00,0x00,0x00,0x00)

$endpointCount    = 0
$nonCompliantCount = 0

foreach ($endpointType in @("Render", "Capture")) {

    $typePath = Join-Path $RegistryBase $endpointType
    if (-not (Test-Path $typePath)) { continue }

    $devices = Get-ChildItem -Path $typePath -ErrorAction SilentlyContinue
    foreach ($device in $devices) {

        $propsPath = Join-Path $device.PSPath "Properties"
        if (-not (Test-Path $propsPath)) { continue }

        $endpointCount++

        try {
            $currentValue = (Get-ItemProperty -Path $propsPath -Name $PropertyName -ErrorAction Stop).$PropertyName

            # Compare byte arrays
            $isEqual = (
                $null -ne $currentValue -and
                $currentValue.Length -eq $ExpectedValue.Length -and
                [System.Linq.Enumerable]::SequenceEqual([byte[]]$currentValue, $ExpectedValue)
            )

            if (-not $isEqual) {
                $nonCompliantCount++
                Write-Output "Non-compliant endpoint: $($device.PSChildName) [$endpointType]"
            }
        }
        catch {
            # Property not present counts as non-compliant
            $nonCompliantCount++
            Write-Output "Missing property on endpoint: $($device.PSChildName) [$endpointType]"
        }
    }
}

if ($endpointCount -eq 0) {
    Write-Output "No audio endpoints found -- compliant by default."
    exit 0
}

if ($nonCompliantCount -gt 0) {
    Write-Output "Non-compliant: $nonCompliantCount of $endpointCount endpoint(s) have audio enhancements enabled."
    exit 1
}

Write-Output "Compliant: All $endpointCount endpoint(s) have audio enhancements disabled."
exit 0
