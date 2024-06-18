# Intelligent Security #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img
   /tp_intelligentsecurity.png)

The Intelligent Security functions provide a convenient way to securely lock and unlock your computer by detecting your presence near the computer.

- [More information at Lenovo Support](https://support.lenovo.com/solutions/ht511536-smart-features)

!!! info ""
    Some of these features may be unavailable, depending on your model and configuration.

<details><summary>User Presence Sensing</summary>

Whether to enable functions that rely on using the IR camera to recognize the user's presence and if the user is looking at the screen.

!!! info ""
    Before using this feature, ensure you create your Face ID with the IR camera.

- [More information at Lenovo Support](https://support.lenovo.com/uu/en/solutions/ht511536-smart-features)

Options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| UserPresenceSensing | Disable, Enable | Yes | Intel |


</details>

<details><summary>Allow Lenovo Vantage to Override Setting Below</summary>

Whether to allow Windows® service to prioritize the settings of Lenovo Vantage, if Lenovo Vantage is installed.

- [More information at Lenovo Support](https://support.lenovo.com/us/en/solutions/ht505081-lenovo-vantage-using-your-pc-just-got-easier)
- [More information at Lenovo.com](https://www.lenovo.com/us/en/software/vantage)

Options:

1. **On** - Default.
2. Off

!!! info ""
    System will enforce BIOS settings if set to `Off`.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ZeroTouchAllowOverride | Disable, Enable | Yes | Intel |


</details>

<details><summary>Zero Touch Login</summary>

Whether to unlock or wake up the computer automatically when you are in front of it or approaching it.

Options:

1. **On** - Default.
2. Off.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ZeroTouchLogin | Disable, Enable | Yes | Intel |


</details>

<div style='margin-left:30px'>
<details><summary>DISTANCE SENSITIVITY ADJUSTING</summary>

!!! info ""
    Depends on Windows® Hello. To use it, turn on face recognition in Windows® settings.

- [More information at Microsoft.com](https://www.support.microsoft.com/en-us/windows/learn-about-windows-hello-and-set-it-up-dae28983-8242-bb2a-d3d1-87c9d265a5f0)

Options:

1. Near
1. **Middle** - Default.
1. Far

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ZeroTouchLoginDistanceAdjusting | Near, Middle, Far | Yes | Intel |


</details>
</div>
<details><summary>Zero Touch Lock</summary>

Whether to dim the display and lock the computer when user presence is not detected.

!!! info ""
    Can reduce the chances of unauthorized access to the computer if you leave the computer unattended and unlocked.

Options:

1. **On** - Default.
2. Off.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ZeroTouchLock | Disable, Enable | Yes | Intel |


</details>
<div style='margin-left:30px'>
<details><summary>SENSITIVITY ADJUSTING</summary>

!!! info ""
    Accuracy varies by body size, posture, and frequency of movement.

Options:

1. Near
1. **Middle** - Default.
1. Far

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ZeroTouchLockDistanceAdjusting | Near, Middle, Far | Yes | Intel |


</details>

<details><summary>AUTO SCREEN LOCK TIMER</summary>

!!! info ""
    Uses sensors and camera to detect your presence. However, it does NOT collect any personal data.

Options:

1. **Fast** - Default.
1. Medium
1. Slow

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ZeroTouchLockTimer | Fast, Medium, Slow | Yes | Intel |


</details>
</div>
