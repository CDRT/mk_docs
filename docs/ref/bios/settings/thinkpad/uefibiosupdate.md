# UEFI BIOS Update Option Settings #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img
   /tp_uefibiosupdate.png)

<details><summary>Flash BIOS Updating by End-Users</summary>

Whether UEFI BIOS can be updated without entering supervisor password.

Possible options:

1.	Off
2.	**On** – Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| BIOSUpdateByEndUsers | Disable, Enable | Yes | Both |

</details>

<details><summary>Secure RollBack Prevention</summary>

Whether to prevent flashing to older version of UEFI BIOS.

!!! info ""
    Defaults to `On`, if `OS Optimized Defaults` has value `On`.

Possible options:

1.	**Off** – Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| SecureRollBackPrevention | Disable, Enable | Yes | Both |

</details>

<details><summary>Windows UEFI Firmware Update</summary>

Whether to allow Windows UEFI Firmware Update.

Possible options:

1.	**On** – Default.
2.	Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| WindowsUEFIFirmwareUpdate | Disable, Enable | Yes | Both |

</details>
