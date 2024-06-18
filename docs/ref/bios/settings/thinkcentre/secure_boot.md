# Secure Boot

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_secure_boot.png)

<details><summary>System Mode (display only)</summary>

<!-- TODO: add description -->

Options:

1. **Deployed Mode** - Default.
1. Audit Mode
1. User Mode
1. Setup Mode

</details>

<details><summary>Secure Boot</summary>

1.  **Enabled** - BIOS will prevent unauthorized OS from loading.
1.  Disabled - disables Secure Boot.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SecureBoot | Disabled, Enabled | yes |


</details>

<details><summary>Restore Factory Keys</summary>

Restore Factory Keys resets secure boot to factory defaults.

Press `Yes` to proceed, or `No` to cancel.

</details>

<details><summary>Reset Platform to Setup Mode</summary>

Reset to setup mode will change secure boot to setup mode.

</details>

<details><summary>Enter Audit Mode</summary>

Enter Audit Mode workflow.

!!! info ""
    Transition from user to Audit Mode will result in erasing PK (Platform Key) variable.

!!! info ""
    Removing PK (Platform Key) will reset the system to setup / audit mode.

</details>

<details><summary>Enter Deployed Mode</summary>

Transition between Deployment and User Modes.

</details>

<details><summary>Allow Microsoft 3rd Party UEFI CA</summary>

Options:

1.  **Enabled** - Install Microsoft 3rd Party UEFI CA, and trust it in secure boot. Default.
2.  Disabled. Remove Microsoft 3rd Party UEFI CA in secure boot BD.


| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| AllowMicrosoft3rdPartyUEFICA | Enabled, Disabled | yes |

!!! info ""
    If add-on cards are supported, Microsoft 3rd Party UEFI CA will not be removed until the boot loader is loaded.

<!-- MODEL: Only M90t/s-3 -->


</details>

<!--<details><summary>Key Management</summary>
Simulator not supported.

<details>-->

