---
title: Lenovo BIOS Certificate Tool
description: PowerShell-based solution for certificate-based BIOS authentication on Lenovo commercial PCs.
---

# Lenovo BIOS Certificate Tool

The Lenovo BIOS Certificate Tool and Module is a PowerShell-based solution for working with certificate-based BIOS authentication on supported Lenovo commercial PC products. Certificate-based BIOS authentication eliminates the need for a plain-text supervisor password, providing enhanced security for BIOS settings and system configuration management.

## Installation

The Lenovo BIOS Certificate Tool and Module package can be installed directly from the PowerShell Gallery.

```powershell
Install-Module 'Lenovo.Bios.Certificates'

Install-Script 'LnvBiosCertInterface'
```

This will install the script to the default script path:

- Windows PowerShell v5: `C:\Users\{your user name}\WindowsPowerShell\Scripts`
- PowerShell v7: `C:\Users\{your user name}\Documents\PowerShell\Scripts`

If this is the first time installing a script from the PowerShell Gallery, you will be given the option to establish the default script path and add it to the PATH environment variable.

The GUI script can then be launched in an elevated terminal by running:

```powershell
LnvBiosCertInterface
```

Alternatively, you can download from:

[https://download.lenovo.com/cdrt/tools/lbct_211_108.zip](https://download.lenovo.com/cdrt/tools/lbct_211_108.zip)

Simply unzip to a local folder and run the GUI script in an elevated terminal. The GUI script will locate the module and import it automatically.

## Getting started

For a detailed view of how to get started using this solution with Lenovo commercial PC products which support it, please visit the following documentation:

- [Getting Started Guide](https://blog.lenovocdrt.com/certificate-based-bios-authentication/)
- [Module Cmdlet Reference](./lbc_module_reference.md)

## Integration with Think BIOS Config Tool V2

The Lenovo BIOS Certificate Tool works alongside the [Think BIOS Config Tool V2](/guides/tbct_v2/tbct_v2_top.md) to provide a complete password-less BIOS management solution. While LBCT handles certificate-based authentication and WMI command execution, TBCT v2 provides configuration templates and deployment guidance.
