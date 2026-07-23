# Diagnostics

<!-- TODO:
- Diagnostic LCD Display Mode (Intel(R) version section): Which option is the default was my own guess, not marked in the source.
-->

## AMD version

### **Real-time Diagnostics Monitoring**

Whether to enable Real-time Diagnostics Monitoring.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| RealtimeDIAG | Disable, Enable | Yes | AMD |

### **DIAG 7-Segment Mode**

Options for 7-segment output display (BIOS POST Code & Diagnostic Error Code).

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DIAG7SegMode | Disable, Enable | Yes | AMD |

### **Clear Diagnostics Log Data**

Whether to clear Diagnostics Log Data.

Possible options:

1. **No** - Default.
2. Yes

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ClearDIAGLog | Yes, No | Yes | AMD |

## Intel(R) version

### **Diagnostic LCD Display Mode**

Determines what is shown on the diagnostic LCD display.

Possible options:

1. **Disabled** - Default.
2. Only DIAG Error Code
3. Both BIOS POST & DIAG Error Code

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DiagnosticLcdMode | Disable, Diagnostic Error Codes, BIOS POST & Diagnostic Error Codes | Yes | Intel |
