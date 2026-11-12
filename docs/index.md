---
title: Lenovo Commercial Deployment Readiness Team
---

# Find what you need to deploy your Lenovo PCs

Content and documentation for enterprise customers who manage, patch and deploy Lenovo commercial PCs. Pick a task below to get started, or browse the full list of tools and guides under **Product Guides**.

<style>
.cdrt-who{background:var(--cd-head);border-radius:12px;color:#d5d8df;margin:1.5rem 0;padding:.2rem 1.4rem 1rem}
.cdrt-who h2{color:#fff;margin-top:1rem}
.cdrt-who a,.cdrt-who a:hover{color:#fff;text-decoration:underline;text-underline-offset:3px}
.cdrt-who li::marker{color:var(--cd-red)}
.cdrt-who .headerlink{color:#8f96a5}
[data-md-color-scheme="slate"] .cdrt-who{background:#262b36;border:1px solid #454d5e;border-left:4px solid var(--cd-red);color:#e4e6eb;box-shadow:0 6px 20px rgba(0,0,0,.5)}
[data-md-color-scheme="slate"] .md-typeset .grid.cards > ul > li{background:#20242c;border-color:#3a4150;box-shadow:0 4px 14px rgba(0,0,0,.45)}
[data-md-color-scheme="slate"] .md-typeset .grid.cards > ul > li:hover{border-color:var(--cd-red)}
</style>

<div class="cdrt-who" markdown>

## Who we are

The Commercial Deployment Readiness Team is a small group of dedicated professionals inside Lenovo that focus our attention on all things related to deploying and managing our portfolio of commercial PC products. We do not focus on our consumer or SMB portfolio because we simply don't have the time or resources. You may have encountered some of our other work:

- [Think Deploy Blog](https://blog.lenovocdrt.com/)
- [Enterprise Deployment Solutions](https://support.lenovo.com/us/en/solutions/ht104232)
- [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)
- On X (Twitter) [@joe_lenovo](https://www.x.com/joe_lenovo)
- On Bluesky [@joe-lenovo.bsky.social](https://bsky.app/profile/joe-lenovo.bsky.social)

We also try to make it to the popular community events such as [Midwest Management Summit](https://mmsmoa.com/), [Workplace Ninja Summit](https://summit.wpninjas.global/), and [Microsoft Ignite](https://ignite.microsoft.com/en-US/home).

</div>

## Start with a task

<div class="grid cards" markdown>

-   :material-monitor: **Image and deploy a model**

    Deployment recipe cards with the model-specific details: SCCM driver packs, WinPE packs and WMI queries.

    ---

    [Open recipe cards →](https://download.lenovo.com/cdrt/ddrc/RecipeCardWeb.html)
    [Driver & Software Matrix →](https://download.lenovo.com/cdrt/tools/drivermatrix/dm_2.html)

-   :material-update: **Patch drivers, BIOS and firmware**

    Use Lenovo.Client.Update (LCU) to find, download and install driver, firmware and BIOS updates from PowerShell.

    ---

    [LCU guide →](guides/lcu/index.md)
    [Quick start →](guides/lcu/getting-started/quick-start.md)

-   :material-cog-outline: **Configure BIOS settings**

    Look up what a setting does and its WMI name, plus the deployment guide, passwords and Secure Boot modes.

    ---

    [BIOS reference →](ref/bios/index.md)
    [Settings dictionary →](ref/bios/settings/index.md)

-   :material-dock-window: **Manage docks**

    Dock deployment guidance, and Dock Manager to keep dock firmware current.

    ---

    [Docks reference →](ref/docks/docks_main.md)
    [Dock Manager guide →](guides/dm/index.md)

-   :material-powershell: **Automate with PowerShell**

    The ThinkVantage PowerShell Library brings together all of our PowerShell solutions: updates, BIOS settings, scripting utilities and repositories.

    ---

    [ThinkVantage PowerShell Library →](guides/thinkvantage/index.md)
    [Lenovo.Client.Scripting →](guides/lcsm/lcsm_top.md)
    [Repository Manager →](guides/tvrm/index.md)

-   :material-shield-check-outline: **Manage with Intune**

    Manage Lenovo settings from Intune with Commercial Vantage Policy Manager. Think BIOS Config Tool V2 also builds Intune packages for BIOS settings.

    ---

    [Policy Manager →](guides/lcvpm/index.md)
    [Think BIOS Config Tool V2 →](guides/tbct_v2/index.md)

</div>

## Questions or known issues?

The forum and blog are where known issues, answers and new solutions are posted.

<div class="grid cards" markdown>

-   **Consult our forum**

    Ask questions of the deployment engineers in our lab to get quick answers.

    ---

    [Open the forum →](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)

-   **Visit our blog**

    Find articles on innovative solutions for common challenges.

    ---

    [Read the blog →](https://blog.lenovocdrt.com/)

</div>

### Looking for quick answers?

See the frequently asked questions:

- [System Update FAQ](guides/sus/system_update_faq.md)
- [Commercial Vantage FAQ](guides/lcv/commercial_vantage_faq.md)
- [Dock Manager FAQ](guides/dm/dock_manager_faq.md)
