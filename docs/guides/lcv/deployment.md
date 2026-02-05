# Deployment

Commercial Vantage is a Universal Windows Platform Application that can also be installed directly from the Microsoft Store: [https://www.microsoft.com/store/apps/9NR5B8GVVM13](https://www.microsoft.com/store/apps/9NR5B8GVVM13). However, to fully install the app and its dependencies will require Administrator privileges. Therefore, this is not the recommended method of deploying the app to limited users in a managed environment as it will generate UAC prompts.

For enterprise customers who require installing the app for their users, Lenovo provides an Enterprise Package which contains the files necessary to deploy the application during an OS deployment task sequence or as an application package from a software deployment solution such as Intune or Configuration Manager.

!!! info "Download Enterprise Package"
    The Enterprise Package for Lenovo Commercial Vantage can be found here:
    [https://support.lenovo.com/us/en/solutions/hf003321](https://support.lenovo.com/us/en/solutions/hf003321)

Starting with the Enterprise Package released in July 2025, the VantageInstaller.exe is now provided to simplify the installation of the Commercial Vantage application and its dependencies, as well as the SU Helper utility.

## Using VantageInstaller.exe

VantageInstaller must be executed with Administrator privileges in order to install the application and dependencies. The installation can be controlled by using the following parameters which are **case sensitive**.

### ```[Install | Uninstall]```

Parameter indicates the intention to either install or uninstall the application. It must be specified first and is used in combination with the parameters below

#### ``` -Vantage ```

Indicates the Commercial Vantage app and its dependencies such as Lenovo Vantage Service and the Add-ins. When **uninstalling** the Lite version, it is necessary to specify `-Vantage` instead of `-Lite`.

#### ``` -App ```
Indicates just the Commercial Vantage app and not the Lenovo Vantage Service and Add-ins.

#### ``` -SuHelper ```
Indicates the SU Helper companion utility.

#### ```-Lite```

Indicates just the System Update feature of Commercial Vantage. Can be used in combination with ```-SuHelper```; should not be used with ```-Vantage``` or ```-App```.

!!! info
    When Lite mode is installed, a value will be set in the registry at `HKLM\Software\WOW6432Node\Lenovo\VantageService\DeviceTags` named `System.Profile.CommercialLite`. This will ensure during upgrades that the Lite version will continue to be maintaine dduring upgrades. To switch to the full Commercial Vantage experience, run `VantageInstaller.exe Uninstall -Vantage` to remove Lite and the Vantage Service. This will clear the registry so that `VantageInstaller.exe Install -Vantage` can install the full app.

### ```LogLevel -Debug```

Used to get detailed logging in the console as well as saved to a file specified by ```Output```

### ```Output -Path```

Used to specify the log file to create when using the ```LogLevel -Debug``` parameter.

### Examples

``` \VantageInstaller.exe Install -Vantage -SuHelper ```

Installs both the Commercial Vantage app and dependencies as well as SU Helper utility.

``` \VantageInstaller.exe Uninstall -Vantage ```

Uninstall the Commercial Vantage app and dependencies.

!!!note
    If VantageInstaller.exe is invoked in a PowerShell script, it's recommended to use the call operator (&) as the Start-Process cmdlet can be inconsistent due to argument parsing.

```powershell
& .\VantageInstaller.exe Install -Vantage -SuHelper
$process = Get-Process -Name "Lenovo.Vantage.InstallerHelper" -ErrorAction SilentlyContinue
if ($process) { Wait-Process -Id $process.Id }
```

## Deploying from Configuration Manager or Intune

If you are managing your devices with Configuration Manager or Intune, we have articles that will guide you through deploying Commercial Vantage from these solutions.

- [Deploying Commercial Vantage with ConfigMgr](https://blog.lenovocdrt.com/deploying-commercial-vantage-with-configmgr/)
- [Deploying Commercial Vantage with Intune](https://blog.lenovocdrt.com/deploying-commercial-vantage-with-intune/)
