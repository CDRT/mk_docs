# Common RefCode Configuration #

![](./img/ts_amd_commonrefcodeconfiguration.png)

<details><summary>MMIO Above 4G Limit</summary>

Set PCIe device aperture range to Auto/40/42/44/46/48 bits limit.

Options:

1. **Auto**. Keeps the platform default settings. - Default.
1. 40
1. 42
1. 44
1. 46
1. 48

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| MmioAbove4GLimit | Auto, 40, 42, 44, 46, 48 | yes | AMD |

</details>

<details><summary>NUMA Nodes</summary>

Whether to enable Non-Uniform Memory Access (NUMA).

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| NUMA | NPS1, NPS2, NPS4, Auto | yes | AMD |

</details>
