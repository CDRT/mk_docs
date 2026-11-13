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

-   :material-rocket-launch-outline: **[Deploy](../dpm/deploy/index.html)**

    Getting Lenovo commercial PCs out the door with the right drivers, apps and configuration.

    ---

    - [Enterprise Deployment Solutions portal](../dpm/deploy/deployment-portal.html)<br>One page on Lenovo Support that gathers every deployment resource.
    - [Deployment Recipe Cards](../dpm/deploy/recipe-cards.html)<br>Machine types, WQL queries and pack links for a model, on one page.
    - [Hardware Driver Packs and HSA Packs](../dpm/deploy/driver-and-hsa-packs.html)<br>Self-extracting driver bundles for OS deployment, plus HSA packs for Store-restricted builds.

-   :material-update: **[Patch](../dpm/patch/index.html)**

    Keeping Lenovo commercial PCs current with the latest drivers, firmware and BIOS updates.

    ---

    - [Commercial Vantage](../dpm/patch/commercial-vantage.html)<br>The preloaded app for updates and Lenovo settings, fully controlled by IT.
    - [Lenovo.Client.Update](../dpm/patch/lenovo-client-update.html)<br>Find, download and install updates from PowerShell, with signature checks.
    - [Lenovo Updates Catalog](../dpm/patch/updates-catalog.html)<br>Lenovo's third-party catalog for Configuration Manager and WSUS.
    - [Windows Update for Business](../dpm/patch/windows-update-for-business.html)<br>Lenovo drivers and BIOS through Intune driver update policies.

-   :material-tools: **[Manage](../dpm/manage/index.html)**

    Tools and PowerShell modules for configuration, BIOS, update repository automation and docks, built by the CDRT team.

    ---

    - [ThinkVantage PowerShell Library](../dpm/manage/thinkvantage-powershell-library.html)<br>Lenovo's PowerShell modules and scripts on the PowerShell Gallery.
    - [Think BIOS Config Tool V2](../dpm/manage/think-bios-config-tool.html)<br>A PowerShell GUI for BIOS settings, passwords and Intune packages.
    - [Lenovo.Client.Scripting](../dpm/manage/lenovo-client-scripting.html)<br>Utility cmdlets for warranty, BIOS, CVEs, driver packs and logs.
    - [Dock Manager](../dpm/manage/dock-manager.html)<br>Keeps Lenovo dock firmware current and reports dock data to WMI.
    - [Lenovo Device Orchestration](../dpm/manage/device-orchestration.html) <span class="badge new">Formerly Lenovo Device Manager</span><br>Lenovo's cloud endpoint management, with IT Assist.

-   :material-book-open-variant-outline: **[Reference](../dpm/reference/index.html)**

    Documentation, blogs and community resources maintained by the CDRT team.

    ---

    - [CDRT Docs Site](../dpm/reference/docs-site.html)<br>Product guides, BIOS references and scripting examples.
    - [Think Deploy Blog](../dpm/reference/think-deploy-blog.html)<br>How-tos and deep dives from the deployment engineers.
    - [Enterprise Client Management Forum](../dpm/reference/ecm-forum.html)<br>The community board CDRT engineers monitor daily.

</div>

## Product guides and references

Deployment, configuration and troubleshooting guides for each tool, plus the BIOS, dock and scripting references.

<div class="grid cards" markdown>

-   **Commercial Vantage**

    Deployment, configuration, upgrading and the SU Helper reference.

    ---

    [What's new](lcv/whatsnew.md) ·
    [Deployment](lcv/deployment.md) ·
    [Configuration](lcv/configuration.md) ·
    [Upgrading](lcv/upgrading.md) ·
    [SU Helper reference](lcv/suhelper.md) ·
    [FAQ](lcv/commercial_vantage_faq.md)

-   **Lenovo.Client.Update**

    Find, download and install updates from PowerShell.

    ---

    [Installation](lcu/getting-started/installation.md) ·
    [Quick start](lcu/getting-started/quick-start.md) ·
    [LSU vs LCU](lcu/comparison.md) ·
    [Functions](lcu/functions/get-lnvupdate.md)

-   **Dock Manager**

    Deploy dock firmware updates, manually or with Intune.

    ---

    [Deployment guide](dm/dm.md) ·
    [Intune](dm/dm_manage_intune.md) ·
    [Troubleshooting](dm/dm_troubleshooting.md) ·
    [FAQ](dm/dock_manager_faq.md)

-   **Lenovo Updates Catalog**

    Update package data for Configuration Manager, plus the catalog agent.

    ---

    [Catalog](luc/index.md) ·
    [Agent](luc/luc_agnt.md) ·
    [Troubleshooting](luc/luc_ts.md)

-   **Policy Manager for Intune**

    Apply Commercial Vantage policies from Intune.

    ---

    [Read the guide](lcvpm/index.md)

-   **Think BIOS Config Tool V2**

    Configure BIOS settings, with Intune integration.

    ---

    [Tool](tbct_v2/index.md) ·
    [Module reference](tbct_v2/tbc_module_reference.md)

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

-   **ThinkVantage PowerShell Library**

    All of our PowerShell tools and modules.

    ---

    [Overview](thinkvantage/index.md) ·
    [Think BIOS Config Tool V2](tbct_v2/index.md) ·
    [BIOS Certificates Tool](lbct/index.md) ·
    [Lenovo.Client.Scripting](lcsm/lcsm_top.md)

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
