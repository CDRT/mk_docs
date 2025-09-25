---
date:
    created: 2023-07-24
authors:
    - Joe
    - Devin
categories:
    - "2023"
title: Certificate-based BIOS Authentication
cover_image: \img\2023\cert_based_bios_authentication\signed_settings.png
---

Beginning with 2022 ThinkPad models, it is now possible to configure systems to use a digital signing certificate instead of a supervisor password. Although this feature does not eliminate the challenge of initially securing the device, it does eliminate the need to exchange passwords in plain text when scripting BIOS settings changes.
<!-- more -->
To leverage this capability, a new set of WMI methods were introduced as part of the Lenovo WMI BIOS Interface. The usage concept follows these steps:

1. Create a code signing certificate with public key/private key files
1. Provision devices with the certificate
1. Generate a "signed settings string"
1. Call the new method to set the setting on the target device
1. Repeat steps 3 & 4 as needed

To make the process easier, we have created a LnvBiosCerts PowerShell module and the Lenovo BIOS Cert Tool (LnvBiosCertsInterface.ps1) which provides a GUI interface for working with these functions. <!--The current version of this package can be downloaded from [here (LnvBiosCertTool_1.0.2.zip)](https://download.lenovo.com/cdrt/tools/LnvBiosCertTool_1.0.2.zip).-->

A reference guide to the PowerShell module is available at [https://docs.lenovocdrt.com/guides/lbct/index](https://docs.lenovocdrt.com/guides/lbct/index)

## Getting Started

The first step in trying this out will be to generate a compatible code signing certificate. In this article we will use OpenSSL to create the certificate. In this guide we will be using OpenSSL Light for this. This can be installed on an administrator’s system using Winget:

![Install OpenSSL Light](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\installopenssl.png)

Once it is installed, add the path to the CLI tool to the Path environment variable.

```PowerShell
$env:Path += ";C:\Program Files\OpenSSL-Win64\bin"
```

Then run the following command to generate a private key as a .PEM file:

```PowerShell
openssl genrsa -out privateKey.pem 2048
```

![Create certificate](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\createkey.png)

This file should be kept secure with access only given to an administrator. Having access to this file would be analogous to knowing a Supervisor Password.

!!! warning
    It is recommended to use key sizes of 2048 or 4096. Odd sized keys will encounter errors.

Depending on your company's requirements you may need to use .DER file format instead.  These are also supported and can be generated from the .PEM file. This solution does not currently support encrypted keys.

The optional command to convert the .PEM file to a .DER file:

```PowerShell
openssl rsa -in privateKey.pem -inform PEM -out privateKey.der -outform DER
```

A public key can be generated from the private key with the following command:

```PowerShell
openssl rsa -in privateKey.pem -pubout -out publicKey.pem
```

Convert to .DER (optional):

```PowerShell
openssl rsa -pubin -in publicKey.pem -inform PEM -out publicKey.der -outform DER
```

Next we need to generate the X509 Certificate that will be provisioned to the managed devices.

```PowerShell
openssl req -new -x509 -days 7300 -key privateKey.pem -out biosCert.pem -sha256 [-config openssl.cnf]
```

!!! info ""
    If you installed the Lite version of OpenSSL for Windows, the config file will not be there so you can ignore the -config openssl.cnf parameter.

![Create certificate](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\createbioscert.png)

## Deploy the LnvBiosCerts Module

The zip file linked at the beginning of this article contains a subfolder named LnvBiosCerts which contains the PowerShell module. To install the module, you can simply copy that folder to one of the following locations:

```C:\Program Files\WindowsPowerShell\Modules```

or

```C:\Users\<username>\Documents\WindowsPowerShell\Modules```

The first location is preferable as it allows any user or admin process on the machine to access the module.  The second location only makes the module available for that particular user.

![PowerShell Modules Folder](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\screen1.png)

Open a new Administrator PowerShell terminal. This ensures the module just copied to this system will be loaded. If, however, the commands below are not recognized you may need to explicitly import the module with this command:

```PowerShell
Import-Module 'LnvBiosCerts' -force
```

Run the following command in the folder where the **biosCert.pem** file is located to provision the certificate to the system:

```PowerShell
Set-LnvBiosCertificate -Certfile .\biosCert.pem -Password pass1word
```

![PowerShell Modules Folder](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\installcert.png)

!!! info ""
    The -Password parameter passes the current Supervisor Password that exists on the device and this password will be removed and replaced with the certificate. The target device must either have a Supervisor Password already set or must be in the System Deployment Boot Mode with the command being run from a script under WinPE of a PXE boot image.

Reboot the system so that the changes can be finalized.  You may notice a message during reboot that confirms the configuration has changed.

## Generate a Signed Command

On the administrator device which has the private key, generate a signed command.  This can be done using the Lenovo BIOS Certificate Tool user interface by doing the following:

1. Click Generate Signed Command in the left navigation menu
1. Select the method ‘SetBiosSetting’
1. Specify the path to the private key
1. Either enter or select the setting name and value (use the Load WMI Settings button if the current system has the setting needed, otherwise you can type the setting name and value in manually)
1. Click Generate Command
1. Copy the text generated to a text file you can copy to or access from the test device

The signed command can also be generated from the PowerShell terminal by running the following command in the folder where the private key exists:

```PowerShell
Get-LnvSignedWmiCommand -Method SetBiosSetting -SettingName WakeOnLANDock -SettingValue Disable -KeyFile .\privateKey.pem | Out-File .\setting.txt
```

This will generate a text file for you containing the signed command.

<!--
![Generate signed command](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\generatesignedcommand.png)
-->

!!! info ""
    You can generate multiple signed commands to change multiple BIOS Settings. You must also create a signed command that uses the SaveBiosSettings method.  This must be the final command submitted after changing one or more settings to ensure the settings are saved prior to restarting the machine.

## Apply the Signed Command

On the test machine where the certificate has been applied and the LnvBiosCerts module has been installed, run the following command to apply the signed command which can be copied from the text file created in the previous step:

```PowerShell
Submit-LnvBiosChange -Command “(text from text file)”
```

![Apply signed command](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\applycommand.png)

Repeat this step for all the signed commands and make sure the last one applied is the one that references the SaveBiosSettings method. Restart the system for the settings changes to take effect.

## Going Further

The Lenovo BIOS Cert Tool provides an easy to use graphical interface to work with the certificate-based BIOS configuration methods. It provides functions that can be used to configure a device directly as well as a couple of additional functions to convert a settings INI file to a signed settings INI file or to create an unlock code to allow access to BIOS Setup on a device where the certificate is provisioned.

### Installing a certificate

To install a certificate using the Lenovo BIOS Cert Tool, click **Install Certificate** in the left navigation area. Enter the password configured on the device. Systems that launched in 2025 added support for dual certificates since these devices can have a Supervisor Password and a System Management Password. A certificate can be installed to replace each specific password type. Therefore, it is necessary to select the appropriate Password type.

- **Supervisor for single certificate devices**: Use for any device that only implements a Supervisor Password.
- **Supervisor for dual certificate devices**: Use for any device that implements both a Supervisor Password and a System Management Password when installing the certificate to replace the Supervisor Password.
- **System Management for dual certificate devcies**: Use for any device that implements both a Supervisor Password and a System Management Password when installing the certificate to replace the System Management Password.

Next, specify the certificate file to be installed on the device and then click **Install Certificate**. Reboot the device to complete the installation.

![Install Certificate](https://cdrt.github.io/mk_blog/img/2023/cert_based_bios_authentication/installcertificatewindow.png)

### Generate Signed Command

There are several different methods that can be called using the WMI BIOS interface and the commands can be signed so they will be accepted on devices which have the appropriate certificate provisioned.

To create the properly formatted command string, click **Generate Signed Command** in the left navigation area and enter the details needed. Specify the signing key to use and select a method to be called. By selecting the method to use, the necessary **Aditional Parameters** can be highlighted.

If you select the SetBiosSetting method, then you will need to select a Setting Name and a Setting Value. Click the **Load WMI** to load the available settings and their possible values from the device. The other controls will be disabled and are not needed in this scenario. The controls will be enabled based on the method selected.

Clicking **Generate Command** will populate the text box next to it with the signed command text. Double-clicking the text will copy the command to the clipboard and allows you to paste it on the **Apply Signed Command** panel so it can be applied on the device the tool is running on.

The possible methods are:

- **SetBiosSetting** : set a specific setting to a selected value
- **SaveBiosSetting** : save a changed setting - this needs to called after one or more settings have been changed
- **ClearBiosCertificate** : removes the provisioned BIOS certificate and leaves the device in state that does not require any authentication - this requires specifying the serial number of the device to ensure the command is only applied to the correct device since it reduces the security of the device
- **ChangeBiosCertificateToPassword** : removes the provisioned BIOS certificate and replaces it with the specified Password - make sure the Certificate Type and Password used correspond to the desired certificate to be replaced
- **UpdateBiosCertificate** : replaces a provisioned certificate with a new certificate
- **LoadDefaultSettings** : method to return the device settings back to the original default values - excluding Security settings
- **SetFunctionRequest** : method to perform a selected action - possible actions are:
    - **ClearSecurityChip** : clears the TPM
    - **ResetFingerprintData** : clears any stored fingerprint data
    - **ResettoSetupMode** : resets the Secure Boot mode back to the Setup Mode
    - **RestoreFactoryKeys** : reloads the factory Secure Boot keys
    - **ClearAllSecureBootKeys** : removes all Secure Boot keys
    - **RestoreSystemToFactoryDefaults** : restores the Factory default values, including Security settings

![Generate Signed Command](https://cdrt.github.io/mk_blog/img/2023/cert_based_bios_authentication/signcommandwindow.png)

### Apply Signed Command

Clicking **Apply Signed Command** opens the panel that allows you to paste in the signed command from the **Generate Signed Command** panel. You may also enter multiple commands to be applied at once (eg. a SetBiosSetting command and a SaveBiosSetting command) or specify an INI file generated from the Think BIOS Config Tool. These commands will be applied to the device the tool is currently running on.

![Apply Signed Command](https://cdrt.github.io/mk_blog/img/2023/cert_based_bios_authentication/applysignedcommand_v2.png)

### Working with Think BIOS Config Tool

The Think BIOS Config Tool is a separate tool that provides the ability to list all the available settings and values on a system. The settings can be configured as desired and an INI file can be generated with changed settings. The Lenovo BIOS Certificate Tool can convert one of these INI files into a text file containing the signed WMI commands to apply the settings.

![Convert Config File Window](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\convertconfigfile_v2.png)

The generated file can be used on the ***Apply Signed Command*** page of the Lenovo BIOS Certificate Tool or can easily be incorporated into your own PowerShell script.

### Unlocking System Secured with Certificate

When a system is secured with a certificate, you cannot access BIOS Setup directly on the machine using a Supervisor Password. Therefore, there is a different process to unlock a machine to access BIOS Setup.

1. Technician boots the system pressing F1 to enter BIOS Setup.
1. Insert a USB key to save a BIOS Unlock File to
1. Click "Generate Unlock Code"
1. Send BIOS Unlock File to administrator
1. Administrator uses Lenovo BIOS Cert Tool to generate Unlock Code by specifiying Private Key File and Unlock File.
1. Administrator sends Unlock Code to Technician
1. Technician enters Unlock Code and continues to BIOS Setup

![Unlock BIOS Window](https://cdrt.github.io/mk_blog/img\2023\cert_based_bios_authentication\unlockbios_v2.png)

## Final Notes

### Clearing certificate

If you are clearing the certificate from multiple machines, it makes more sense to change the certificate to a temporary password instead of just removing the certificate. Generating a **ClearBiosCertificate** command requires the machine serial number which means there is a unique command for each machine.

**ChangeBiosCertificateToPassword** would be a general command for all machines with that certificate which will replace the certificate with a password you specify. This will leave the devices in a secure, managable state also.

### Installing Module to auto load

By placing the **LnvBiosCerts** folder in the **%Program Files%\WindowsPowershell\Modules** folder, the module will auto load when a PowerShell window is started.

### Limitations

The **SetFunctionRequest** method has a limitation regarding the ***ResetSystemToFactoryDefaults*** BIOS function. The method will not be able to call this function with a certificate installed on the machine.
