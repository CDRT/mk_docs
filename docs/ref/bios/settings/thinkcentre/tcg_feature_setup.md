# TCG Feature Setup

![TCG Feature Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_tcg_feature_setup.PNG)

TCG Security Device State
:  Displays the current TCG Security Device (display only).

    Select a TPM (Trusted Platform Module).

    - [More information on TPM at Lenovo Support](https://support.lenovo.com/lt/en/solutions/ht512598)
    - [More information on managing TPM in Windows at Microsoft 365](https://docs.microsoft.com/en-us/windows/security/information-protection/tpm/trusted-platform-module-top-node)

    Possible options:

    - Discrete TPM 1.2
    - Discrete TPM 2.0
    - Firmware TPM 2.0

Security Chip 2.0
:  Whether the TCG security feature is enabled or disabled.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    !!! note ""
        If set to `Disabled`, the TxT will be set to `Disabled` automatically.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | SecurityChip | Enabled, Disabled | Yes |

Clear TCG Security Feature
:  Whether to clear TCG Security Feature.

    !!! note ""
        Any data in TPM will be cleared.

    Possible options:

    1.  **No** – Default.
    2.  Yes

Physical Presence for Clear
:  Whether to require confirmation of a user's physical presence when clearing the security chip.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | PhysicalPresenceforClear | Disabled, Enabled | Yes |





