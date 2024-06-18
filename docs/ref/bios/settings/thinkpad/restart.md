# Restart

![](./img/tp_restart.png)

<details><summary>Exit Saving Changes</summary>

Exit Setup and save your changes.

!!! info ""
    The option requires additional confirmation.

</details>

<details><summary>Exit Discarding Changes</summary>

Exit Setup without saving changes.

!!! info ""
    The following changes WILL NOT be discarded and must be reset within ThinkPad Setup: <br> - Date & Time <br>- Supervisor Password <br>- Power-on password <br>- Hard disk password <br>

!!! info ""
    The option requires additional confirmation.

</details>
<details><summary>Save Custom Defaults -and- Load Custom Defaults</summary>

This feature was introduced in 2023 products and allows you to create a custom set of default settings that differ from the factory defaults. These custom default settings can be applied to the system again using the Load Custom Defaults option in the UI or by pressing F9. When custom default settings have been saved and F9 is pressed, a dialog will appear with the option to select Factory Defaults or Custom Defaults.

It is important to note that Security, Date & Time, and Boot Order settings are excluded from the custom defaults.

!!! info ""
    If a user performs the Reset System to Factory Defaults function under the Security menu, the custom defaults will be cleared and the system will revert back to the factory default settings.

The following WMI methods are available to exercise this feature and are subject to Supervisor Password or Certificate-based authentication:

- Lenovo_SaveCustomDefaultSettings
- Lenovo_SaveCustomDefaultSettingsEx
- Lenovo_LoadCustomDefaultSettings
- Lenovo_LoadCustomDefaultSettingsEx
- Lenovo_LoadFactoryDefaultSettings

</details>

<details><summary>Load Setup Defaults -or- Load Factory Defaults</summary>

Load default values for all Setup items. The name shown in BIOS Setup for this feature changed to Load Factory Defaults in 2023 products.

!!! info ""
    The following changes WILL NOT be discarded and must be reset within ThinkPad Setup: <br> - Security <br>- Date & Time <br>

</details>

<details><summary>OS Optimized Defaults</summary>

Whether to enable OS Optimized Defaults for the following:

- Secure Boot
- Secure RollBack Prevention
- Virtualization features

!!! info ""
    Select ‘On’ to meet Microsoft (R) Windows 10 (R) Certification Requirement.

!!! info ""
    When switching from ‘Enabled’ state the option will require additional confirmation.

Possible options:

1.	**Off** - Default.
2.	On



</details>

<details><summary>Discard Changes</summary>

Load previous values for most Setup items.

!!! info ""
    The following changes WILL NOT be discarded and must be reset within ThinkPad Setup: <br> - Date & Time <br> - Supervisor password <br> - Power-on password <br> - Hard disk password <br> 

!!! info ""
    The option requires additional confirmation.


</details>

<details><summary>Save Changes</summary>

Save Setup data.


</details>
