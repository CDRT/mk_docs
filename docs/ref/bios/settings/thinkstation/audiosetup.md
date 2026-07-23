# Audio Setup Settings

<!-- TODO: Post Beep — name only in spec, no options/description/WMI. -->

## Intel(R) version

### **Onboard Audio Controller**

Enable or disable onboard audio controller.

!!! warning "Attention"
    If set to `Disabled`, the `Internal Speaker` setting will be unavailable.

Possible options:

1. **Enabled**. Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| OnboardAudioController | Disabled, Enabled | Yes | Intel |

### **Internal Speaker**

Whether the internal speaker is available in the OS.

!!! warning "Attention"
    Unavailable if `Onboard Audio Controller` is set to `Disabled`.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| InternalSpeaker | Disabled, Enabled | Yes | Both |

### **Post Beep**

Whether to sound a beep at the end of POST (Power On Self Test).

## AMD version

### **Front Audio Controller**

Whether to enable Front Audio Controller.

!!! warning "Attention"
    Setting to disabled also disables all front USB ports (both 2.0 and 3.0) and Rear Audio Controller.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FrontAudioController | Enabled, Disabled | Yes | AMD |

### **Rear Audio Controller**

Whether to enable Rear Audio Controller.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| RearAudioController | Disable, Enable | Yes | AMD |
