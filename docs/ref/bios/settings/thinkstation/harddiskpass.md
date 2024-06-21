# Hard Disk Password Settings #

!!! note ""
    Number of drives depends on the model and platform.

### General ###
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   (https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   iskpass.png)-->
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_harddiskpass.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_harddiskpass2.png)

<details><summary> {DriveType} {X} Password</summary>

Set a Hard Disk Password (HDP) to prevent unauthorized users from accessing the data on the Hard Disk.

!!! note ""
    In addition to the User password and optional Master Password, the HDP can be used to recover the disk if the User Password is lost.

One setting for each drive's password:

 - {DriveType} - M.2, PCIe, or SATA
 - {X} - one of a number of the same type of drive.

For each drive it is possible to define a separate password, or leave a drive without a password.

Options:

1. Enabled – HDP (single or dual) is installed.
2. **Disabled** – HDP is not installed. Default.

Additional choice of the password type:
1. **Single Password** - Default.
2. Dual Password (User+Admin).

!!! note ""
    When a single HDP is set, the user must enter the user password to access files and applications on the storage drive.

!!! note ""
    The admin HDP is set and used by a system administrator. It enables the administrator to access any storage drive in a system or any computer connected in the same network.

!!! note ""
    The administrator can also assign a user HDP for each computer in the network. The user of the computer can change the user HDP as desired, but only the administrator can remove the user HDP. 

<!-- TODO: confirm parameters -->

While enabling the following parameters are available:
1. `Enter New Password`
2. `Confirm New Password`
3. Show Password – `On` \ `Off` statuses
4. < Actions >: <br>
    a. **Save** – default<br>
    b. Cancel

!!! note ""
    If several disks are present, it’s suggested to set all Hard Disk Passwords to the same. 

</details>

<details><summary>Require HDP on System Boot</summary>

Whether HDP is required when the Hard Disk is in lock status, and system starts from one of the states:
- full off
- hibernate
- restart

!!! note ""
    When `no` is selected, HDP is still required when the hard disk is attached to a different system.

Options:

1. **Auto** – HDP required. Default.
2. No – HDP will not be required.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| RequireHDPonSystemBoot | No, Auto | yes | Both |
</details>

<details><summary>Block SID Authentication</summary>

Whether TCG (Trusted Computing Group) storage device blocks attempts to authenticate the SID (Security Identifier) authority until a subsequent device power cycle occurs.

Options:

1. **Enabled** – Default. 
2. Disabled.

!!! note ""
    When `Disabled`, system allows SID authentication in TCG storage device at the next boot only, but not subsequent boots.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| BlockSIDAuthentication | Enabled, Disabled | yes | Intel |
</details>


### Security Erase HDD Data ###

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   (https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   curityerasehdd.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_(https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   tyerasehdd2.png)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /securityerasehdd.png)-->

<details><summary>Erase {DriveType} {X} Data</summary>

Erase data per individual drive.

- {DriveType} stands for the drive type.<br>
 - {X} stands for the order number of a drive.<br>

!!! note ""
    All hard drive data will be erased, and the hard disk password will be deleted. Requires additional confirmation.


</details>