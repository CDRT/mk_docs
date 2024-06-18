# System Management Password Access Control

![](./img/tc_smp_access_control.png)

<details><summary>Access Security Settings</summary>

Allow SMP (System Management Password) to have the same authority as SVP (Supervisor Password) to control security settings.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| AccessSecuritySettings | Disabled, Enabled | yes |


</details>

<details><summary>Remote Set SMP</summary>

Allow remote setting of the SMP via WMI without SVP (Supervisor Password) verification.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| RemoteSetSMP | Disabled, Enabled | yes |


</details>
