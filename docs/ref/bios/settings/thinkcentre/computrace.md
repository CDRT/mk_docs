# Computrace

### **Absolute Persistence Version**

Display only.

### **Absolute Persistence Module**

Use this setting to enable or disable the firmware Persistence® module of the optional service from Absolute®.

!!! warning "Attention"
    Absolute® is a service designed to help track devices and provide recovery services in the event a device is lost or stolen. Once installed, the Absolute agent communicates with the Absolute Monitoring Center at programmed intervals to provide the tracking service. By installing the agent and activating the service, you consent to the transmission of information between your device and the Absolute Monitoring Center. For customers who have purchased the Absolute service, the firmware Persistence Module checks for the presence and health of Absolute on boot, and restores the functionality in case of agent removal or tampering. "Absolute" and "Persistence" are registered trademarks of Absolute Software Corporation.

Possible options:

1. **Enabled** - Default.
2. Disabled
3. Permanently disabled

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| AbsolutePersistenceModule | Enabled, Disabled, PermanentlyDisabled | Yes |
