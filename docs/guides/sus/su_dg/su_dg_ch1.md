# 1 Overview

The System Update Suite of tools from Lenovo include System Update, Update Retriever, and Thin Installer. Lenovo provides these free utilities to assist in updating drivers, firmware and software for Lenovo PC products running Microsoft® Windows®operating system. This deployment guide will describe how to install and use the current version of each of these programs. This deployment guide is aimed at IT administrators and will describe configurations and best practices for using these tools in a managed environment.

These tools can be downloaded from the following website: [https://support.lenovo.com/us/en/solutions/ht037099](https://support.lenovo.com/us/en/solutions/ht037099)

## 1.1 System Update

System Update is a program that helps keep the software on a system up to date. System Update can identify applicable update packages which are stored on Lenovo's Content Delivery Network globally. Update packages can be applications, device drivers, BIOS and firmware, and software updates. System Update can also be configured to pull updates from a local repository managed by Update Retriever. System Update detects the computer machine type, model number, and other system information to determine whether the system needs the available updates. System Update can display a pick list of update packages where the user can select update packages to download and install. System Update can also be configured to install packages based on a scheduled task. System Update provides a method to defer the installation of update packages. This tool can be configured to search for and download update packages from the following locations:

- Lenovo Support web site
- Repository folder on a local system
- Repository folder on a network share

## 1.2 Update Retriever

Update Retriever is a program that enables an administrator to search for and download updates from the Lenovo Support site to a repository folder on a local drive or network share. The repository folder provides the storage for update packages. System Update or Thin Installer can be configured to search for update packages from the repository folder on a network share instead of searching the Lenovo Support site. With Update Retriever, one can manually initiate the search for update packages, or schedule an automatic search for new update packages at a specified time interval. This allows greater control of the updates that are available to managed devices. Update Retriever can help with the following:

- Downloading updates for specific Lenovo systems according to machine types and operating systems
- Downloading update packages for more than one machine type
- Providing the repository that System Update or Thin Installer can pull from

## 1.3 Thin Installer

Thin Installer is a lighter version of System Update. Unlike System Update, Thin Installer does not require installation, does not create any registry keys, and does not have any services. Thin Installer can search for update packages from a repository folder on a local hard disk drive, a network share, a Web share, or external media such as a CD, DVD, or USB hard disk drive.
