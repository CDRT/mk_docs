# Hard Disk Password Settings

## General

!!! warning "Attention"
    Number of drives depends on the model and platform.

### **{DriveType} {X} Password**

Set a Hard Disk Password (HDP) to prevent unauthorized users from accessing the data on the Hard Disk.

In addition to the User password and optional Master Password, the HDP can be used to recover the disk if the User Password is lost.

One setting for each drive's password:

- {DriveType} - M.2, PCIe, MCIO, or SATA
- {X} - one of a number of the same type of drive.

For each drive it is possible to define a separate password, or leave a drive without a password.

Possible options:

1. Enabled – HDP (single or dual) is installed.
2. **Disabled** – HDP is not installed. Default.

Additional choice of the password type:

1. **Single Password** - Default.
2. Dual Password (User+Admin)

When a single HDP is set, the user must enter the user password to access files and applications on the storage drive.

The admin HDP is set and used by a system administrator. It enables the administrator to access any storage drive in a system or any computer connected in the same network.

The administrator can also assign a user HDP for each computer in the network. The user of the computer can change the user HDP as desired, but only the administrator can remove the user HDP.

<!-- TODO: confirm parameters -->

While enabling the following parameters are available:

1. `Enter New Password`
2. `Confirm New Password`
3. Show Password – `On` \ `Off` statuses
4. < Actions >:

    a. **Save** – Default

    b. Cancel

!!! warning "Attention"
    If several disks are present, it's suggested to set all Hard Disk Passwords to the same.

### **Require HDP on System Boot**

Whether HDP is required when the Hard Disk is in lock status, and system starts from one of the states:

- full off
- hibernate
- restart

!!! warning "Attention"
    When `No` is selected, HDP is still required when the hard disk is attached to a different system.

Possible options:

1. **Auto** – HDP required. Default.
2. Power On
3. No – HDP will not be required.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| RequireHDPonSystemBoot | No, Power On, Auto | Yes | Both |

### **Block SID Authentication**

Whether TCG (Trusted Computing Group) storage device blocks attempts to authenticate the SID (Security Identifier) authority until a subsequent device power cycle occurs.

!!! warning "Attention"
    When `Disabled`, system allows SID authentication in TCG storage device at the next boot only, but not subsequent boots.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BlockSIDAuthentication | Enabled, Disabled | Yes | Intel |

## Security Erase HDD Data

### **Erase {DriveType} {X} Data**

Erase data per individual drive.

- {DriveType} stands for the drive type.
- {X} stands for the order number of a drive.

!!! warning "Attention"
    All hard drive data will be erased, and the hard disk password will be deleted. Requires additional confirmation.

### **Media Sanitization**

Enter the Media Sanitization page for a drive.

### **Method Type**

Selects the sanitization method to use.

### **Specification**

Displays the sanitization specification used.

### **Start This Device sanitization**

Starts sanitization of the selected drive.
