# Serial Port Setup Settings

### **Serial Port1 Address**

Select whether serial port #1 will be available to the OS, and if so, which interrupt line to assign it to.

Possible options:

1. **3F8/IRQ4** – Default.
2. Disabled
3. 2F8/IRQ3
4. 3E8/IRQ4
5. 2E8/IRQ3

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SerialPort1Address | 3F8/IRQ4, Disabled, 2F8/IRQ3, 3E8/IRQ4, 2E8/IRQ3 | Yes | Both |

### **Serial Port2 Address**

Select whether serial port #2 will be available to the OS, and if so, which interrupt line to assign it to.

Possible options:

1. **2F8/IRQ3** – Default.
2. Disabled
3. 3F8/IRQ4
4. 3E8/IRQ4
5. 2E8/IRQ3

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SerialPort2Address | 2F8/IRQ3, Disabled, 3F8/IRQ4, 3E8/IRQ4, 2E8/IRQ3 | Yes | Both |
