---
title: Deploy, Patch & Manage
---

<style>
[data-md-color-scheme="slate"] .md-typeset .grid.cards > ul > li{background:#20242c;border-color:#3a4150;box-shadow:0 4px 14px rgba(0,0,0,.45)}
[data-md-color-scheme="slate"] .md-typeset .grid.cards > ul > li:hover{border-color:var(--cd-red)}
</style>

# Deploy, Patch & Manage

The tools and resources the Commercial Deployment Readiness Team builds and maintains to deploy, patch and manage Lenovo commercial PCs in the enterprise.

<div class="grid cards" markdown>

-   :material-rocket-launch-outline: **Deploy**

    Getting Lenovo commercial PCs out the door with the right drivers, apps and configuration.

    ---

    - [Enterprise Deployment Solutions portal](https://support.lenovo.com/us/en/solutions/ht104232)<br>One page on Lenovo Support that gathers every deployment resource.
    - [Deployment Recipe Cards](https://download.lenovo.com/cdrt/ddrc/RecipeCardWeb.html)<br>Machine types, WQL queries and pack links for a model, on one page.
    - [Hardware Driver Packs and HSA Packs](https://download.lenovo.com/cdrt/ddrc/RecipeCardWeb.html)<br>Self-extracting driver bundles for OS deployment, plus HSA packs for Store-restricted builds.

-   :material-update: **Patch**

    Keeping Lenovo commercial PCs current with the latest drivers, firmware and BIOS updates.

    ---

    - [Commercial Vantage](lcv/index.md)<br>The preloaded app for updates and Lenovo settings, fully controlled by IT.
    - [Lenovo.Client.Update](lcu/index.md)<br>Find, download and install updates from PowerShell, with signature checks.
    - [Lenovo Updates Catalog](luc/index.md)<br>Lenovo's third-party catalog for Configuration Manager and WSUS.
    - [Windows Update for Business](https://learn.microsoft.com/en-us/intune/device-updates/windows/manage-driver-updates)<br>Lenovo drivers and BIOS through Intune driver update policies.

-   :material-tools: **Manage**

    Tools and PowerShell modules for configuration, BIOS, update repository automation and docks, built by the CDRT team.

    ---

    - [ThinkVantage PowerShell Library](thinkvantage/index.md)<br>Lenovo's PowerShell modules and scripts on the PowerShell Gallery.
    - [Think BIOS Config Tool V2](tbct_v2/index.md)<br>A PowerShell GUI for BIOS settings, passwords and Intune packages.
    - [Lenovo.Client.Scripting](lcsm/lcsm_top.md)<br>Utility cmdlets for warranty, BIOS, CVEs, driver packs and logs.
    - [Dock Manager](dm/index.md)<br>Keeps Lenovo dock firmware current and reports dock data to WMI.
    - [Lenovo Device Orchestration](https://www.lenovo.com/us/en/solutions/digital-workplace/lenovo-device-orchestration/) <span class="badge new">Formerly Lenovo Device Manager</span><br>Lenovo's cloud endpoint management, with IT Assist.

-   :material-book-open-variant-outline: **Reference**

    Documentation, blogs and community resources maintained by the CDRT team.

    ---

    - [CDRT Docs Site](../index.md)<br>Product guides, BIOS references and scripting examples.
    - [Think Deploy Blog](https://blog.lenovocdrt.com/)<br>How-tos and deep dives from the deployment engineers.
    - [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)<br>The community board CDRT engineers monitor daily.

</div>

## More guides and references

More tool guides, plus the BIOS, dock and scripting references and the frequently asked questions.

<div class="grid cards" markdown>

-   **Policy Manager for Intune**

    Apply Commercial Vantage policies from Intune.

    ---

    [Read the guide](lcvpm/index.md)

-   **ThinkVantage Repository Manager**

    Create and maintain update repositories with PowerShell.

    ---

    [Overview](tvrm/index.md) ·
    [Module reference](tvrm/module_reference.md)

-   **System Update, Update Retriever, Thin Installer**

    The full deployment guide, from installation to the command line reference and appendices.

    ---

    [Overview](sus/su_dg/su_dg_ch1.md) ·
    [Installation](sus/su_dg/su_dg_ch2.md) ·
    [General usage](sus/su_dg/su_dg_ch3.md) ·
    [Troubleshooting](sus/su_dg/su_dg_ch4.md) ·
    [Command line](sus/su_dg/su_dg_ch5.md) ·
    [FAQ](sus/system_update_faq.md)

-   **BIOS Reference**

    Deployment guide, WMI interface, passwords, Secure Boot modes and the settings dictionary.

    ---

    [Deployment guide](../ref/bios/bios_guide.md) ·
    [WMI interface](../ref/bios/wmi/wmi_guide.md) ·
    [Passwords](../ref/bios/passwords.md) ·
    [Secure Boot modes](../ref/bios/secure_boot_modes.md) ·
    [Settings dictionary](../ref/bios/settings/index.md)

-   **Docks Reference**

    The docking deployment guide and Configuration Manager dock queries.

    ---

    [Deployment guide](../ref/docks/docks_main.md) ·
    [Configuration Manager queries](../ref/docks/configmgr_dock_queries.md)

-   **AMD DASH**

    Out-of-band management on AMD systems.

    ---

    [Overview](../ref/dash/index.md) ·
    [Sample scripts](../ref/scripts/samples.md)

-   **Frequently Asked Questions**

    Quick answers, grouped by tool.

    ---

    [System Update](sus/system_update_faq.md) ·
    [Commercial Vantage](lcv/commercial_vantage_faq.md) ·
    [Dock Manager](dm/dock_manager_faq.md)

</div>
