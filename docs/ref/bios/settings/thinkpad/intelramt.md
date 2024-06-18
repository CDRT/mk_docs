# Intel(R) AMT Settings #
![](./img/tp_intelramt.png)

<details><summary>Intel (R) AMT Control</summary>

Whether to enable Intel (R) Active Management Technology Control.

Possible options:

1.	**Enabled** - Default.
2.	Disabled
3.	Permanently Disabled

!> `Permanently Disabled` can be selected only once and permanently turns off Intel (R) ATM Control (cannot be reenabled). 

!> Additional confirmation for this action will be required because it cannot be undone.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| AMTControl | Disable, Enable | No | Intel |

</details>

<details><summary>USB Key Provisioning</summary>

Whether to enable USB Key Provisioning.

?> Active only when ‘Intel (R) ATM Control’ has value ‘Enabled’.

Possible options:

1.	**Off** - Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| USBKeyProvisioning | Disable, Enable | Yes | Intel |

</details>

<details><summary>CIRA Timeout</summary>

Define timeout for Client Initiated Remote Access connection to be established.

?> The value is in seconds and can be varied from 1 to 254.

!> 0 and 255 have the following special meanings: <br> **0** - use the default timeout of 60 seconds. Default.<br> 255 - wait until the connection succeeds.

</details>

<details><summary>Console Type</summary>

Select console type.

Possible options:

1.	**VT100+** - Adds function keys F5 to F14. Default.
2.	VT100 
3.	VT-UTF8 - Adds function key F8
4.	PC ANSI

?>  This console type must match the Intel AMT remote console.

</details>
