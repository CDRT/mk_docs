# Secure Boot Settings #

### General ###

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_secureboot.png)

<details><summary>System Mode</summary>

Shows the current system mode.

View only.

Possible values:

1. **Deployed Mode** - Default
2. Audit  Mode
3. User Mode
4. Setup Mode

</details>


<details><summary>Secure Boot</summary>

Secure Boot means that the BIOS will prevent any un-authorized OS from being loaded.

Options:

1. **Enabled** – Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SecureBoot | Disabled, Enabled | yes | Both |
</details>


<details><summary>Restore Factory Keys</summary>

Reset Factory Keys will put secure boot into factory defaults.<br>

!!! info ""
    Requires additional confirmation. 

</details>


<details><summary>Reset Platform to Setup Mode</summary>

Reset to setup mode will move secure boot to setup mode.<br>

!!! info ""
    Requires additional confirmation.

</details>


<details><summary>Enter Audit Mode</summary>

Enter Audit Mode workflow.<br>

!!! info ""
    Transition from User to Audit Mode will result in erasing of PK (Platform Key) value.

!!! info ""
    Requires additional confirmation.

</details>


<details><summary>Enter Deployment Mode</summary>

Transition between User and Deployment modes.

!!! info ""
    Requires additional confirmation.


</details>

<details><summary>Allow Microsoft 3rd Party UEFI CA</summary>

!!! info ""
    If add-on Cards are supported, Microsoft 3rd Party UEFI
CA will not be removed until load boot loader

Options:

1. **Enabled** – Default.  Microsoft 3rd Party UEFI CA will be installed in Secure Boot DB. This device will trust it in Secure Boot.
2. Disabled - Microsoft 3rd Party UEFI CA will be removed in Secure
Boot DB.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| AllowMicrosoft3rdPartyUEFICA | Enabled, Disabled	 |  | AMD |
</details>


### Key Management ###
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /securebootkeysmanagement.png)

<details><summary>Platform Key (PK)</summary>

!!! info ""
    The platform key establishes a trust relationship between the platform owner and the platform firmware. The platform owner enrolls the public half of the key into the platform firmware. The platform owner can later use the private half of the key to change platform ownership or to enroll a Key Exchange Key. 

</details>


<details><summary>Key Exchange Key (KEK)</summary>

!!! info ""
    Key exchange keys establish a trust relationship between the operating system and the platform firmware. Each operating system (and potentially, each 3rd party application that needs to communicate with platform firmware) enrolls a public key into the platform firmware.

<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |-->
</details>


<details><summary>Authorized Signature Database (DB)</summary>

!!! info ""
    Database keys shows the list of allowed certificates. System will check digital signatures of bootloaders using public keys in the DB. Only software or firmware which has a bootloader signed with a corresponding private key will be allowed to run. 

<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |-->
</details>


<details><summary>Forbidden Signature Database (DBX)</summary>

!!! info ""
    Forbidden Signature Database shows not allowed certificates. System will block any software or firmware signed with a corresponding private key. 

<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |-->
</details>


<details><summary>Authorized TimeStamps (DBt)</summary>

!!! info ""
    If present, contains the platform-defined secure boot timestamp signature database. This is not used at runtime but is provided in order to allow the OS to recover the OEM's default key setup.

<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |-->
</details>


<details><summary>OsRecovery Signatures (DBr)</summary>

!!! info ""
    If present, contains the platform-defined secure boot authorized recovery signature database. This is not used at runtime but is provided in order to allow the OS to recover the OEM's default key setup.

<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |-->
</details>