# RAS Configuration

### **Post Package Repair (PPR)**

Whether to enable PPR support hard Post Package Repair.

!!! warning "Attention"
    On detection of runtime correctable memory errors, this allows one row to be swapped with a spare row. Only one spare row per bank exists, and this repair process is not reversible.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PostPackageRepair | Disable, Enable | Yes | AMD |

### **Patrol Scrub**

Patrol scrubbing proactively searches the system memory, repairing correctable errors.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PatroScrub | Disable, Enable | Yes | AMD |

### **Patrol Scrub Interval**

Select the number of hours required to complete full scrub.

Possible options:

1. **24** - Default.
2. Auto
3. 1
4. 4
5. 8
6. 16
7. 48

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PatroScrubInterval | 24, Auto, 1, 4, 8, 16, 48 | Yes | AMD |

### **Data Scrambling**

Data Scrambling improves memory security.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DataScrambling | Disable, Enable | Yes | AMD |
