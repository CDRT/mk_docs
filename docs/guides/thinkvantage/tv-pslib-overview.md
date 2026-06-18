# ThinkVantage PowerShell Library

The ThinkVantage PowerShell Library is a collection of PowerShell modules and companion scripts
published to the [PowerShell Gallery](https://www.powershellgallery.com) for managing Lenovo
ThinkPad, ThinkCentre, and ThinkStation devices. It covers driver and firmware updates, BIOS
configuration, and certificate-based BIOS authentication.

**Requirements:** Windows 10/11 · PowerShell 5.0+ · Administrator privileges

---

## Script + Module Solutions

These solutions pair a **standalone script** (graphical or automation-oriented) with a
**supporting PowerShell module**. The script can be installed and run independently, while the
module provides the underlying cmdlets that can also be used directly in your own scripts.

---

### Think BIOS Config Tool + `Lenovo.BIOS.Config`

A WPF-based GUI for interactively viewing, modifying, exporting, and deploying BIOS settings on
Lenovo commercial devices. The companion `Lenovo.BIOS.Config` module exposes cmdlets
(`Export-LnvWmiSettings`, `Import-LnvWmiSettings`) for script-driven BIOS configuration —
enabling INI-based BIOS profiles, Intune remediation package generation, and Supervisor Password
management without the GUI.

```powershell
Install-Script  'ThinkBiosConfigUI'
Install-Module  'Lenovo.BIOS.Config'
```

[:material-book-open: Read the guide](../tbct_v2/tbct_v2_top/)

---

### Lenovo BIOS Certificate Tool + `Lenovo.Bios.Certificates`

A GUI and cmdlet library for replacing Supervisor Password authentication with X.509
certificate-based signing. BIOS configuration commands are cryptographically signed — the private
key never leaves its secure store. Signing can use a local key file or an Azure Key Vault key,
making it suitable for zero-trust and cloud-managed fleet deployments.

```powershell
Install-Script  'LnvBiosCertInterface'
Install-Module  'Lenovo.Bios.Certificates'
```

[:material-shield-lock: Read the guide](../lbct/)

---

### ThinkVantage Repository Manager

A script-based tool for creating and maintaining local repositories of Lenovo updates — a modern
alternative to Update Retriever. This solution leverages the `Lenovo.Client.RepositoryManager`module to perform all the functions of the UI. This means it supports fully automated repository builds which can be used by both `Lenovo.Client.Update` and Commercial Vantage. The script itself can handle installing the module.

```powershell
Install-Script 'ThinkVantageRepositoryManager'
```

[:material-folder-sync: Read the guide](../tvrm/)

---

## Module-Only Solutions

These are standalone PowerShell modules with no companion script. They are designed to be
imported directly into your own scripts, task sequences, or automation pipelines.

---

### `Lenovo.Client.Scripting`

Provides cmdlets for querying device details, searching for driver packs and HSA packs,
identifying CVEs addressed by BIOS updates, and generating Windows Update-friendly driver names.
Designed as a general-purpose automation toolkit for day-to-day Lenovo fleet management.

```powershell
Install-Module 'Lenovo.Client.Scripting'
```

[:material-book-open: Read the guide](../lcsm/lcsm_top/)

---

### `Lenovo.Client.Update`

The official Lenovo fork of the [LSUClient](https://github.com/jantari/LSUClient) project.
Provides cmdlets for discovering, downloading, and installing driver, BIOS/UEFI, and firmware
updates on Lenovo commercial PCs. Supports local repositories, OSD task sequences, WMI
installation history, and digital signature enforcement.

```powershell
Install-Module 'Lenovo.Client.Update'
```

[:material-update: Read the guide](../lcu/)

---

## Other PowerShell Solutions

### LCV Policy Manager

The Lenovo Commercial Vantage Policy Manager is a PowerShell script that provides a UI that simplifies management of Commercial Vantage group policies in Microsoft Intune — removing the need to manually construct large XML policy payloads.

[:material-cog: Read the guide](https://blog.lenovocdrt.com/introducing-commercial-vantage-policy-manager-for-intune/)

---

## Resources

<table>
<tr>
<td><strong>PowerShell Gallery</strong></td>
<td>Search "lenovocdrt" at <a href="https://www.powershellgallery.com">www.powershellgallery.com</a></td>
</tr>
<tr>
<td><strong>Documentation</strong></td>
<td><a href="https://docs.lenovocdrt.com">docs.lenovocdrt.com</a></td>
</tr>
<tr>
<td><strong>Blog</strong></td>
<td><a href="https://blog.lenovocdrt.com">blog.lenovocdrt.com</a></td>
</tr>
<tr>
<td><strong>Community forum</strong></td>
<td><a href="https://forums.lenovo.com/t5/Enterprise-Management-Board/bd-p/sa01_eg">forums.lenovo.com — Enterprise Client Management Board</a></td>
</tr>
</table>
