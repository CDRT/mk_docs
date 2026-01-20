# Get-LnvUpdateConfiguration

Retrieve and manage the current Lenovo.Client.Update configuration.

## Synopsis

Gets the current Lenovo update module configuration settings.

## Description

Returns the current configuration for the Lenovo.Client.Update module, including proxy settings, repository location, and other module preferences.

## Examples

```powershell
# Get configuration
Get-LnvUpdateConfiguration

# View proxy settings
Get-LnvUpdateConfiguration | Select-Object Proxy
```

## See Also

- [Set-LnvUpdateConfiguration](set-lnvupdateconfiguration.md)
