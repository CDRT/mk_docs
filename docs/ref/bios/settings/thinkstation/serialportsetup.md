# Serial Port Setup Settings #
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_serialportsetup.png)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /serialportsetup.png)-->

<details><summary>Serial Port1 Address</summary>

Select whether serial port #1 will be available to the OS, and if so, which interrupt line to assign it to.

Options:

1.	Disabled.
2.	**3F8/IRQ4** – Default.
3.	2F8/IRQ3
4.	3E8/IRQ4
5.	2E8/IRQ3

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SerialPort1Address | Disabled, 3F8/IRQ4, 2F8/IRQ3, 3E8/IRQ4, 2E8/IRQ3 | yes | Both |

</details>

<details><summary>Serial Port2 Address</summary>

Select whether serial port #2 will be available to the OS, and if so, which interrupt line to assign it to.

Options:

1.	Disabled.
2.	3F8/IRQ4
3.	**2F8/IRQ3** – Default.
4.	3E8/IRQ4
5.	2E8/IRQ3

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SerialPort2Address | Disabled, 3F8/IRQ4, 2F8/IRQ3, 3E8/IRQ4, 2E8/IRQ3 | yes | Both |

</details>
