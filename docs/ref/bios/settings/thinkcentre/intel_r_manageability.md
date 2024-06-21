# Intel(R) Manageability #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_intel_r_manageability.png)

 - [More information at Intel.com](https://software.intel.com/sites/manageability/AMT_Implementation_and_Reference_Guide/default.htm)

<details><summary>Intel(R) Manageability Control</summary>

Options:

1. **Enabled** - Default.
2. Disabled.

Setting Intel(R) Manageability Control to "Disabled":

1. If system is provisioned, MEBx will be unprovisioned first.

  !!! note ""
   When MEBX prompt unprovisioning, you should press YES.

2. Manageability functions will be disabled
You can enter BIOS to re-enable Intel(R) Manageability.

  !!! note ""
   When changing the setting from “Enabled” to “Disabled”, after saving and exiting SETUP, need to unplug the AC power cord and plug it in again.

</details>

<details><summary>Intel(R) Manageability Reset</summary>

Return Intel(R) Manageability settings to default configuration.

Options:

1. **Enabled** - Default.
2. Disabled.

!!! note ""
    the MEBx password will also be reset.


</details>

<details><summary>Intel(R) MEBx </summary>

Press `Enter` to enter Intel (R) MEBx (Management Engine BIOS Extension).

 - [More information at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000020917/software/manageability-products.html)

</details>


<details><summary>ME Firmware Version (display only)</summary>

Displays the firmware version.

</details>

<details><summary>Manageability Type (display only)</summary>

Displays the manageability type.

</details>

<details><summary>USB Provisioning</summary>

Options:

1.  **Enabled** - Default.
2.  Disabled - disables USB provisioning.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| USBProvisioning | Disabled, Enabled | yes |


</details>

### SQL Configuration ###

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_sql_configuration.png)

<details><summary>Console Type</summary>

Options:
1. VT100.
1. VT100-8bit.
1. PC-ANSI-7bit.
1. PC-ANSI.
1. **VT100+** - Default.
1. VT-UTF8.
1. ANSCII.

</details>