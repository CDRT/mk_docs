# Intel(R) Standard Manageability

![Intel Standard Manageability](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_intelrsm.png)

Intel(R) Standard Manageability
:  This option enables or disables Intel® Standard Manageability (ISM) function.

    !!! note ""
        Only shown on vPro Essentials models.

    Possible options:

    1. **Enabled** – Default.
    2. Disabled
    3. Permanently Disabled

    !!! warning ""
        Selecting `Permanently Disabled` requires additional confirmation: "If Intel Standard Manageability is permanently disabled, you can never enable this setting again." Once permanently disabled, the Intel Standard Manageability interface cannot be re-enabled.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    | --- | --- | --- | --- |
    | ISMControl | Disable, Enable, Permanently Disabled | No | Intel |

USB Key Provisioning
:  This option enables or disables USB key provisioning.

    !!! note ""
        Only shown on vPro Essentials models.

    Possible options:

    1. Enabled
    2. **Disabled** – Default.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    | --- | --- | --- | --- |
    | USBKeyProvisioning | Disable, Enable | No | Intel |

CIRA Timeout
:  Define timeout for Client Initiated Remote Access connection to be established.

    !!! note ""
        Only shown on vPro Essentials models.

    Possible options:

    1. **0** – use the default timeout of 60 seconds. Default.
    2. 1 – 255

Console Type
:  Enables to specified console type.

    !!! note ""
        Only shown on vPro Essentials models.

    Possible options:

    1. **VT100+** – Default.
    2. VT100
    3. VT-UTF8
    4. PC ANSI
