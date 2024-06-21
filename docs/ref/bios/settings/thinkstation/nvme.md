# NVMe Setup #
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_(https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   ng)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_nvme.png)-->

<details><summary>NVMe RAID Mode</summary>

Whether to enable NVMe RAID mode.

!!! note ""
    Device driver support is required  for NVMe RAID. <br> <br> Depending how the hard disk image was installed, changing this setting may prevent the system from booting.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| NVMeRAIDMode | Disable, Enable | ACL | AMD |

<!-- TODO: clarify ACL -->

</details>
