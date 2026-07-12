# Passwords

The following passwords can be set on all models.

In particular, the Supervisor Password (SVP) controls whether many settings can be applied via [WMI](https://docs.lenovocdrt.com/ref/bios/glossary/#wmi).

!!! note ""
    Specific behaviors vary depending on model.

## Supervisor Password (SVP)

Protects the system information stored in UEFI BIOS.

### Entering the SVP

When entering the UEFI BIOS menu, enter the correct supervisor password in the window prompted.

!!! note ""
    If the user presses `Enter`, the password prompt will be skipped, but then most of the system configuration options in UEFI BIOS will be unavailble.

### Setting the SVP

The supervisor password can be set only through the UEFI BIOS menu.

Once it is in place, then it can be modified using Windows Management Instrumentation (WMI) with the Lenovo client-management interface.

### Overriding the POP

The supervisor password overrides the power-on password (POP).

If you have set both the supervisor password and power-on password, you can use the supervisor password to access your computer when you turn it on.

## System Management Password (SMP)

Also protects the system information stored in UEFI BIOS like a supervisor password, but it has lower authority by default.

### Setting the SMP

The system management password can be set through the UEFI BIOS menu or through Windows Management Instrumentation (WMI) with the Lenovo client-management interface.

### Overriding the SVP

You can enable the system management password to have the same authority as the supervisor password to control security-related features.

## Power-On Password

When enabled, Power-On Password prevents unauthorized users from booting your computer.

## ATA / NVMe Password

Also known as Hard Disk Password (HDP).

Lenovo BIOS supports both ATA and NVMe storage and the displayed BIOS setting changes depending on the attached storage device.

The NVMe (nonvolatile memory express) password prevents unauthorized access to the data on the storage drive. When an NVMe password is set, you are prompted to type a correct password each time you try to access the storage drive.

### Dual Passwords

The system can create dual passwords for an Admin and another User.

## Further Information

- ["Introduction to password manager - ThinkPad, ThinkCentre, ThinkStation" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht103666-introduction-to-password-manager-thinkpad-thinkcentre-thinkstation)
- ["How to find Password related topics in User Guide" at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht077765)
- ["Types of password for ThinkPad" at Lenovo Support](https://support.lenovo.com/at/en/solutions/ht036206-types-of-password-for-thinkpad)