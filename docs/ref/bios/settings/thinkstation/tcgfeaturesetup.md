# TCG Feature Setup Settings

### **TCG Security Device State**

Shows TCG (Trusted Computing Group) Security Device State.

View only.

Possible values:

1. Discrete TPM 2.0
2. Firmware TPM 2.0

### **TCG Security Device**

Select the type of TCG Security Device:

!!! warning "Attention"
    - Selecting a different option requires additional confirmation.
    - Before changing the TCG Security Device, all TPM related applications must be disabled, otherwise you may not be able to access your data.

Possible options:

1. **Discrete TPM** – Default.
2. Firmware TPM

### **Security Chip 2.0**

Whether to enable TCG security feature.

!!! warning "Attention"
    When set to `Disabled`, then TxT will be set to `Disabled` automatically and `Clear TCG Security Feature` becomes unavailable.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SecurityChip | Disabled, Enabled | Yes | Both |

### **Clear TCG Security Feature**

!!! warning "Attention"
    - Available only when `Security Chip 2.0` is `Enabled`.
    - If set to `Yes`, any data in TPM will be cleared.

Possible options:

1. **No** – Default.
2. Yes

### **Physical Presence for Clear**

Whether confirmation of a user's physical presence is needed when clearing the security chip.

!!! warning "Attention"
    When `Enabled`, the system will display a user confirmation screen when clearing.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PhysicalPresenceforClear | Disabled, Enabled | Yes | Both |

### **Security Chip Selection**

Selects which security chip is used as the TCG (Trusted Computing Group) Security Device.

Possible options:

1. **Discrete TPM 2.0** – Default.
2. Pluton TPM 2.0

### **Pluton Security Processor**

Whether to enable the Microsoft(R) Pluton security processor.

!!! warning "Attention"
    Only available when `Security Chip Selection` is `Pluton TPM 2.0`.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PlutonSecurityProcessor | Disable, Enable | Yes | Both |
