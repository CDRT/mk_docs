---
title: Commercial Vantage
description: Commercial Vantage product guide for enterprise deployment and configuration
---

# Commercial Vantage

!!! note "Updated February 5, 2026"
    The Commercial Vantage product guide has been reorganized and updated for improved usability. Check the [What's New page](./whatsnew.md) for the latest application changes.

## Overview

**Commercial Vantage** simplifies the PC experience, making it easy for users to personalize settings and automate updates.

### Required Components

- **The Application**  
  UWP application providing the user interface. Install from Microsoft Store or sideload using MSIXBUNDLE files. (Uninstall any previous Lenovo Vantage, Companion, or Settings first.)

- **The Add-ins**  
  Middleware components that perform diagnostics, driver, and firmware updates. Automatically updated by Lenovo.

- **Lenovo Vantage Service**  
  Orchestrates functionality between the UI and add-ins. Keeps the application and add-ins current and operational.

- **SU Helper**  
  Command-line utility (introduced 2024) for controlling the System Update process. Installable as a stand-alone tool or with VantageInstaller.exe.

!!! info "Enterprise Package"
    Download the latest Enterprise Package from [Lenovo Support](https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise). Includes deployment scripts, ADMX templates, and installation tools.

## Guide Sections

This guide is intended for IT administrators responsible for deploying and configuring Commercial Vantage in managed environments.

<div class="grid cards" markdown>

- **[What's New](./whatsnew.md)**  
  Latest features, improvements, and policy updates

- **[Deployment](./deployment.md)**  
  Installation methods and VantageInstaller.exe usage

- **[Configuration](./configuration.md)**  
  Group Policy templates and registry settings

- **[Upgrading](./upgrading.md)**  
  Update procedures and ADMX template management

- **[Frequently Asked Questions](./commercial_vantage_faq.md)**  
  Common deployment and update questions

- **[SU Helper Reference](./suhelper.md)**  
  Command-line parameters and usage

</div>

!!! question "Need Help?"
    Have suggestions, comments, or deployment questions? Join the [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg). Our deployment engineers are here to help.
