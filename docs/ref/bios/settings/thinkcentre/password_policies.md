# Password Policies #


![](./img/tc_password_policies.png)

 - [More information at Lenovo Support - types of password](https://support.lenovo.com/us/en/solutions/ht513634)
 - [More information at Lenovo Support - password manager](https://support.lenovo.com/us/en/solutions/ht103666-introduction-to-password-manager-thinkpad-thinkcentre-thinkstation)

<details><summary>Set Minimum Length</summary>

Options:

 *  **Disabled** - no minimum (see below). Default.
 *   4 - 12 characters minimum.

!!! info ""
    If no minimum is set, passwords may be 1 to 128 characters long.

!!! info ""
    If a minimum is set, it applies to:
 - Supervisor Password (SVP)
 - System Management Password (SMP)
 - Power-on (POP) and Hard Disk Passwords 

!!! info ""
    If both `Set Minimum Length` and `Set Strong Password` are enabled, the longest value for minimum length applies.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SetMinimumLength | Disabled, 4 characters, 5 characters, 6 characters, 7 characters, 8 characters, 9 characters, 10 characters, 11 characters, 12 characters | yes |


</details>

<details><summary>Set Strong Password</summary>

Options:

1.  **Enabled** - Upper case, lower case and numeric characters are all required. Special characters are optional. The minimum length is 8. Default.
1.  Disabled - The minimum length is 1 character.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SetStrongPassword | Disabled, Enabled | yes |


</details>

<details><summary>Keyboard Layout</summary>

Select the keyboard language for password.

Options:

1.  **English** - Default.
2.  French
3.  German
4.  Russian
5.  Chinese

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| KeyboardLayout | English, French, German, Chinese | yes |


</details>

<details><summary>BIOS Password At System Boot</summary>

Whether to give a BIOS password prompt at system boot (when the system starts from the full off or hibernate state):

1.  **Yes** - Default.
1.  No.

!!! info ""
    To prevent unauthorized access to the system, we recommend setting user authentication on the OS.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| BIOSPasswordAtSystemBoot | No, Yes | yes |


</details>

<details><summary>BIOS Password At Reboot</summary>

Whether the power-on password (POP) is required when system restarts.

Options:

1.  **No** - Default.
1.  Yes.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| BIOSPasswordAtReboot | No,Yes | yes |


</details>

<details><summary>BIOS Password At Boot Device List</summary>

Whether the user is prompted for a password when F12 is pressed during POST (and an administrator password was set).

Options:

1.  **No** - Default.
1.  Yes.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| BIOSPasswordAtBootDeviceList | No, Yes | yes |


</details>

<details><summary>Require SVP when Flashing</summary>

Whether the supervisor password (SVP) is required when updating the system firmware.

Options:

1.  **No** - Default.
1.  Yes.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| RequireSVPwhenFlashing | No, Yes | yes |


</details>

<details><summary>POP Changeable by User</summary>

Whether the Power-On Password (POP) can be changed by users, or else, only with the Supervisor Password (SVP).

Options:

1.  **Yes** - Default.
2.  No.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| POPChangeablebyUser | No, Yes | yes |


</details>

<details><summary>Allow the Jumper to Clear SVP</summary>

Whether to allow the hardware jumper to clear the Supervisor
password.

Options:

1.  **Yes** - Default.
2.  No.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| AllowJumperClearSVP | No, Yes | yes |

!!! info ""
    When disabled, no action can reset the SVP if you forget it.


</details>

<details><summary>Password Count Exceeded Error</summary>

Whether to show the POST 0199 error and password prompt:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PasswordCountExceededError | Disabled, Enabled | yes |

 - [More information at Lenovo Support](https://support.lenovo.com/lt/en/solutions/ht052093-error-0199-system-security-security-password-retry-count-exceeded-thinkcentre-m90-m90p-thinkserver-ts200v-thinkstation-e20)


</details>