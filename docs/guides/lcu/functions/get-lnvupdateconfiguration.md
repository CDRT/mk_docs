---
title: Get-LnvUpdateConfiguration
description: Retrieve and manage the current Lenovo.Client.Update configuration
---

# Get-LnvUpdateConfiguration

Retrieves the current configuration settings for the Lenovo.Client.Update module.

## Synopsis

Gets the global configuration for the Lenovo.Client.Update module, including proxy settings, repository locations, and runtime limits.

## Description

`Get-LnvUpdateConfiguration` returns the current module configuration object. This can be used to view existing settings, make modifications, and apply changes back using `Set-LnvUpdateConfiguration`.

Configuration settings control proxy behavior, timeout limits for various operations, and default repository paths used by other cmdlets.

## Parameters

This cmdlet has no parameters.

## Examples

### Example 1: View current configuration

```powershell
Get-LnvUpdateConfiguration
```

Displays all current module configuration settings.

### Example 2: View proxy settings only

```powershell
Get-LnvUpdateConfiguration | Select-Object Proxy, ProxyCredential
```

Shows proxy configuration without other settings.

### Example 3: Export configuration for backup

```powershell
$config = Get-LnvUpdateConfiguration
$config | Export-Clixml -Path "C:\Backups\LnvConfig.xml"
```

Saves the current configuration to an XML file for backup or transfer.

## Output

Returns a `LnvUpdateConfiguration` object with properties such as:

- `Proxy` - Current proxy URL (if set)
- `ProxyCredential` - Proxy authentication credentials (if set)
- `ProxyUseDefaultCredential` - Whether to use current user credentials for proxy
- `MaxExternalDetectionRuntime` - Time limit for detection processes
- `MaxExtractRuntime` - Time limit for package extraction
- `MaxInstallerRuntime` - Time limit for installer execution
- `RepositoryPath` - Default repository location

## See Also

- [Set-LnvUpdateConfiguration](set-lnvupdateconfiguration.md)
- [Get-LnvUpdate](get-lnvupdate.md)
