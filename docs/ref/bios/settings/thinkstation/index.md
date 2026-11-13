# ThinkStation BIOS Settings

This section describes the BIOS settings available on Lenovo ThinkStation systems. Not all models implement all settings, so it is recommended to review a sample system to identify which settings are available.

Settings are listed in the same order as the BIOS menus and the navigation menu on the left.

## Main

- [Main](main.md): language, setup mode and setup content.
- [System Summary](systemsummary.md): system information and installed components.
- [System Time & Date](systemtimedate.md): the system time and date.
- [BIOS Event Log](bioseventlog.md): BIOS event logging.

## Devices

- [Devices](devices.md): card reader and Bluetooth.
- [Serial Port](serialportsetup.md): serial port addresses and interrupts.
- [Parallel Port](parallelportsetup.md): parallel port address, mode and IRQ.
- [USB](usbsetup.md): USB port access, Always On USB and USB charging.
- [Storage Setup](storagesetup.md): SATA, M.2 and MCIO drive options.
    - [Intel(R) VMD Technology](intelvmd.md): Intel Volume Management Device and VROC support.
- [ATA Drive](atadrivesetup.md): SATA controller, hot-plug support and hard disk pre-delay.
- [NVME Drive](nvme.md): NVMe RAID mode.
- [Video](videosetup.md): active video device, primary controller and memory sizes.
- [Audio](audiosetup.md): onboard, front and rear audio controllers, and Post Beep.
- [Network](networksetup.md): onboard Ethernet and wireless LAN options.
- [PCIe](pciesetup.md): Resizable BAR, SR-IOV, ASPM and PCIe ports.
- [PCI Express](pciexpress.md): SR-IOV, ASPM and PCIe slot speeds.
- [Intel(R) Thunderbolt](intelthunderbolt.md): Thunderbolt technology, security level and wake options.
- [BMC Setup](bmcsetup.md): BMC card support, network and users.

## Advanced

- [Advanced](advanced.md): WHEA, Data Execution Prevention, memory encryption, Thunderbolt and other advanced options.
- [Diagnostics](diagnostics.md): real-time diagnostics monitoring and diagnostic log data.
- [PCIe Configuration (AMD)](pcieconfiguration.md): Above 4G Decoding, SR-IOV, ASPM and link training.
- [PCI Express Setup](pciexpressconfig.md): SR-IOV, ASPM and PCIe slot speeds.
- [CPU Configuration (AMD)](cpuconfiguration.md): AMD processor information.
- [CPU Setup (Intel)](cpusetup.md): Intel processor options such as Speed Shift and Hyper-Threading.
- [Memory Configuration](memoryconfig.md): memory topology and DIMM population.
- [RAS Configuration (AMD)](rasconfiguration.md): Post Package Repair, Patrol Scrub and data scrambling.
- [Common RefCode Configuration (AMD)](commonrefcodeconfiguration.md): MMIO, NUMA and related options.
- [CXL Common Options](cxlcommonoptions.md): Compute Express Link options.
- [DASH Configuration (AMD)](dashconfiguration.md): DASH support and console redirection.
- [Intel Manageability Settings](intelmanageability.md): Intel Manageability, AMT control and MEBx.
- [Serial Port Console Redirection (AMD)](serialportconsoleredirection.md): console redirection, terminal type and serial settings.

## Power

- [Power Settings](power.md): behavior after power loss, sleep state and performance mode.
- [Automatic Power On](autopoweron.md): Wake on LAN, serial port ring and alarm wake.

## Security

- [Security](security.md): supervisor, power-on and system management passwords.
- [Hard Disk Password](harddiskpass.md): per-drive passwords, boot requirements and media sanitization.
- [Password Policies](passwordpolicies.md): minimum length, strong passwords and when a BIOS password is required.
- [SMP Access Control](smpaccesscontrol.md): give the system management password supervisor-level control.
- [TCG Feature Setup](tcgfeaturesetup.md): TCG security device state and Security Chip 2.0.
- [Secure Boot](secureboot.md): system mode, Secure Boot, factory keys and audit mode.
- [System Event Log](systemeventlog.md): view or clear the system event log.
- [Certificate-based BIOS Authentication](certbasedbiosauth.md): use a digital certificate instead of a supervisor password.

## Startup

- [Startup](startup.md): first boot device, USB boot support and Fast Boot.
- [Boot Priority Order](bootpriorityorder.md): the ordered list of boot devices.

## Exit

- [Exit Settings](exit.md): save or discard changes, and load defaults.
