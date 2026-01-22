# System Management Password Access Control

![System Management Password](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_smp_access_control.PNG)

Access Security Settings
:  Allow SMP (System Management Password) to have the same authority as SVP (Supervisor Password) to control security settings.

    Options:

    1.  **Disabled** - Default.
    2.  Enabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | AccessSecuritySettings | Disabled, Enabled | yes |

Remote Set SMP
:  Allow remote setting of the SMP via WMI without SVP (Supervisor Password) verification.

    Options:

    1.  **Disabled** - Default.
    2.  Enabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | RemoteSetSMP | Disabled, Enabled | yes |
