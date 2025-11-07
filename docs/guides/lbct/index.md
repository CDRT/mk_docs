# Lenovo BIOS Certs Tool and Module

## Overview

The Lenovo BIOS Certs Tool and Module is a PowerShell-based solution for working with certificate-based BIOS authentication on supported Lenovo commercial PC products.

## Installing

The Lenovo BIOS Certs Tool and Module package can be installed directly from the PowerShell Gallery.

```powershell
Install-Module 'Lenovo.Bios.Certificates'

Install-Script 'LnvBiosCertInterface'
```

This will install the script to the default script path:

- Windows PowerShell v5: `C:\Users\ {your user name} \WindowsPowerShell\Scripts`
- PowerShell v7: `C:\Users\ {your user name} \Documents\PowerShell\Scripts`

If this is the first time installing a script from the PowerShell Gallery, you will be given the option to establish the default script path and add it to the PATH environment variable.

The GUI script can then be launched in an elevated terminal by running:

```powershell
LnvBiosCertInterface
```

Alternatively, you can download from [here: https://download.lenovo.com/cdrt/tools/lbct_211_108.zip](https://download.lenovo.com/cdrt/tools/lbct_211_108.zip)

Simply unzip to a local folder and run the GUI script in an elevated terminal. The GUI script will locate the module and import it automatically.

## Getting Started

For a detailed view of how to get started using this solution with Lenovo commercial PC products which support it, please visit the following documentation:

- [Getting Started Guide](https://blog.lenovocdrt.com/certificate-based-bios-authentication/)
- [Module Cmdlet Reference](./lbc_module_reference.md)
