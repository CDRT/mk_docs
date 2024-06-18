# PCI Express Configuration #

![](./img/tc_pci_express_config.png)

Peripheral Component Interconnect (PCI) Express configuration.

<details><summary>ASPM support</summary>

Active-State Power Management (ASPM).

Options:

1. **Auto** - Configure ASPM automatically according to what the attached device supports in each PCI Express port. Default.
2. Disable - Disable ASPM support of all PCI Express ports.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| ASPMSupport | Disabled, Auto | Yes |


</details>

## Select PCI Express port speed. ##

<details><summary>PCIe 16x Slot speed</summary>

Options:

1.  **Auto** - Default.
2.  Gen 1.
3.  Gen 2.
4.  Gen 3.
5.  Gen 4.

<!-- MODEL: S only-->

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PCIe16xSlotSpeed | Disabled, Enabled | Yes |


</details>

<details><summary>PCIe 8x Slot speed</summary>

Options:

1.  **Auto** - Default.
2.  Gen 1.
3.  Gen 2.
4.  Gen 3.
5.  Gen 4.

<!-- MODEL: M90q only -->

</details>

<details><summary>PCIe 4x Slot speed</summary>

Options:

1.  **Auto** - Default.
2.  Gen 1.
3.  Gen 2.
4.  Gen 3.
5.  Gen 4.

<!-- MODEL: S only-->

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PCIe4xSlotSpeed | Auto, Gen1, Gen2, Gen3 | Yes |


</details>

<details><summary>PCIe 1x Slot speed</summary>

Options:

1.  **Auto** - Default.
2.  Gen 1.
3.  Gen 2.
4.  Gen 3.

<!-- MODEL: not M70 q-->

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PCIe1xSlotSpeed  | Auto, Gen1, Gen2, Gen3 | Yes |


</details>