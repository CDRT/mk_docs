# Cmdlet Reference Guide

## Expand-LSUpdate 

**SYNOPSIS**

Extracts package installers.

**SYNTAX**

``` PowerShell
Expand-LSUpdate [-Package] <PSObject> [-Path <DirectoryInfo>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

**DESCRIPTION**

Extracts package installers.

**EXAMPLES**

***Example 1*** 

```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

**PARAMETERS**

***-Package*** 

The Lenovo package or packages whose installer to extract

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

***-Path*** 

The directory containing the previously downloaded packages. Use `Save-LSUpdate` to download packages.

```yaml
Type: DirectoryInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: "$env:TEMP\LSUPackages"
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProgressAction***

{{ Add description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***CommonParameters***

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

**INPUTS**

**OUTPUTS**

**NOTES** 

**RELATED LINKS** 


## Get-LSUClientConfiguration 

**SYNOPSIS** 

**SYNTAX** 

``` PowerShell
Get-LSUClientConfiguration [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

**DESCRIPTION** 

Returns the currently active configuration options

**EXAMPLES**

***Example 1*** 

``` PowerShell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

**PARAMETERS** 

***-ProgressAction*** 

{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***CommonParameters*** 

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

**INPUTS** 

**OUTPUTS** 

**NOTES** 

**RELATED LINKS**


## Get-LnvUpdate 

**SYNOPSIS** 

Fetches available driver packages and updates for Lenovo computers

**SYNTAX** 

``` PowerShell
Get-LnvUpdate [[-Model] <String>] [[-Proxy] <Uri>] [[-ProxyCredential] <PSCredential>]
 [-ProxyUseDefaultCredentials] [-All] [-IncludePhantomDevices] [[-ScratchDirectory] <DirectoryInfo>]
 [[-Repository] <String>] [[-MachineCharacteristicsOverride] <Hashtable>] [-NoTestApplicable]
 [-NoTestInstalled] [-NoTestSeverityOverride] [-FailUnsupportedDependencies] [-PassUnsupportedInstallTests]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

**DESCRIPTION** 

Fetches available driver packages and updates for Lenovo computers

**EXAMPLES** 

***EXAMPLE 1*** 

``` PowerShell
# Get available updates for the local computer
PS> Get-LnvUpdate
```

***EXAMPLE 2*** 

``` PowerShell
# Get all available packages for a different computer model
PS> Get-LnvUpdate -Model 20K70000GE -All
```

**PARAMETERS** 

***-All*** 

Return all packages, regardless of whether they are applicable to this specific machine or whether they are already installed. E.g. this will return LTE-Modem drivers even on machines that do not have the optional LTE-Modem installed, or 32-bit drivers on a 64-bit OS. Attempting to install such inapplicable drivers will likely fail. Re-installing an already installed driver can sometimes be useful to fix a driver that got corrupted.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-FailUnsupportedDependencies*** 

Lenovo specifies different tests with each package to determine whether it is applicable to a machine or not. This module makes a best effort to parse, understand and check these. However, new kinds of tests may be added by Lenovo at any point and some currently in use are not supported yet either. By default, any unknown applicability tests will be treated as passed which may result in a package that is really not applicable being classified as applicable. This switch will make all unsupported applicability tests fail instead, which in turn could lead to an applicable package being detected as not applicable instead.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-IncludePhantomDevices*** 

Consider currently disconnected (phantom) devices as well when evaluating relevant packages.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-MachineCharacteristicsOverride*** 

Advanced usage: Pass a Hashtable to override information about the computer that is used to evaluate packages.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

***-Model***

Specify an alternative Lenovo Computer Model to retrieve update packages for. You may want to use this together with ‘-All’ so that packages are not filtered against your local machines configuration.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-NoTestApplicable*** 

Do not check whether packages are applicable to the computer. The IsApplicable property of the package objects will be set to $null. This switch is only available together with -All.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-NoTestInstalled*** 

Do not check whether packages are already installed on the computer. The IsInstalled property of the package objects will be set to $null. This switch is only available together with -All.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-NoTestSeverityOverride***

Packages have a static severity classification, but may also contain a set of tests pertaining to currently installed hardware or drivers that, when passed, dynamically override and adjust the severity rating of a package up or down. By default, this module makes a best effort to parse, understand and check these. Use this parameter to skip all SeverityOverride tests instead and have all packages be returned with their static, default severity classification. This switch is available both with and without -All.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-PassUnsupportedInstallTests*** 

Lenovo specifies different tests with each package to determine whether it is already installed or not. This module makes a best effort to parse, understand and check these. However, new kinds of tests may be added by Lenovo at any point and some currently in use are not supported yet either. By default, any unknown install tests will be treated as failed which may result in a package that is already installed being classified as missing. This switch will make all unsupported install tests pass instead, which in turn could lead to a missing update being detected as installed instead.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-Proxy***

Specifies the URL of a proxy server to use for the connection to the update repository.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $script:LSUClientConfiguration.Proxy
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyCredential*** 

Specifies a user account that has permission to use the proxy server that is specified by the -Proxy parameter.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $script:LSUClientConfiguration.ProxyCredential
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyUseDefaultCredentials*** 

Indicates that the cmdlet uses the credentials of the current user to access the proxy server that is specified by the -Proxy parameter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.ProxyUseDefaultCredentials
Accept pipeline input: False
Accept wildcard characters: False
```

***-Repository*** 

The path to a package repository. This can either be an HTTP(S) URL pointing to a webserver or a filesystem path to a directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Https://download.lenovo.com/catalog
Accept pipeline input: False
Accept wildcard characters: False
```

***-ScratchDirectory*** 

The path to a directory where temporary files are downloaded to for use during the search for packages. These files are cleaned up automatically. Defaults to $env:TEMP.

```yaml
Type: DirectoryInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: $env:TEMP
Accept pipeline input: False
Accept wildcard characters: False
```

***CommonParameters*** 

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

**INPUTS**

**OUTPUTS**

     LenovoPackage 

**NOTES**

**RELATED LINKS**


## Install-LnvUpdate

**SYNOPSIS**

Installs a Lenovo update package. Downloads it if not previously downloaded.

**SYNTAX** 

``` PowerShell
Install-LnvUpdate [-Package] <PSObject> [-Path <DirectoryInfo>] [-SaveBIOSUpdateInfoToRegistry] [-Proxy <Uri>]
 [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
 [<CommonParameters>]
```

**DESCRIPTION**

Installs a Lenovo update package. Downloads it if not previously downloaded.

**EXAMPLES** 

***Example 1***

``` PowerShell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

**PARAMETERS** 

***-Package***

The Lenovo package object to install

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

***-Path***

If you previously downloaded the Lenovo package to a custom directory, specify its path here so that the package can be found

```yaml
Type: DirectoryInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: "$env:TEMP\LSUPackages"
Accept pipeline input: False
Accept wildcard characters: False
```

***-Proxy***

Specifies the URL of a proxy server to use for the connection to the update repository. Used if a package still needs to be downloaded before it can be installed.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.Proxy
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyCredential***

Specifies a user account that has permission to use the proxy server that is specified by the -Proxy parameter.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.ProxyCredential
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyUseDefaultCredentials***

Indicates that the cmdlet uses the credentials of the current user to access the proxy server that is specified by the -Proxy parameter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.ProxyUseDefaultCredentials
Accept pipeline input: False
Accept wildcard characters: False
```

***-SaveBIOSUpdateInfoToRegistry***

If a BIOS update is successfully installed, write information about it to ‘HKLM\Software\LSUClient\BIOSUpdate’. This is useful in automated deployment scenarios, especially the ‘ActionNeeded’ key which will tell you whether a shutdown or reboot is required to apply the BIOS update. The created registry values will not be deleted by this module, only overwritten on the next installed BIOS Update.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***CommonParameters*** 

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

**INPUTS** 

**OUTPUTS** 

      PackageInstallResult

**NOTES** 

**RELATED LINKS**


## Save-LnvUpdate

**SYNOPSIS**

Downloads Lenovo update packages to disk

**SYNTAX**

``` PowerShell
Save-LnvUpdate [-Package] <PSObject> [-Proxy <Uri>] [-ProxyCredential <PSCredential>]
 [-ProxyUseDefaultCredentials] [-ShowProgress] [-Force] [-Path <DirectoryInfo>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

**DESCRIPTION**

Downloads Lenovo update packages to disk

**EXAMPLES**

***Example 1*** 

``` PowerShell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

**PARAMETERS**

***-Force***

Redownload and overwrite packages even if the files already exist in the target path.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***-Package***

The Lenovo package or packages to download

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

***-Path***

The target directory to download the packages to. In this directory, a subfolder will be created for each downloaded package containing its files.

```yaml
Type: DirectoryInfo
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: "$env:TEMP\LSUPackages"
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProgressAction*** 

{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-Proxy*** 

Specifies the URL of a proxy server to use for the connection to the update repository.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.Proxy
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyCredential***

Specifies a user account that has permission to use the proxy server that is specified by the -Proxy parameter.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.ProxyCredential
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyUseDefaultCredentials*** 

Indicates that the cmdlet uses the credentials of the current user to access the proxy server that is specified by the -Proxy parameter.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: $script:LSUClientConfiguration.ProxyUseDefaultCredentials
Accept pipeline input: False
Accept wildcard characters: False
```

***-ShowProgress***

Shows a progress animation during the downloading process, recommended for interactive use as downloads can be quite large and without any progress output the script may appear stuck

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***CommonParameters*** 

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

**INPUTS**

**OUTPUTS**

**NOTES**

**RELATED LINKS**


## Set-LSUClientConfiguration

**SYNOPSIS**

**SYNTAX** 

***Whole (Default)*** 

``` PowerShell
Set-LnvUpdateConfiguration [-InputObject] <LSUClientConfiguration>
 [<CommonParameters>]
```

***Individual***

``` PowerShell
Set-LnvUpdateConfiguration [-Proxy <Uri>] [-ProxyCredential <PSCredential>]
 [-ProxyUseDefaultCredential <Boolean>] [-MaxExternalDetectionRuntime <TimeSpan>]
 [-MaxExtractRuntime <TimeSpan>] [-MaxInstallerRuntime <TimeSpan>]
 [<CommonParameters>]
```

**DESCRIPTION**

Sets global configuration options for LSUClient that may affect multiple cmdlets.

**EXAMPLES**

***EXAMPLE 1***

``` PowerShell
# Disable the default MaxExternalDetectionRuntime
PS> Set-LnvUpdateConfiguration -MaxExternalDetectionRuntime ([TimeSpan]::Zero)
```

***EXAMPLE 2***

``` PowerShell
# Set a maximum allowed installer runtime of 20 minutes
PS> Set-LnvUpdateConfiguration -MaxInstallerRuntime (New-TimeSpan -Minutes 20)
```

***EXAMPLE 3***

``` PowerShell
# Disable a previously configured Proxy
PS> Set-LnvUpdateConfiguration -Proxy $null
```

***EXAMPLE 4***

``` PowerShell
# Apply a previously saved or edited configuration
PS> $config = Get-LnvUpdateConfiguration
PS> # ...
PS> $config | Set-LnvUpdateConfiguration
```

**PARAMETERS**

***-InputObject***

Import and set all configuration options from an LSUClientConfiguration object.

```yaml
Type: LnvUpdateConfiguration
Parameter Sets: Whole
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

***-MaxExternalDetectionRuntime***

Sets a time limit for how long external detection processes can run before they’re forcefully stopped.

```yaml
Type: TimeSpan
Parameter Sets: Individual
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-MaxExtractRuntime***

Sets a time limit for how long package extractions can run before they’re forcefully stopped.

```yaml
Type: TimeSpan
Parameter Sets: Individual
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-MaxInstallerRuntime***

Sets a time limit for how long package installers can run before they’re forcefully stopped. As a safety measure this limit is not applied for installers of firmware or BIOS/UEFI updates.

```yaml
Type: TimeSpan
Parameter Sets: Individual
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProgressAction***

{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-Proxy***

Set the default Proxy URL for all cmdlets to use.

```yaml
Type: Uri
Parameter Sets: Individual
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyCredential***

Specifies the default Proxy user account for all cmdlets to use.

```yaml
Type: PSCredential
Parameter Sets: Individual
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

***-ProxyUseDefaultCredential***

{{ Fill ProxyUseDefaultCredential Description }}

```yaml
Type: Boolean
Parameter Sets: Individual
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

***CommonParameters***

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

**INPUTS** 

**OUTPUTS** 

**NOTES**

**RELATED LINKS**
 