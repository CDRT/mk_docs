# Secure Boot Settings

## General

### **System Mode**

Shows the current system mode.

View only.

Possible values:

1. **Deployed Mode** - Default.
2. Audit Mode
3. User Mode
4. Setup Mode

### **Secure Boot**

Secure Boot means that the BIOS will prevent any un-authorized OS from being loaded.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SecureBoot | Disabled, Enabled | Yes | Both |

### **Restore Factory Keys**

Reset Factory Keys will put secure boot into factory defaults.

!!! warning "Attention"
    Requires additional confirmation.

### **Reset Platform to Setup Mode**

Reset to setup mode will move secure boot to setup mode.

!!! warning "Attention"
    Requires additional confirmation.

### **Enter Audit Mode**

Enter Audit Mode workflow.

!!! warning "Attention"
    - Transition from User to Audit Mode will result in erasing of PK (Platform Key) value.
    - Requires additional confirmation.

### **Enter Deployment Mode**

Transition between User and Deployment modes.

!!! warning "Attention"
    Requires additional confirmation.

### **Allow Microsoft 3rd Party UEFI CA**

!!! warning "Attention"
    If add-on Cards are supported, Microsoft 3rd Party UEFI CA will not be removed until load boot loader.

Possible options:

1. **Enabled** – Default. Microsoft 3rd Party UEFI CA will be installed in Secure Boot DB. This device will trust it in Secure Boot.
2. Disabled - Microsoft 3rd Party UEFI CA will be removed in Secure Boot DB.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AllowMicrosoft3rdPartyUEFICA | Enabled, Disabled | | AMD |

## Key Management

### **Platform Key (PK)**

The platform key establishes a trust relationship between the platform owner and the platform firmware. The platform owner enrolls the public half of the key into the platform firmware. The platform owner can later use the private half of the key to change platform ownership or to enroll a Key Exchange Key.

### **Key Exchange Key (KEK)**

Key exchange keys establish a trust relationship between the operating system and the platform firmware. Each operating system (and potentially, each 3rd party application that needs to communicate with platform firmware) enrolls a public key into the platform firmware.

### **Authorized Signature Database (DB)**

Database keys shows the list of allowed certificates. System will check digital signatures of bootloaders using public keys in the DB. Only software or firmware which has a bootloader signed with a corresponding private key will be allowed to run.

### **Forbidden Signature Database (DBX)**

Forbidden Signature Database shows not allowed certificates. System will block any software or firmware signed with a corresponding private key.

### **Authorized TimeStamps (DBt)**

If present, contains the platform-defined secure boot timestamp signature database. This is not used at runtime but is provided in order to allow the OS to recover the OEM's default key setup.

### **OsRecovery Signatures (DBr)**

If present, contains the platform-defined secure boot authorized recovery signature database. This is not used at runtime but is provided in order to allow the OS to recover the OEM's default key setup.
