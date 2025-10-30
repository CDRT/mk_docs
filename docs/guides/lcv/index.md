# Commercial Vantage

**Commercial Vantage** simplifies the PC experience, making it easy for users to personalize settings and automate updates. The following software components are required to take full advantage of the Commercial Vantage features:

- **The Application: Commercial Vantage**

    This UWP application provides the user interface. You can install the application from the Microsoft Store, or you can side-load it using the MSIXBUNDLE files that we provide. Note that any previous version of Lenovo Vantage, Lenovo Companion, or Lenovo Settings must be uninstalled before installing Commercial Vantage.

- **The Add-ins**

    With a UWP application, it is necessary to have additional middleware components that can perform various operations on the system such as performing diagnostics or updating drivers and firmware. These add-ins are automatically updated by Lenovo to fix bugs and provide new features.

- **Lenovo Vantage Service**

    This software component helps to orchestrate the functionality between the UI and the Add-ins. It will also ensure that the application and add-ins are kept up to date and in working order.

- **SU Helper**

    SUHelper.exe is a companion utility introduced in 2024 that works in conjunction with the System Update Addin of Commercial Vantage. This utility finally brings a command-line interface to Commercial Vantage for controlling the System Update process. For more information, please review the [SUHelper Reference](https://docs.lenovocdrt.com/guides/cv/suhelper).  It is also provided in the Enterprise package as a stand-alone installer as well as installable using the [VantageInstaller.exe](http://docs.lenovocdrt.com/guides/cv/commercial_vantage/#using-vantageinstallerexe).

The latest version of the Enterprise package for sideloading can always be found at [https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise](https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise). Additional resources such as deployment guide, ADMX template, install and uninstall scripts are also included.

## Product Guide ## { data-md-hide="toc" }

This guide is intended for skilled IT administrators who are responsible for deploying and configuring **Commercial Vantage** to PCs in their organization.

If you have suggestions, comments, or questions, please post on our forum! Our team of deployment engineers monitors the forum are are ready to help with any deployment challenges you are facing. [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)

This product guide will cover how to deploy, configure and leverage Commercial Vantage in a managed environment. The sections covered are:

[What's New](.\whatsnew.md)

[Deployment](.\deployment.md)

[Configuration](.\configuration.md)

[Upgrading](.\upgrading.md)

[Use Case Scenarios](.\use_case_scenarios.md)

[Frequently Asked Questions](.\commercial_vantage_faq.md)

[SU Helper Reference](.\suhelper.md)
