# PCIe Configuration #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_pcieconfiguration.png)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_pcieconfiguration.png)-->

<details><summary>Above 4G Decoding</summary>

Whether to enable 64bit capable devices to be decoded in Above 4G Address Space (only if system supports 64bit PCI decoding).

Options:

1.  **Enabled** - Default.
2.  Disabled.

<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both | -->

</details>

<details><summary>SR-IOV Support</summary>

Whether to enable Single Root IO Virtualization Support.

!!! info ""
    Assumes system has SR-IOV capable PCIe Devices.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SRIOVSupport | Disable, Enable | yes | AMD |

</details>

<details><summary>ASPM Support</summary>

!!! info ""
    When set to `Auto`, configures ASPM automatically according to what each device supports.

Options:

1.  **Disabled** - Default.
2.  Auto.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ASPMSupport | Disabled,Auto | yes | AMD |

!!! info ""
    Enabling ASPM may cause some PCIe devices to fail.

</details>



<details><summary>Extended Synch</summary>

Whether to allow generation of Extended Synchronization patterns.

Options:

1.  **Disabled** - Default.
2.  Enabled.

<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both | -->

</details>

<details><summary>Link Training Timeout (uS)</summary>

How many microseconds software will wait before polling 'Link Training' bit in Link Status register.

Value range: 10 to 10000 μs.

Options:

1. 1000

<!-- TODO: verify this -->

<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both | -->

</details>
<details><summary>Unpopulated Links</summary>

!!! info ""
    When `Disabled`, unpopulated PCI Express links are disabled to save power.

Options:

1. Keep Link ON
1. **Disabled**

<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both | -->

</details>

### PCIe Slot{X} Status ###

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_pcieslotstatus.png)

<details><summary>PCIe Port</summary>

Whether to enable this PCIe port.

Options:

1. **Enabled** - Default.
2. Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PCIeSlotXPort | Disable, Enable | yes | AMD |

!!! info ""
    In the WMI class name, X represents the slot number, from 1 to 6.

</details>

<details><summary>PCIe Port Bifurcation</summary>

Select PCIe port bifurcation.

!!! info ""
    If `Auto`, system will auto-configure PCIe port bifurcation and auto-detect Quad M.2 PCIe Card.

Options:

1. x4x4
1. x4x4x4x4
1. x4x4x8
1. x8x4x4
1. x8
1. x8x8
1. x16
1. **Auto** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PCIeSlotXBifurcation | Auto, x4x4x4x4, x8x8, x16 | yes | AMD |

!!! info ""
    In the WMI class name, X represents the slot number, from 1 to 6.

</details>

<details><summary>Link Speed</summary>

description.

Options:

1. **Auto** - Default.
1. Auto, Gen 1 (2.5 GT/s)
1. Gen 2 (5 GT/s)
1. Gen 3 (8 GT/s)
1. Gen 4 (16 GT/s)

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PCIeSlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s) | yes | AMD |

!!! info ""
    In the WMI class name, X represents the slot number, from 1 to 6.

</details>

### M.2 Slot{Y} Status ###

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_m2slot1status.png)

<details><summary>M.2 Port</summary>

Whether to enable this M.2 port.

Options:

1. **Enabled** - Default.
2. Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| M2SlotXPort | Disable, Enable | yes | AMD |

!!! info ""
    In the WMI class name, X represents the slot number, 1 or 2.

</details>

<details><summary>M.2 Link Speed</summary>

Options:

1. **Auto** - Default.
1. Auto, Gen 1 (2.5 GT/s)
1. Gen 2 (5 GT/s)
1. Gen 3 (8 GT/s)
1. Gen 4 (16 GT/s)

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| M2SlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s) | yes | AMD |

!!! info ""
    In the WMI class name, X represents the slot number, 1 or 2.

</details>

<details><summary>M.2 DLF Support</summary>

Options:

1. **Enabled** - Default.
1. Disabled.
