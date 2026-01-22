# Absolute Persistence(R) Module Settings

![Absolute Persistence](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_abspersistencemodule.png)

Current Settings
:  The Absolute Persistence module is an optional monitoring service from Absolute Software.

    One of 3 Possible options:

    1. **Enabled** – Default.
    2. Disabled
    3. Permanently Disabled

    !!! note ""
        If the module is permanently disabled, it cannot be reenabled. `Permanently Disabled` requires additional confirmation and can only be done through the BIOS Setup screens. 

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | AbsolutePersistenceModuleActivation | Disable, Enable | Yes | Both |

Current State
:   Whether Absolute Persistence is activated in OS.

    Possible options:

    1. **Not Activated** – Default.
    2. Activated
