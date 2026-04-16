---
title: Set-LnvUpdateConfiguration
description: Configure global Lenovo update module settings
---

# Set-LnvUpdateConfiguration

Modifies global configuration settings for the Lenovo.Client.Update module.

## Synopsis

Sets global options that affect multiple cmdlets, including proxy behavior, credential handling, and operation timeouts.

## Syntax

```powershell
Set-LnvUpdateConfiguration -InputObject <LnvUpdateConfiguration>

Set-LnvUpdateConfiguration [-Proxy <Uri>] [-ProxyCredential <PSCredential>]
                           [-ProxyUseDefaultCredential <bool>]
                           [-MaxExternalDetectionRuntime <TimeSpan>]
                           [-MaxExtractRuntime <TimeSpan>]
                           [-MaxInstallerRuntime <TimeSpan>]
```

## Description

`Set-LnvUpdateConfiguration` modifies the global module configuration that applies across all Lenovo.Client.Update cmdlets. Configuration options control:

- Proxy server and authentication settings
- Timeout limits for various operations (detection, extraction, installation)
- Default repository locations
- Credential handling

You can set individual options using parameter names, or import an entire configuration object using `-InputObject`. This allows saving and restoring complete configuration states.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-InputObject` | LnvUpdateConfiguration | Complete configuration object (use with `Get-LnvUpdateConfiguration` to save/restore configs) |
| `-Proxy` | Uri | Default proxy URL for all cmdlets. Pass `$null` to disable. |
| `-ProxyCredential` | PSCredential | Default proxy user account credentials. |
| `-ProxyUseDefaultCredential` | bool | When `$true`, uses current user credentials for proxy by default. |
| `-MaxExternalDetectionRuntime` | TimeSpan | Time limit for external detection processes. Use `[TimeSpan]::Zero` to disable. |
| `-MaxExtractRuntime` | TimeSpan | Time limit for package extraction operations. |
| `-MaxInstallerRuntime` | TimeSpan | Time limit for package installers. **Note:** Not applied to firmware or BIOS updates for safety. |

## Examples

### Example 1: Disable external detection timeout

```powershell
Set-LnvUpdateConfiguration -MaxExternalDetectionRuntime ([TimeSpan]::Zero)
```

Removes time limits on external detection processes.

### Example 2: Set maximum installer runtime

```powershell
Set-LnvUpdateConfiguration -MaxInstallerRuntime (New-TimeSpan -Minutes 20)
```

Limits installers to maximum 20-minute runtime.

### Example 3: Configure proxy settings

```powershell
$cred = Get-Credential
Set-LnvUpdateConfiguration -Proxy "http://proxy.example.com:8080" -ProxyCredential $cred
```

Sets proxy server and authentication credentials for all cmdlets.

### Example 4: Use default credentials for proxy

```powershell
Set-LnvUpdateConfiguration -Proxy "http://proxy.example.com:8080" `
                           -ProxyUseDefaultCredential $true
```

Configures proxy to use current user's Windows credentials automatically.

### Example 5: Save and restore configuration

```powershell
# Save current configuration
$config = Get-LnvUpdateConfiguration
$config | Export-Clixml -Path "C:\Backups\LnvConfig.xml"

# Later, restore the configuration
$savedConfig = Import-Clixml -Path "C:\Backups\LnvConfig.xml"
Set-LnvUpdateConfiguration -InputObject $savedConfig
```

Demonstrates saving and restoring configuration state.

### Example 6: Modify and apply configuration

```powershell
$config = Get-LnvUpdateConfiguration
$config.MaxExtractRuntime = (New-TimeSpan -Minutes 15)
$config.MaxInstallerRuntime = (New-TimeSpan -Minutes 30)
$config | Set-LnvUpdateConfiguration
```

Retrieves current config, modifies it, and applies changes via pipeline.

## Output

This cmdlet does not return objects. Changes are applied immediately to global module state.

## Notes

### Timeout Settings

- Use `[TimeSpan]::Zero` to disable a timeout
- Timeouts are per-operation, not per-package
- BIOS and firmware installer timeouts are not applied for safety reasons
- Very short timeouts may cause legitimate operations to fail

### Proxy Authentication

- If `-ProxyCredential` is set, it's used for all proxy connections
- `-ProxyUseDefaultCredential` uses the logged-in user's Windows credentials
- If both are set, `-ProxyCredential` takes precedence
- Credentials are stored in the module configuration (consider security implications)

### Configuration Scope

- Settings are stored per-user in the user's PowerShell profile directory
- Settings persist across PowerShell sessions
- Use `-InputObject` to apply the same configuration to multiple machines

## See Also

- [Get-LnvUpdateConfiguration](get-lnvupdateconfiguration.md)
- [Get-LnvUpdate](get-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
