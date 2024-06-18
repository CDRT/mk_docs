# Memory Protection Settings #

![](./img/tp_memoryprotection.png)

<details><summary>Execution Prevention</summary>

?> If your OS supports Data Execution Prevention, this setting can prevent virus/worm attacks that create memory buffer overflows by running code where only data is allowed.

Possible options:

1.	On
2.	**Off** – Default.

!>  Reset to `Off` if your required applications cannot run.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| DataExecutionPrevention | Disable, Enable | Yes | Both |

</details>

<details><summary>Intel(R) Total Memory Encryption</summary>

Protects DRAM data from physical attacks.

!> Impacts when `On`: <br> - System memory tools, such as memtest86 and Lenovo Diagnostic-Memory test, will not work correctly <br> - System performance will degrade by estimated 3-5%.

Possible options:

1.	On
2.	**Off** – Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| TotalMemoryEncryption | Disable, Enable | Yes | Intel |

</details>
