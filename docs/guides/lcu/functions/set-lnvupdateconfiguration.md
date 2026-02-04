# Set-LnvUpdateConfiguration

Configure global Lenovo update module settings.

## Synopsis

Sets global configuration options for LenovoUpdate that may affect multiple cmdlets.

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

Modifies the global configuration settings for the Lenovo.Client.Update module. These settings apply to multiple cmdlets and control behavior such as proxy usage, credential handling, and timeout limits for various operations.

You can set configuration options individually using parameter names, or import an entire configuration object using the `-InputObject` parameter. This allows you to easily save and restore configuration states.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-InputObject` | LnvUpdateConfiguration | A complete configuration object to import and apply. Use with [Get-LnvUpdateConfiguration](get-lnvupdateconfiguration.md) to save/restore configurations. |
| `-Proxy` | Uri | Set the default proxy URL for all cmdlets. Pass `$null` to disable proxy settings. |
| `-ProxyCredential` | PSCredential | Specifies the default proxy user account credentials for all cmdlets. |
| `-ProxyUseDefaultCredential` | bool | When `$true`, uses the credentials of the current user to access the proxy server by default. |
| `-MaxExternalDetectionRuntime` | TimeSpan | Sets a time limit for how long external detection processes can run before they're forcefully stopped. Use `[TimeSpan]::Zero` to disable the limit. |
| `-MaxExtractRuntime` | TimeSpan | Sets a time limit for how long package extractions can run before they're forcefully stopped. |
| `-MaxInstallerRuntime` | TimeSpan | Sets a time limit for how long package installers can run before they're forcefully stopped. **Note:** This limit is not applied to firmware or BIOS/UEFI updates as a safety measure. |

## Examples

### Example 1: Disable External Detection Runtime Limit

```powershell
Set-LnvUpdateConfiguration -MaxExternalDetectionRuntime ([TimeSpan]::Zero)
```

Removes the time limit for external detection processes.

### Example 2: Set Maximum Installer Runtime

```powershell
Set-LnvUpdateConfiguration -MaxInstallerRuntime (New-TimeSpan -Minutes 20)
```

Limits package installers to a maximum runtime of 20 minutes.


### Example 3: Apply a Saved Configuration

```powershell
$config = Get-LnvUpdateConfiguration
# ... make modifications to $config ...
$config | Set-LnvUpdateConfiguration
```

Retrieves the current configuration, modifies it, and applies the changes back using pipeline input.



## See Also

- [Get-LnvUpdateConfiguration](get-lnvupdateconfiguration.md)
- [Get-LnvUpdate](get-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
