# Fingerprint Settings

### **Predesktop Authentication**

Whether to enable authentication by a fingerprint at predesktop.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FingerprintPredesktopAuthentication | Disable, Enable | Yes | Both |

### **Security Mode**

Whether to require authentication by Power-On Password or Supervisor Password, or only by Supervisor Password, when no fingerprint is authenticated, to boot.

!!! warning "Attention"
    When `High` security mode is enabled, **only** the Supervisor Password will allow boot.

Possible options:

1. **Normal** - Default.
2. High

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FingerprintSecurityMode | Normal, High | Yes | Both |

### **Password Authentication**

Whether to enable authentication by password when fingerprint is not available.

!!! warning "Attention"
    Visible and active only if `Security Mode` has value `High`.

    Administrators are authenticated by a Supervisor Password.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FingerprintPasswordAuthentication | Disable, Enable | Yes | Both |

### **Single-touch authentication**

Whether to allow a single touch fingerprint authentication to work through all security levels.

!!! warning "Attention"
    Switching off means requiring individual fingerprint authentication for each security level.

Possible options:

1. **On** - Default.
2. Off.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FingerprintSingleTouchAuthentication | On, Off | yes | both |

### **Reset Fingerprints Data**

Erase all fingerprint data stored in the fingerprint reader and reset settings to the factory state (ex. Power-on security, LEDs, etc.).

!!! warning "Attention"
    Any power-on security features previously enabled will not be able to work until they are re-enabled in fingerprint software.

    **Requires additional confirmation.**
