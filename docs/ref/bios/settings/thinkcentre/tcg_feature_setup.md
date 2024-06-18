# TCG Feature setup

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_tcg_feature_setup.png)

<details><summary>TCG Security Device State</summary>

Displays the current TCG Security Device (display only).

Select a TPM (Trusted Platform Module).

 - [More information on TPM at Lenovo Support](https://support.lenovo.com/lt/en/solutions/ht512598)
  - [More information on managing TPM in Windows at Microsoft 365](https://docs.microsoft.com/en-us/windows/security/information-protection/tpm/trusted-platform-module-top-node)

Options:

 - Discrete TPM 1.2
 - Discrete TPM 2.0
 - Firmware TPM 2.0

<!-- NO WMI -->

</details>

<details><summary>Security Chip 2.0</summary>

Whether the TCG security feature is fully functional.

1.  **Enabled** - Default.
1.  Disabled.

!!! info ""
    If set to `Disabled`, the TxT will be set to `Disabled` automatically.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SecurityChip | Enabled, Disabled | yes |


</details>

<details><summary>Clear TCG Security Feature</summary>

Whether to clear TCG Security Feature.

!!! info ""
    Any data in TPM will be cleared.

Options:

1.  **No** - Default.
1.  Yes.

<!-- NO WMI -->

</details>

<details><summary>Physical Presence for Clear</summary>

Whether to require confirmation of a user's physical presence when clearing the security chip.

1.  **Enabled** - Default.
1.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PhysicalPresenceforClear | Disabled, Enabled | yes |


</details>