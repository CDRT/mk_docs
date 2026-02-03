# Thunderbolt(TM) 4 / Thunderbolt(TM) 5 Settings

![Thunderbolt 4](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_thunderbolttm4.png)

PCIe Tunneling
:  Whether to enable PCIe (peripheral component interconnect express) Tunneling.

    Possible states:

    1. **On** - Default.
    2. Off

    !!! note ""
        * Some Thunderbolt devices, such as external GPUs and storage drives, may not work properly.
        * The USB functions of USB4 based devices that are Thunderbolt 4 / Thunderbolt 5 certified may still work.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | PCIeTunneling | Disable, Enable | Yes | Both |

PCIe Maximum Payload Size
:  Select PCIe Maximum Payload Size (MPS) for Thunderbolt™  5 port. Connecting non Thunderbolt™ 5 devices with this set to 258 bytes may result in reduced or inadequate performance.

    Possible states:

    1. **128 bytes** - set MPS to 128 bytes. Default.
    2. 256 bytes - set MPS to 258 bytes.

    !!! note ""
        * Only affects type-C Thunderbolt™ 5 port, indicated on the machine by a thunderbolt icon and “5”.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | PCIeMaximumPayloadSize | 128bytes, 256bytes | Yes | Both |