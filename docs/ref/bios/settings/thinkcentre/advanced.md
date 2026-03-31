# Advanced

![Advanced](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_advanced.PNG)

Intel(R) Total Memory Encryption
:  Intel(R) Total Memory Encryption(TME) is a technology that encrypts data written to system memory to protect DRAM data from physical attacks.

    Possible options:

    1. **Disabled** – Default.
    2. Enabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | IntelTotalMemoryEncryption | Disabled, Enabled | Yes |

Intel (R) SIPP Support
:  Intel (R) Stable Image Platform Program aligns and stabilizes key Intel platform components, enabling a predictable transition from one technology generation to the next.

    Possible options:

    1. **Enabled** – Default.
    2. Disabled – disables SIPP.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | IntelSIPPSupport | Disabled, Enabled | Yes |

Intel (R) Thunderbolt
:  
    Possible options:

    1.  **Disabled** – Default.
    2.  Enabled

Dust Shield Alert
:  The user is reminded to clean the Dust Shield.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled – disables the Dust Shield alert.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | DustShieldAlert | Disabled, Enabled | Yes |

    !!! note ""
        If the Dust Shield is not cleaned, it will lose its effectiveness and the machine may overheat.

Intel (R) DPTF Support
:  Intel (R) Dynamic Platform and Thermal Framework (DPTF).

    IDPTF is a power and thermal management solution, used to resolve fan noise, overheating, and performance-related issues of the system.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled – disables DPTF.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | IntelDPTFSupport | Disabled, Enabled | Yes |

Windows Modern Standby
:  [Windows Modern Standby](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby) is the replacement for the legacy Sleep state.

    Possible options:

    1. **Enabled** – Default.
    2. Disabled – disables Windows Modern Standby.

BIOS Self-healing
:  Allows the BIOS to automatically attempt to recover a corrupted BIOS without needing a recovery file on external media.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | BIOSSelfHealing  | Enabled, Disabled | No |

