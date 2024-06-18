# Glossary of Terms #

### Administrator (hard disk) Password

Hard disk password, available if `Dual Password` is enabled.
- ThinkPad: Admin + User password
- ThinkCentre & Thinkstation: Master + User passwords.

Admin and Master are synonyms.

*More information:*
- ["Types of password for ThinkPad" at Lenovo Support](https://support.lenovo.com/lt/en/solutions/ht036206-types-of-password-for-thinkpad)
- [BIOS Security Settings](https://docs.lenovocdrt.com/#/bios/bios_guide?id=bios-security-settings)

*Relevant settings:*
- [Hard Disk Password (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password)
- [Password Policies (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/password_policies) 
- [NVMe1 Password (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/password) 

---

### AHC 

  Advanced Host Controller Interface 
 
 *More information:* 
 - ["Serial ATA AHCI: Specification" at Intel.com](https://www.intel.com/content/www/us/en/io/serial-ata/serial-ata-ahci-spec-rev1-3-1.html) 
 
 *Relevant settings:* 
 - [Configure SATA As (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/ata_drive_setup) 

*See also:*

[RAID](https://docs.lenovocdrt.com/#/bios/glossary?id=raid), [SATA](https://docs.lenovocdrt.com/#/bios/glossary?id=sata)

---

### AMT 

  Intel® Active Management Technology
 
 Remote management solution from Intel®. 
 
*More information:* 
 - ["Intel® Active Management Technology" at Intel.com](https://www.intel.com/content/www/us/en/architecture-and-technology/intel-active-management-technology.html) 

 *Relevant settings:* 
 - [Intel® Manageability (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/intel_r_manageability) 
 - [Intel® AMT Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/intelramt) 
 - [Onboard Ethernet Controller (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/network_setup) 
  
*See also:*

[MEBx](https://docs.lenovocdrt.com/#/bios/glossary?id=mebx)

---

### ASPM 

  Active State Power Management 
 
PCI Express power management for power saving while fully active.

 *More information:* 
 
 - [More information at PCISIG.com](https://pcisig.com/specifications/pciexpress/specifications/)

 *Relevant settings:* 

 - [ASPM Support](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/pci_express_configuration) 

*See also:*

[PCIe](https://docs.lenovocdrt.com/#/bios/glossary?id=pcie)

---

### ATA 

  Advanced Technology Attachment (Hard Disk Drive)

 A hard disk drive with an integrated controller. Usually implemented as a serial drive (SATA).
 
 *More information:* 
 
   - ["Developers Can Trust Intel Leadership in Serial ATA" at Intel.com](https://www.intel.com/content/www/us/en/io/serial-ata/serial-ata-developer.html) 

 *Relevant settings:* 
 - [SATA Controller](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/ata_drive_setup) 
 - [SATA Drive {Number} Password](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password) 
 - [First Boot Device](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password) 

*See also:*

[SATA](https://docs.lenovocdrt.com/#/bios/glossary?id=sata), [HDD](https://docs.lenovocdrt.com/#/bios/glossary?id=hdd)

---

### Audit mode

 Enables programmatic discovery of signature list combinations that successfully authenticate installed EFI images without the risk of rendering a system unbootable.
 
 Chosen signature lists configurations can be tested to ensure the system will continue to boot after the system is transitioned out of Audit Mode.
 
 *More information:* 
 - [UEFI Specification Version 2.9 (March 2021) at UEFI.org](https://uefi.org/sites/default/files/resources/UEFI_Spec_2_9_2021_03_18.pdf) 

 *Relevant settings:* 
 - [Enter Audit Mode (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/secure_boot?id=enter-audit-mode) 


*See also:*

[Custom mode](https://docs.lenovocdrt.com/#/bios/glossary?id=custom-mode), [Setup Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=setup-mode)

---

### BIOS 


  Basic Input/Output System
  
  Overrides user OS permissions to access settings in all cases; has no access to OS settings.
 
 *More information:* 
  - ["What Is BIOS?" at Lenovo Support](https://support.lenovo.com/lt/en/videos/vid100790-what-is-bios) 
 
*See also:*

[UEFI](https://docs.lenovocdrt.com/#/bios/glossary?id=uefi)

---

### BIOS Self-healing 

 BIOS is programmed to restore the machine to its previous state through an uncorrupted, secure backup. 

*More information:*

 - [More information at Lenovo.com](https://www.lenovo.com/origind8/sites/default/files/2019-09/ThinkShield_SolutionsGuide_FINAL.pdf)

*Relevant settings:* 
 - [BIOS Self-healing (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/advanced.md)

---

### CA 

  Certification Authority
 
Organization that verifies identity and issues public key certificates to parties.

 *More information:* 
  - ["Windows Secure Boot Key Creation and Management Guidance" at Microsoft.com](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-secure-boot-key-creation-and-management-guidance) 
  - [More information at UEFI.org](https://uefi.org/sites/default/files/resources/UEFI_Plugfest_2013_-_New_Orleans_-_Microsoft_UEFI_CA.PDF)
 
 *Relevant settings:* 
 - [Allow Microsoft 3rd Party UEFI CA (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/secure_boot) 
 - [TLS Auth Configuration (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/network_setup) 

*See also:*

[UEFI](https://docs.lenovocdrt.com/#/bios/glossary?id=uefi)

---

### C State

 Core Power States 
 
 A series of states numbered 0 to n, where each successive lower state number represents lower power consumption. 
 
*More information:* 
 - ["C-State" at Intel.com](https://www.intel.com/content/www/us/en/develop/documentation/vtune-help/top/reference/energy-analysis-metrics-reference/c-state.html) 
 
*Relevant settings:* 
 - [C State Support (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/cpu_setup) 
 


---

### Custom Mode
 
  Custom Mode allows a user to install their own set of keys. The specifications for Secure Boot state allow a boot to occur in Custom Mode without a PK. This allows an OS to enroll a new PK which would then be used to validate its own KEK, db, and dbx.
  
  *More information:*

   - [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht507181-how-to-enable-the-secure-boot-option-in-uefi-setup-lenovo-flex-system-x240-m5-compute-node-9532#Additional_Information_HT)
  
  *Relevant settings:* 
  - [Secure Boot Key State](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/secureboot) 
 
 [Deployed Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=deployed-mode), [Setup Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=setup-mode)

---

### DASH 

  Desktop and mobile Architecture for System Hardware
 
 Secure out-of-band and remote client management standard. 
 
 *More information:* 
   - [DASH article at Lenovo CDRT](https://docs.lenovocdrt.com/#/dash/dash_top) 
  -  ["Desktop and Mobile Architecture for System Hardware" at DTMF.org](https://www.dmtf.org/standards/dash) 


---

### Deployed mode

In Deployed Mode, PK must be installed and the BIOS performs signature verification on programmatic attempts to update policy objects.

 *Relevant settings:* 
- [Enter Deployed Mode (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/secure_boot.md)

*See also:*

[Setup Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=setup-mode), [Custom Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=custom-mode)

---

### DHCP 

  Dynamic Host Configuration Protocol 
 
 Network management protocol used on Internet Protocol (IP) networks for automatically assigning IP addresses and other communication parameters to devices connected to the network using a client-server architecture. 
 
 *More information:* 
 
 - [More information at Microsoft.com](https://learn.microsoft.com/en-us/windows-server/networking/technologies/dhcp/dhcp-top)
 
 *Relevant settings:* 
 - [Lenovo Cloud Services (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 



---

### DPTF 

  Dynamic Platform and Thermal Framework 

Intel Dynamic Platform and Thermal Framework (IDPTF) is a power and thermal management solution. It is used to resolve fan noise, overheating, and performance-related issues of the system.

 *Relevant settings:* 

 - [Intel (R) DPTF Support (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/advanced.md)

---

### DRAM 

  Dynamic Random-Access Memory 
 
 Random-access semiconductor memory that stores each bit of data in a memory cell, usually consisting of a tiny capacitor and a transistor, both typically based on metal-oxide-semiconductor technology. 
 
 *More information:* 

 - [More information at Lenovo.com](https://www.lenovo.com/ca/en/faqs/pc-life-faqs/what-is-ddr4-ram/)

 *Relevant settings:* 

 - [Intel(R) Total Memory Encryption (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/memoryprotection.md)

---

### EAP 

  Extensible Authentication Protocol 

 Authentication framework supporting multiple authentication methods. 

 *More information:* 
 - ["Extensible Authentication Protocol (EAP)" at IETF.org](https://datatracker.ietf.org/doc/html/rfc3748) 
 - ["802.1X Overview and EAP Types" at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000006999/wireless/legacy-intel-wireless-products.html) 

 *Relevant settings:* 
 - [EAP Authentication Method (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 

*See also:*

[PEAP](https://docs.lenovocdrt.com/#/bios/glossary?id=peap-eap)

---

### EEPROM 

Electrically Erasable Programmable Read-Only Memory
 
 Non-volatile memory storing relatively small amounts of data by allowing individual bytes to be erased and reprogrammed. 
  
 *Relevant settings:* 
 - [MAC Address Pass Through (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 


---

### EFI 

Extensible Firmware Interface

Used in the context of HTTPS Boot.
  
 *Relevant settings:* 
 - [Delete HTTPs Boot Option from List (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/network_setup?id=delete-https-boot-option-from-list) 


*See also:*

[UEFI](https://docs.lenovocdrt.com/#/bios/glossary?id=uefi)

---

### EIST 

  Enhanced Intel SpeedStep® Technology 
 
 Dynamically adjusts processor voltage and core frequency, to decrease average power consumption and heat production. 
 
  *More information:* 
 - ["Overview of Enhanced Intel SpeedStep® Technology for Intel® Processors"at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000007073/processors.html) 

 *Relevant settings:* 
 - [EIST Support (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/cpu_setup)

---

### EPP 

  Enhanced Parallel Port 
 
 A high-speed bi-directional mode for non-printer peripherals. 
 
 *More information:* 

 - [More information at IEEE.org](https://standards.ieee.org/ieee/1284/1956/)

 *Relevant settings:* 
 - [Parallel Port Mode & EPP Version (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/parallel_port_setup.md)


---

### Flash BIOS

  Updating the BIOS.
   
   *More information:* 
   - ["How to update BIOS" at Intel.com](https://www.intel.com/content/www/us/en/gaming/resources/how-to-update-bios.html) 

   *Relevant settings:* 
   - ["How to update system BIOS - Windows" at Lenovo.com](https://support.lenovo.com/uu/en/solutions/ht500008-how-to-update-system-bios-windows) 
   - [Flash BIOS Updating by End-Users (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/uefibiosupdate.md) 
  

---

###  Form Factor
  
  The size and spatial design of the computer and its individual components. Broadly similar or the same across a model line. 
   

---

### GPU 

Graphics Processing Unit

Specialized processor originally designed to accelerate graphics rendering, able to process many pieces of data simultaneously, useful for machine learning, video editing, and gaming applications, and may be integrated into the computer’s CPU or offered as a discrete hardware unit.
 
 *More information:* 
  - ["What Is a GPU?" at Intel.com](https://www.intel.com/content/www/us/en/products/docs/processors/what-is-a-gpu.html) 

 *Relevant settings:* 
 - [PCIe Tunneling (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/thunderbolttm4.md) 

*See also:*

[UMA](https://docs.lenovocdrt.com/#/bios/glossary?id=uma)

---

### HDD 

  Hard Disk Drive 
 
 *More information:* 
 - ["Laptop Hard Drives, SSD & Storage" at Lenovo.com](https://www.lenovo.com/us/en/faqs/laptop-faqs/hard-drives-ssd-guide/) 
 
 *Relevant settings:* 
 - [First Boot Device (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/startup.md) 
 - [Boot Priority Order (THinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/startup.md) 

*See also:*

[ATA](https://docs.lenovocdrt.com/#/bios/glossary?id=ata), [HDP](https://docs.lenovocdrt.com/#/bios/glossary?id=hdp), [RST](https://docs.lenovocdrt.com/#/bios/glossary?id=rst), [SATA](https://docs.lenovocdrt.com/#/bios/glossary?id=sata)


---

### HDP 

  Hard Disk Password 
 
 Prevents unauthorized access to the data on the storage drive. Some models may support dual passwords, with a user password and an administrator password. 
 
 *More information:* 

 <!-- TODO --> 

 *Relevant settings:* 
 - [Require HDP on System Boot (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password) 
 - [Hard Disk Password (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password) 
 
*See also:*

[HDD](https://docs.lenovocdrt.com/#/bios/glossary?id=hdd)

---

### IOMMU 

   Input-Output Memory Management Unit
 
 Hardware assisted address translation from I/O device virtual addresses to physical addresses, to improve the system performance in virtual environments. 
 
 *More information:* 
 - [More information at Lenovo.com](https://lenovopress.lenovo.com/lp1467.pdf) 
 
 *Relevant settings:* 
 - [Device Guard (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/security) 
 - [Device Guard (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/deviceguard) 


---

### IRQ 

  Interrupt Request Line
 
 Hardware line allowing devices to take over processor resources for their function. IRQs are assigned numbers to prioritize devices. 
 
 *Relevant settings:* 
 - [Parallel Port IRQ (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/parallel_port_setup) 
 - [Serial Port Setup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/serial_port_setup) 
 

---

### ITC 

  Imaging Technology Center

 Lenovo's Cloud Deployment solutions. 
 
 *More information:* 
  - ["Welcome to Lenovo Cloud Deploy" at lenovoclouddeploy.com](https://www.lenovoclouddeploy.com/en/auth/welcome) 
  - ["CLOUD RECOVERY FROM THE LENOVO CLOUD" at Lenovo.com](https://static.lenovo.com/na/services/pdfs/4390_Cloud_Imaging_Flyer_FINAL_High_Res.pdf) 
 
 *Relevant settings:* 
 - [Lenovo Cloud Services (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 


---

### Lenovo Diagnostics
 
  Tool for testing Lenovo computers. Composed from Modules (diagnostics for a group of devices), tools for creating custom diagnostic scripts, system information, and log history. 

  *More information:* 
   - ["Lenovo Diagnostics for Windows" at Lenovo PC Support](https://pcsupport.lenovo.com/us/en/downloads/ds102687) 
  
  *Relevant settings:* 
  - [Intel® Total Memory Encryption (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/memoryprotection) 
 

---

### Magic Packet

 Network packet specific to the network card, used in the Wake On LAN feature. 

 *More information:* 
  
 - [More information at Microsoft.com](https://learn.microsoft.com/en-us/mem/configmgr/core/clients/deploy/configure-wake-on-lan)

 *Relevant settings:* 
 - [Wake On Lan (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 
  

---

### (M)HDP 

  (Master) Hard Disk Password. 

*AKA:*

Admin (hard disk) password.

 *Relevant settings:* 
 - [Hard Disk Password (ThinkStation)](https://docs.lenovocdrt.com/#/bios/settings/thinkstation/hard_disk_password.md) 

*See also:*

[HDD](https://docs.lenovocdrt.com/#/bios/glossary?id=hdd)

---

### MDT 

  Microsoft Deployment Toolkit 
 
 *More information:*
 - ["Microsoft Deployment Toolkit documentation" at Microsoft.com](https://docs.microsoft.com/en-us/mem/configmgr/mdt/) 
 - ["Lenovo BIOS/UEFI Deployment Guide" at Lenovo CDRT](https://docs.lenovocdrt.com/#/bios/bios_guide)

---

### MEBx 

   Intel® Management Engine BIOS Extension

A BIOS menu extension on the Intel® AMT system that can be used to view and manually configure some of Intel® AMT settings. 

 *More information:* 
  - [More information at Intel.com](https://www.intel.com/content/dam/support/us/en/documents/software/software-applications/Intel_SCS_Deployment_Guide.pdf) 

 *Relevant settings:* 
 - [Intel® MEBx (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/intel_r_manageability) 

*See also:*

[AMT] (https://docs.lenovocdrt.com/#/bios/glossary?id=amt)

---

### ME 

  
 Intel ® Management Engine

 An embedded microcontroller providing features including OOB (out of band) management. 

 *More information:* 
 - [More information at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000008927/software/chipset-software.html) 

 *Relevant settings:* 
 - [Enhanced Power Saving Mode (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/power) 

*See also:*

[OOB](https://docs.lenovocdrt.com/#/bios/glossary?id=oob)

---

### MemTest86 

  Commonly used memory (RAM) testing application. 
 
 *More information:* 
  - [More information at memtest86.com](https://www.memtest86.com/) 
 
 *Relevant settings:* 
 - [Intel(R) Total Memory Encryption (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/memoryprotection) 


---

### MFG (mode) 

  Manufacturing Mode 
 
  *Relevant settings:* 
 - [Security Chip (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/securitychip) 


---

### NFC 

  Near-Field Communication

 *More information:* 

 - [More information at Lenovo.com](https://techtoday.lenovo.com/origind8/sites/default/files/2019-05/Workforce%20Mobility_Static%20Infographic_042618.pdf)

 *Relevant settings:* 
 - [NFC Device (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/ioportaccess) 


---

### NIC 

  Network Interface Controller / Card
  
 *More information:* 

 - ["Dock Deployment Guide" at Lenovo CDRT](https://docs.lenovocdrt.com/#/docks/docks_main.md)
 - ["Lenovo and AMD DASH Management" at Lenovo CDRT](https://docs.lenovocdrt.com/#/dash/dash_top.md)

 *Relevant settings:* 
 - [MAC Address Pass Through (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 
 


---

### NVMe 

Non-Volatile Memory Host Controller Interface Specification

Open, logical-device interface specification for accessing a computer's non-volatile storage media, usually attached via PCI Express bus. 
  
 *More information:* 
 
 - [More information at nvmexpress.org](https://nvmexpress.org/)

 *Relevant settings:* 
 - [NVMe1 Password (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/password) 
 - [Network Boot (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/startup) 

*See also*

[ATA](https://docs.lenovocdrt.com/#/bios/glossary?id=ata)

---

### ODM 

  Original Design Manufacturer 
 
A company that designs and manufactures a product that is eventually rebranded by another firm for sale.

 *More information:* 
  - ["Lenovo CSP Is For You!" at Lenovo YouTube](https://www.youtube.com/watch?v=2dFgkv2OQ5Y)   
  - ["Lenovo's Secret Recipe For Hyperscale Success Is Called ODM+" at Forbes.com](https://www.forbes.com/sites/patrickmoorhead/2018/10/22/lenovos-secret-recipe-for-hyperscale-success-is-called-odm/) 

---

### OEM 

  Original Equipment Manufacturer  
 
 A company that manufactures products that it has designed from purchased components and sells those products under the company's brand name. 
 
 *More information:* 
 
- [More information at Microsoft Docs](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-highly-secure)

 *Relevant settings:* 

 - [Secure Core PC Level3 (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/security.md)

---

### OOB 

  Out-of-band

 As in Out-of-band management, hardware-based features that enable remotely manage devices, even when powered down.

 *More information:* 
 
 - [More information at Intel.com](https://www.intel.com/content/www/us/en/business/enterprise-computers/resources/out-of-band-management.html)

*See also:*

[ME](https://docs.lenovocdrt.com/#/bios/glossary?id=me)

---

### Optane™

Standalone memory device that combines storage capacity and system acceleration.
 
 *More information:* 
  - ["Intel® Optane™ Memory - Responsive Memory, Accelerated Performance"at Lenovo.com](https://www.intel.com/content/www/us/en/products/details/memory-storage/optane-memory.html) 

 *Relevant settings:* 
  - [ATA Drive Setup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/ata_drive_setup) 


---

### OSD 

  Operating System Deployment 
 
 *More information:* 
 
 - ["Dock Deployment Guide" at Lenovo CDRT](https://docs.lenovocdrt.com/#/docks/docks_main.md)
 - ["Enterprise Deployment Solutions" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht104232)



---

### PCIe

PCI (Peripheral Component Interconnect) Express

Serial expansion bus standard.

*More information:*

 - [More information at PCISIG.com](https://pcisig.com/)

*Relevant Settings*

 - [PCIe Tunneling (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/thunderbolttm4.md)

*See also:*

[ASPM](https://docs.lenovocdrt.com/#/bios/glossary?id=aspm), [GPU](https://docs.lenovocdrt.com/#/bios/glossary?id=gpu)

### PCR 

  Platform Configuration Register

 A memory location in the TPM, for storing security metrics. 
 
 *More information:* 
 
  - [More information at Microsoft Support](https://learn.microsoft.com/en-us/windows/security/information-protection/tpm/switch-pcr-banks-on-tpm-2-0-devices)
 
 *Relevant settings:*  
 - [Security Chip (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/securitychip) 

*See also:*

[TPM](https://docs.lenovocdrt.com/#/bios/glossary?id=tpm)

---

### PEAP / EAP 

  (Protected) Extensible Authentication Protocol
 
EAP is an authentication framework that supports multiple authentication methods. PEAP adds security services to those EAP methods that EAP provides.

 *More information:* 
 
 - [More information at Microsoft.com](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-peap/73da9658-3dc6-4b97-9c0f-532f6a9b814d)

 *Relevant settings:* 
 - [Security (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network.md) 


---

### PK 

  Platform Key 

  The public key used in Secure Boot.

 *More information:* 
  - ["Key Management" at Lenovo CDRT](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/secureboot?id=key-management) 

 *Relevant settings:* 
 - [Enter Audit Mode (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/secure_boot?id=enter-audit-mode) 
 - [Key Management (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/secureboot.md)


---

### Platform

 
  A specific combination of hardware and software. 

  *Relevant settings:*
  - [Intel (R) SIPP Support (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/advanced) 
 
 

---

### POP 

  Power On Password 

 Allows the computer to power on directly to a password prompt but go no further until the correct password is entered. 
 
 *More information:* 
 - [BIOS Guide](https://docs.lenovocdrt.com/#/bios/bios_guide) 
 
 *Relevant settings:*
 - [Password Policies (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/password_policies) 

*See also:*

[SVP](https://docs.lenovocdrt.com/#/bios/glossary?id=svp), [SMP](https://docs.lenovocdrt.com/#/bios/glossary?id=smp)

---

### POST 

  Power On Self Test 

 Process of testing and initializing memory, devices, and (depending on model) software required by OS, immediately after power on and before OS is loaded. 
 
 *More information:* 

  - [More information at Intel.com](https://www.intel.com/content/www/us/en/gaming/resources/why-wont-my-computer-turn-on.html)

 *Relevant settings:* 
 - [Password Count Exceeded Error (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/password_policies) 
 - [USB Enumeration Delay (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/usb_setup) 

---

### Predesktop

The Rescue and Recovery Predesktop Area provides an emergency workspace for users who are unable to start Windows on their computers. Running under Windows PE (Preinstallation Environment), the environment offers the Windows look, feel, and function and helps users solve problems without consuming IT staff time.
  
  *More information:* 

  - [More information at Lenovo.com](https://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkvantage_en/rnr421mst.pdf)
  
  *Relevant settings:* 
  - [Predesktop Authentication (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/fingerprint.md)
 

---

### PXE 

  Preboot eXecution Environment 

 Method for booting computers using a network interface, independent of local storage devices or installed operating systems. 
 
 *More information:* 
  - ["Preboot Execution Environment (PXE)" at Microsoft.com](https://learn.microsoft.com/en-us/previous-versions/ms818762(v=msdn.10\)) 
 
 *Relevant settings:* 
 - [Network Setup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/network_setup) 
 - [Network Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network)
 - [Network Boot (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/startup)  

*See also:*

[UNDI](https://docs.lenovocdrt.com/#/bios/glossary?id=undi)

---

### RAID 

  Redundant Array of Independent Disks 

 A standard configuration of multiple, redundant hard disks into logical units for scale and reliability. 
 
 *More information:* 
  - ["Common RAID Disk Data Format (DDF)" at Storage Networking Industry Association](https://www.snia.org/tech_activities/standards/curr_standards/ddf) 

 *Relevant settings:* 
 - [ATA Drive Setup(ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/ata_drive_setup) 

*See also:*

[ATA](https://docs.lenovocdrt.com/#/bios/glossary?id=ata), [Optane™](https://docs.lenovocdrt.com/#/bios/glossary?id=optane%e2%84%a2)

---

### RST 

  Rapid Storage Technology 
 
Gives enhanced performance and lower power consumption. When using more than one drive, gives additional protection against data loss in the event of a hard drive failure.

 *More information:* 
 
 - [More information at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000005610/technologies.html)

 *Relevant settings:* 
 - [Configure SATA As (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/ata_drive_setup) 


*See also:*

[RAID](https://docs.lenovocdrt.com/#/bios/glossary?id=raid), [Optane™](https://docs.lenovocdrt.com/#/bios/glossary?id=optane%e2%84%a2) 

---

### SATA 

  Serial AT ("Advanced Technology") Attachment 

 Standard interface between computer bus and storage devices. 

 *More information:* 
  - ["Developers Can Trust Intel Leadership in Serial ATA" at Intel.com](https://www.intel.com/content/www/us/en/io/serial-ata/serial-ata-developer.html) 

 *Relevant settings:* 
 - [ATA Drive Setup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/ata_drive_setup) 
 - [Startup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/startup) 

*See also:*

[ATA](https://docs.lenovocdrt.com/#/bios/glossary?id=ata), [HDD](https://docs.lenovocdrt.com/#/bios/glossary?id=hdd)

---

### (SC)CM 

  Configuration Manager or System Center Configuration Manager 
 
 *More information:* 

  - ["What is Configuration Manager?" at Microsoft.com](https://learn.microsoft.com/en-us/mem/configmgr/core/understand/introduction)
  - ["What happened to System Center Configuration Manager?" at Microsoft.com](https://learn.microsoft.com/en-us/mem/configmgr/core/understand/what-happened-to-sccm)
 
---

### SDB(M) 

  System Deployment Boot Mode 

 Enables programmatic configuration of key security BIOS settings during operating system deployments. 

 *More information:* 
  - ["System Deployment Boot Mode" at Lenovo CDRT](https://docs.lenovocdrt.com/#/bios/sdbm) 

---

### Security Chip
 
  A type of Trusted Platform Module (TPM) implemented as a separate chip. 
  
  *Relevant settings:* 
 
 - [Security Chip Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/securitychip.md)

 *See also:*
 
 [TPM](https://docs.lenovocdrt.com/#/bios/glossary?id=tpm)

*AKA:*

TPM

---

### SEL 

  System Event Log 
 
 *Relevant settings:* 
 - [System Event Log (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/system_event_log) 


---

### Setup mode

 Enables installation of Platform Key and customization of Secure Boot signature databases.
  
  *More information:* 
  
 - [More information at microsoft.com](https://learn.microsoft.com/en-us/powershell/module/secureboot/)

  *Relevant settings:* 
  - [Secure Boot Mode (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/secureboot) 
 
*See also:*

[Deployed Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=deployed-mode), [Custom Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=custom-mode)

---

### SGX 

   Intel® Software Guard Extensions 

 Protect selected code and data from modification, by partitioning applications into hardened enclaves or trusted execution modules. 
 
 *More information:* 
  - ["Intel® Software Guard Extensions" at Intel.com](https://www.intel.com/content/www/us/en/developer/tools/software-guard-extensions/overview.html) 
 
---

### SID 

  Security Identifier

 *More information:* 
 - [More information at trustedcomputinggroup.org](https://trustedcomputinggroup.org/wp-content/uploads/TCG_Storage-Feature_Set_Block_SID_Authentication_v1.01_r1.00.pdf)

 *Relevant settings:* 
 - [Block SID Authentication (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password) 
 - [Block SID Authentication (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/password) 


---

### SIPP 

  Intel® Stable Image Platform Program 

 Validation program that aims for no hardware changes throughout the buying cycle, for at least 15 months or until the next generational release. 

 *More information:* 
  - ["PC Upgrade: Intel® SIPP" at Intel.com](https://www.intel.com/content/www/us/en/architecture-and-technology/stable-it-platform-program.html) 

 *Relevant settings:* 
 - [Intel (R) SIPP Support (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/advanced) 


---

### SMP 

  System Management Password 

 Administrator password mid-way between the Supervisor Password (SVP) and a user password. Can be configured to have the same permissions as the SVP. Can be set through the UEFI BIOS menu or through Windows Management Instrumentation (WMI) with the Lenovo
client-management interface.

 *More information:* 
  - [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht036206-types-of-password-for-thinkpad)

 *Relevant settings:*  
 - [System Management Password (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/security)  
 - [System Management Password (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/password) 
 - [System Management Password Access Control (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/system_management_password_access_control.md)

*See also:*

[POP](https://docs.lenovocdrt.com/#/bios/glossary?id=pop), [SVP](https://docs.lenovocdrt.com/#/bios/glossary?id=svp)

---

### SMBIOS 

  System Management BIOS 
 
 Specification for integration of BIOS information into operating systems and higher-level management applications. 
 
 *More information:* 
  - ["System Management Bios Reference Specification Eases Implementation for Managed PCs" at Intel.com](https://newsroom.intel.com/news-releases/system-management-bios-reference-specification-eases-implementation-for-managed-pcs/)
  - ["System Management BIOS" at DMTF.org](https://www.dmtf.org/standards/smbios) 
 
 *Relevant settings:*  
 - [BIOS Reporting (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/securitychip) 
 
 *See also:*

 [BIOS](https://docs.lenovocdrt.com/#/bios/glossary?id=bios), [UEFI](https://docs.lenovocdrt.com/#/bios/glossary?id=uefi)

---

### SRSETUP 

  DOS application to allow ThinkPad Setup settings to be common to all machines and to be controlled remotely. 
 
 *More information:*
 - ["ThinkPad Setup Settings Capture/Playback Utility (SRSETUP) for UEFI - ThinkPad" at Lenovo Support](https://support.lenovo.com/us/en/downloads/ds112377-thinkpad-setup-settings-captureplayback-utility-srsetup-for-uefi-thinkpad)

---

### SR TOOL 

 IBM Service Request (SR) tool.

!!! info ""
    Replaced by Lenovo Online Service Request function.

 *More information:* 
 
 - [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht511652)
  
---

### SSD (Solid State Disk) 
 
Storage solution based on collections of memory microchips. Faster, lighter, and more reliable than HDD, but less capacity at the same price.

 *More information:* 
 - ["Laptop Hard Drives, SSD & Storage" at Lenovo.com](https://www.lenovo.com/us/en/faqs/laptop-faqs/hard-drives-ssd-guide/) 

 *See also:*

[HDD](https://docs.lenovocdrt.com/#/bios/glossary?id=hdd), [HDP](https://docs.lenovocdrt.com/#/bios/glossary?id=hdp)

---

### Sticky Key 

 When a modifier key (such as shift, CTRL, ALT) remains active until another key is pressed. 
 
 *More information:* 
 
 - [More information at Lenovo Support](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-p-series-laptops/thinkpad-p50/solutions/ht510960-function-keys-are-not-working)
 
 *Relevant settings:*  
 - [Fn Sticky Key (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse) 


---

### SVP 

  Supervisor Password 

The Supervisor Password (SVP) protects the system information stored in UEFI BIOS.

 *More information:* 
 - [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht036206-types-of-password-for-thinkpad)

 *Relevant settings:*   
 - [Device Guard Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/deviceguard) 
 - [Supervisor Password (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/security) 
 - [Password Policies (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/password_policies) 
 
*See also:*

[POP](https://docs.lenovocdrt.com/#/bios/glossary?id=pop), [SMP](https://docs.lenovocdrt.com/#/bios/glossary?id=smp)

---


### Sx states 

  System power states 
 
 *More information:* 
  - ["System Power States" at Microsoft.com](https://learn.microsoft.com/en-us/windows/win32/power/system-power-states) 

 *Relevant settings:* 
 - [Enhanced Power Saving Mode (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/power) 
 


---

### TBCT 

  Think BIOS Config Tool 
 
 *More information:* 
  - ["Think BIOS Config Tool" at Lenovo CDRT](https://docs.lenovocdrt.com/#/tbct/tbct_top) 

---

### TCG 

  Trusted Computing Group 

 Standards body for secure computing. 

 *More information:* 
  - [More information at trustedcomputinggroup.org](https://trustedcomputinggroup.org/) 

 *Relevant settings:* 
 - [TCG Feature setup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/tcg_feature_setup.md)
 - [Block SID Authentication (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/hard_disk_password.md)

*See also:*

[TPM](https://docs.lenovocdrt.com/#/bios/glossary?id=tpm)

---

### TME 

  Total Memory Encryption 
 
Encrypts a computer’s entire memory with a single transient key. All memory data passing to and from the CPU is encrypted.

 *More information:* 
 
 - ["Intel® Hardware Shield – Intel® Total Memory Encryption" at Lenovo Support](https://www.intel.com/content/dam/www/central-libraries/us/en/documents/white-paper-intel-tme.pdf)

 *Relevant settings:* 
  - [Intel(R) Total Memory Encryption (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/memoryprotection.md)


---

### TPM 

  Trusted Platform Module 
  
   A secure cryptoprocessor, which is either logically or physically separate from the main chipset, and used for security functions. 

*More information:* 
  - ["Lenovo Trusted Platform Module (TPM) FAQ" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht512598) 
  - ["Trusted Platform Module" at Microsoft.com](https://learn.microsoft.com/en-us/windows/security/information-protection/tpm/trusted-platform-module-top-node) 
 
 *Relevant settings:* 
  - [TCG Security Device State (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/tcg_feature_setup.md)
  - [Security Chip (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/securitychip.md)

---

### TSME 

  Transparent Secure Memory Encryption  
 
 *More information:*  
 - [White paper (PDF) at AMD.com](https://www.amd.com/system/files/documents/amd-memory-guard-white-paper.pdf) 
 
*AKA:*

AMD Memory Guard 

*See also:*

[SATA](https://docs.lenovocdrt.com/#/bios/glossary?id=sata)

---

### TrackPad

Touch-sensitive interface surface that allows you to manipulate and interact with your laptop computer through finger gestures.
  
  *More information:* 
   - ["Popular Topics: Keyboard, Mouse, Touchpad, TrackPad, TrackPoint" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht503907) 

  *Relevant settings:* 
  - [Trackpad (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse) 
  
 

---

### TrackPoint

Pointing device, controls the mouse pointer with a joystick mounted in the center of the keyboard.
  
  *More information:* 
   - ["Popular Topics: Keyboard, Mouse, Touchpad, TrackPad, TrackPoint" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht503907) 

  *Relevant settings:* 
   - [TrackPoint (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse) 
  
 *AKA:*

Pointing stick

---

### UEFI 

  Unified Extensible Firmware Interface 
 
 UEFI specifications define an interface in which the implementation of UEFI performs the equivalent of the BIOS, by initiating the platform and loading the operating system. 
 
 *More information:* 
  - ["UEFI FAQS" at UEFI.org](https://uefi.org/faq) 
 
 *Relevant settings:* 
  - [UEFI BIOS Update Option Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/uefibiosupdate) 
  - [SMBIOS Reporting (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/securitychip.md)
  - [Lock UEFI BIOS Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/password.md)
  - [Windows UEFI Firmware Update (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/security.md)
  - [Allow Microsoft 3rd Party UEFI CA (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/secure_boot.md)

*AKA:*

BIOS, Firmware

*See also:*

[BIOS](https://docs.lenovocdrt.com/#/bios/glossary?id=bios)

---

### UMA 

  Unified Memory Architecture 
 
Architecture using part of RAM rather than dedicated graphics memory.

 *More information:* 
  - ["Configuring UMA Frame Buffer Size" at AMD.com](https://www.amd.com/en/support/kb/faq/pa-280) 

 *Relevant settings:* 
 - [Total Graphics Memory (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/display) 
 
*See also:*

[GPU](https://docs.lenovocdrt.com/#/bios/glossary?id=gpu)

---

### UNDI 

Universal Network Driver Interface 
 
API for network cards. 
 
 *More information:* 
 
 - ["UEFI Driver Development Guide for Network Boot Devices" at Intel.com](https://www.intel.com/content/dam/doc/guide/uefi-driver-network-boot-devices-guide.pdf)
  - ["UEFI Drivers" at Intel.com](https://www.intel.com/content/dam/develop/external/us/en/documents/uefi-drivers.ppt)

 *Relevant settings:* 
  
 - [Wireless LAN PXE boot (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/network_setup) 
 
*See also:*

[PXE](https://docs.lenovocdrt.com/#/bios/glossary?id=pxe)

---

### USB 

Universal Serial Bus 
 
Connectivity specification that allows peripheral devices like scanners, printers, and memory sticks to be plugged into the computer and configured automatically. 
 
 *More information:* 
 
 - [USB Implementers Forum at USB.org](https://www.usb.org/)

 *Relevant settings:* 
 - [USB Provisioning (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/intel_r_manageability.md)
 - [Smart USB Protection (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/security.md)
 - [USB Setup (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/usb_setup.md)
 - [USB Key Provisioning (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/intelramt.md)
 - [USB Port (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/ioportaccess.md)
 - [PCIe Tunneling (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/thunderbolttm4.md)
 - [USB Settings (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/usb.md)
 
---

### User mode
  
Default mode for secure boot. Includes secure boot authentication.

  *Relevant settings:* 
  - [System Mode (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/secure_boot) 
  - [Secure Boot Mode (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/secureboot) 
  
 *See also:*

 [Setup Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=setup-mode), [Custom Mode](https://docs.lenovocdrt.com/#/bios/glossary?id=custom-mode)

---

### Vantage (Lenovo)

User interface for changing hardware settings, checking for Lenovo software and driver updates, and more.

  *More information:* 
  - ["Commercial Vantage" at Lenovo CDRT](https://docs.lenovocdrt.com/#/cv/cv_top) 
  - ["Lenovo Vantage - Using your PC just got easier" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht505081-lenovo-vantage-using-your-pc-just-got-easier)
  - ["Lenovo Vantage (download)" at Lenovo.com](https://www.lenovo.com/us/en/software/vantage)
 
---

### VDI 

  Windows Virtual Desktop 

 IT infrastructure that allows access enterprise computer systems from almost any device. 

 *More information:* 
 - [More information at Lenovo Support](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-virtual-desktop-infrastructure-vdi/#what-is-virtualization) 
 
 *Relevant settings:* 
 - [Win VDI Boot (ThinkCentre)](https://docs.lenovocdrt.com/#/bios/settings/thinkcentre/network_setup)
 - [Lenovo Cloud Services (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/network) 
 


---

### VMM 

Virtual Machine Monitor 
 
The code that creates, manages, and destroys virtualized hardware.
 
 *More information:* 
  - [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht500006)

 *Relevant settings:* 
  - [Intel (R) Virtualization Technology (ThinkPad)](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/virtualization) 

 


---

### WMI 

Windows Management Instrumentation 
 
WMI is provided as a standard feature in most Windows® operating systems. It provides a powerful set of functions, such as query-based information retrieval and event notification, which enables users to manage both local and remote computers. The Lenovo BIOS WMI interface extends the capabilities of WMI to allow management of BIOS settings.
 
 *More information:* 

 - [Lenovo BIOS Windows Management Instrumentation Interface Deployment Guide For Desktop – Think Series Products (zip file with guide + scripts)](https://download.lenovo.com/pccbbs/thinkcentre_pdf/lenovo_desktop_bios_wmi_deployment_guide_revision_1.7.zip) 
 - [More information at Microsoft.com](https://learn.microsoft.com/en-us/windows/win32/wmisdk/wmi-start-page)
