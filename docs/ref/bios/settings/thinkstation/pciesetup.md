# PCIe Setup #

![](./img/ts_pciesetup_px1.png)
![](./img/ts_pciesetup_px2.png)
<!--![](./img/ts_pciesetup_px.png)
![](./img/ts_pciesetup_px_2.png)-->

<details><summary>Re-Size BAR Support</summary>
If system has Resizable BAR capable PCIe Devices, this option
Enables or Disables Resizable BAR Support.
Options:

1. **Disabled** – Default.
2. Enabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ReSizeBARSupport  | Enabled, Disabled | Yes | Both |
</details>


<details><summary>SR-IOV Support</summary>
If system has SR-IOV capable PCIe Devices, this option Enables
or Disables Single Root IO Virtualization Support.

Options:

1. **Disabled** – Default.
2. Enabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SRIOVSupport   | Enabled, Disabled | Yes | Both |
</details>

<details><summary>ASPM Support</summary>
<Auto> Configure ASPM automatically according to what the
attached device supports in each PCI Express port
<Disabled> Disable ASPM support of all PCI Express ports.

Options:

1. **Disabled** – Default.
2. Auto.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ASPMSupport   | Disabled, Auto | Yes | Both | 
</details>

<details><summary>Link Training Timeout(uS)</summary>
Defines number of Microseconds software will wait before polling
'Link Training' bit in Link Status register. Value range from 10 to 10000 uS.
Options:

1. **1000** – Default.
2. Simulator not support.

</details>


<!-- Need to add all of the PCIe Slotx Configurations 
These will likely be subheader drop downs
-->
### PCIe Slot{X} Configuration ###

![](./img/ts_pcieslotconfig.png)

<details><summary>PCIe Port</summary>
Select whether to enable or disable this PCIe port.

Options:

1. **Enabled** – Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PCIeSlotXPort | Enabled, Disabled | Yes | Both | 

!!! info ""
    In the WMI class name, X represents the slot number.
</details>



<details><summary>PCIe Port Bifurcationt</summary>
Select PCIe port bifurcation. If select [Auto], system will auto
configurate PCIe port bifurcation and auto detect Quad M.2 PCIe Card.

Options:

1. **Auto** – Default.
2. x4x4x4x4.
3. x8x8.
4. x16

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PCIeSlotXBifurcation   | x4x4x4x4, x8x8, x16, Auto | Yes | Both | 

!!! info ""
    In the WMI class name, X represents the slot number.
</details>

<details><summary>Link Speed</summary>
Select PCEi Link Speed.

Options:

1. **Auto** – Default.
2. Gen 1 (2.5 GT/s).
3. Gen 2 (5 GT/s).
4. Gen 3 (8 GT/s).
5. Gen 4 (16 GT/s)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PCIeSlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s) | Yes | Both | 

!!! info ""
    In the WMI class name, X represents the slot number.
</details>

### M.2 Slot{X} Configuration ###

![](./img/ts_m2slotconfig.png)

<details><summary>Link Speed</summary>
Select PCIe Link Speed.

Options:

1. **Auto** – Default.
2. Gen 1 (2.5 GT/s).
3. Gen 2 (5 GT/s).
4. Gen 3 (8 GT/s).
5. Gen 4 (16 GT/s)
6. Gen 5 (32 GT/s)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| M2SlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s), Gen 5 (32 GT/s) | Yes | Both | 

!!! info ""
    In the WMI class name, X represents the slot number.
</details>

### MCIO Slot{X}-{Y} Configuration

![](./img/ts_mcioslotconfig.png)

<details><summary>Link Speed</summary>
Select PCIe Link Speed.

Options:

1. **Auto** – Default.
2. Gen 1 (2.5 GT/s).
3. Gen 2 (5 GT/s).
4. Gen 3 (8 GT/s).
5. Gen 4 (16 GT/s)
6. Gen 5 (32 GT/s)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| MCIOSlotXYLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s), Gen 5 (32 GT/s) | Yes | Intel | 

!!! info ""
    In the WMI class name, X & Y represents the slot numbers.
</details>
