---
title: Commercial Vantage FAQ
description: Frequently asked questions about Commercial Vantage deployment and configuration
---

# Commercial Vantage FAQ

## Logging & Diagnostics

??? note "How do I enable logging for the System Update process?"
    
    Due to requirements from the Lenovo Product Security team, logging is disabled by default.
    
    **To enable:**
    
    Set this registry value to "True":
    ```registry
    [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\SystemUpdateAddin\Logs]
    "EnableLogs"="True"
    ```
    
    **Log location:**
    ```
    %ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs
    ```

---

## Networking & Connectivity

??? note "What IP addresses do I need to whitelist for Commercial Vantage?"
    
    **Short answer:** None. Whitelist domain names instead.
    
    Commercial Vantage uses a Content Delivery Network (CDN) with thousands of IP addresses that change over time. Instead of tracking IPs, whitelist these domain names (HTTPS):
    
    ```
    download.lenovo.com
    filedownload.lenovo.com
    filedownload.csw.lenovo.com
    supportapi.lenovo.com
    ```
    
    This covers all endpoints Commercial Vantage connects to.

---

## System Update – General

??? note "Can I control the System Update process from the command line?"
    
    **Yes**, using the SU Helper utility (requires Commercial Vantage v20.2407.66.0 or later + SU Helper deployed).
    
    **Resources:**
    - [Introducing SU Helper](https://blog.lenovocdrt.com/introducing-su-helper-utility/)
    - [SU Helper Reference Guide](./suhelper.md)
    
    **Alternative:** Use Group Policy to configure timing and filtering. See [Configuration Guide](./configuration.md) → System Update section.

??? note "Does Commercial Vantage automatically create a scheduled task for updates?"
    
    **Yes.** A few minutes after installation, a background process creates the scheduled task:
    
    **Task location:** Task Scheduler → Task Scheduler Library → Lenovo → ImController → Plugins
    
    **Two tasks are created:**
    
    | Task Name | Purpose |
    | --- | --- |
    | `LenovoSystemUpdatePlugin_WeeklyTask` | Runs weekly at random day/time to check for updates |
    | `LenovoSystemUpdatePlugin_TVSUUpdateTask_Once` | Runs once after installation to install pending critical updates |
    
    **Randomized timing:** The random day/time helps distribute load across Lenovo's servers (prevents all devices checking simultaneously).
    
    **If PC is off/sleeping:** Windows will attempt to run the task as soon as possible after it's missed.

??? note "Can administrators customize the update schedule?"
    
    **Yes.** Use Group Policy to configure:
    
    **Location:** Computer Configuration → Administrative Templates → Commercial Vantage → Device → System Update
    
    **Options:**
    - Set specific day and time for updates
    - Enable/disable auto-update entirely
    - Prevent end-users from changing these settings in the GUI
    - Include or exclude update categories (firmware, BIOS, drivers, software)
    
    **For details:** See [Configuration Guide](./configuration.md) → System Update section

??? note "Can end-users modify the update schedule in Commercial Vantage?"
    
    **No.** End-users can only click "Check for Updates" manually.
    
    If an end-user manually adjusts the scheduled task in Task Scheduler, Commercial Vantage will overwrite those changes.

---

## Troubleshooting

??? note "I have Commercial Vantage installed but I'm not receiving any updates. Why?"
    
    This commonly happens in managed environments with strict security policies.
    
    **Check these first:**
    
    1. **Security solution blocking executables:**
       - The System Update Addin runs from: `C:\ProgramData\Lenovo\Vantage\`
       - Whitelist this directory and all subdirectories to allow execution
    
    2. **Check logs for errors:**
       - Location: `%ProgramData%\Lenovo\Vantage\Logs\`
       - Enable logging if needed (see [Logging & Diagnostics](#logging--diagnostics))
    
    3. **Verify network connectivity:**
       - Ensure the device can reach Lenovo CDN (see [Networking & Connectivity](#networking--connectivity))
    
    4. **Restart the Vantage Service:**
       ```powershell
       Restart-Service -Name VantageService
       ```
    
    If still failing, see [Upgrading Guide](./upgrading.md) → Update Failures & Recovery

---

## Quick Reference

| Question | Resource |
| --- | --- |
| Command-line System Update control | [SU Helper Reference](./suhelper.md) |
| Configure policies and schedules | [Configuration Guide](./configuration.md) |
| Troubleshoot failed updates | [Upgrading Guide](./upgrading.md) |
| Whitelist domains | [Networking section](#networking--connectivity) |
| Enable debug logging | [Logging section](#logging--diagnostics) |
| Enterprise Package download | [Lenovo Support](https://support.lenovo.com/us/en/solutions/hf003321) |
