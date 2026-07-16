# Intelligent Security

## General

The Intelligent Security functions provide a convenient way to securely lock and unlock your computer by detecting your presence near the computer.

- [More information at Lenovo Support](https://support.lenovo.com/solutions/ht511536-smart-features)

!!! warning "Attention"
    Some of these features may be unavailable, depending on your model and configuration.

### **User Presence Sensing**

Whether to enable functions that rely on using the IR camera to recognize the user's presence and if the user is looking at the screen.

- [More information at Lenovo Support](https://support.lenovo.com/uu/en/solutions/ht511536-smart-features)

!!! warning "Attention"
    Before using this feature, ensure you create your Face ID with the IR camera.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UserPresenceSensing | Disable, Enable | Yes | Intel |

### **Allow Lenovo Vantage to Override Setting Below**

Whether to allow Windows® service to prioritize the settings of Lenovo Vantage, if Lenovo Vantage is installed.

- [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht505081-lenovo-vantage-using-your-pc-just-got-easier)
- [More information at Lenovo.com](https://www.lenovo.com/us/en/software/vantage)

!!! warning "Attention"
    System will enforce BIOS settings if set to `Off`.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ZeroTouchAllowOverride | Disable, Enable | Yes | Intel |

### **Zero Touch Login**

Whether to unlock or wake up the computer automatically when you are in front of it or approaching it.

Possible options:

1. **On** - Default.
2. Off.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ZeroTouchLogin | Disable, Enable | Yes | Intel |

### **DISTANCE SENSITIVITY ADJUSTING**

Depends on Windows® Hello. To use it, turn on face recognition in Windows® settings.

- [More information at Microsoft.com](https://www.support.microsoft.com/en-us/windows/learn-about-windows-hello-and-set-it-up-dae28983-8242-bb2a-d3d1-87c9d265a5f0)

Possible options:

1. Near
1. **Middle** - Default.
1. Far

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ZeroTouchLoginDistanceAdjusting | Near, Middle, Far | Yes | Intel |

### **Zero Touch Lock**

Whether to dim the display and lock the computer when user presence is not detected.

!!! warning "Attention"
    Can reduce the chances of unauthorized access to the computer if you leave the computer unattended and unlocked.

Possible options:

1. **On** - Default.
2. Off.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ZeroTouchLock | Disable, Enable | Yes | Intel |

### **SENSITIVITY ADJUSTING**

Accuracy varies by body size, posture, and frequency of movement.

Possible options:

1. Near
1. **Middle** - Default.
1. Far

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ZeroTouchLockDistanceAdjusting | Near, Middle, Far | Yes | Intel |

### **AUTO SCREEN LOCK TIMER**

Uses sensors and camera to detect your presence. However, it does NOT collect any personal data.

Possible options:

1. **Fast** - Default.
1. Medium
1. Slow

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ZeroTouchLockTimer | Fast, Medium, Slow | Yes | Intel |
