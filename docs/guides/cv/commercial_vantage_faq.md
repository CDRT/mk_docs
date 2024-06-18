## Commercial Vantage FAQ <!-- {docsify-ignore} -->

<details>
<summary>Can I control the System Update process by command line?</summary>
No.  Because Commercial Vantage is a UWP app, the process to get driver and firmware updates cannot be initiated by command line.

To control the update process, use the Commercial Vantage policies that define the timing and filtering as needed.  

See [Commercial Vantage Policies](/cv/management/intune/system_update.md) under the System Update category for more details.
</details>

<details>
<summary>When Commercial Vantage is installed, will it automatically create a scheduled task to install System Updates?</summary>
A scheduled task is created by a background process a few minutes after installation.  The scheduled task is configured to run weekly, at a random day/time.  The randomness helps manage the load on Lenovo's server (e.g. so that not every Lenovo PC in the world is checking for updates at the same time).  If the PC happens to be turned off (or sleeping) at the time the scheduled task is triggered, then Windows itself should try to execute the scheduled task as soon as possible after it is missed.  The scheduled task can be found in Task Scheduler -> Task Scheduler Library -> Lenovo -> ImController -> Plugins -> LenovoSystemUpdatePlugin_WeeklyTask.  There is an additional task (LenovoSystemUpdatePlugin_TVSUUpdateTask_Once) which is designed to run 1 time shortly after installation to install any pending critical updates. 
</details>

<details>
<summary> Can the administrator use a Group Policy to configure a schedule?</summary>
Yes, there are policies for this in Group Policy Editor -> Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> System Update.  The day and time can be configured, as well as enabling/disabling auto updates (and preventing the end-user from changing this in the GUI).  You can also configure system update to include or exclude certain categories of updates, such as firmware or BIOS.  

Details about configuring Group Policies, or using registry files instead, can be found in the [Commercial Vantage Deployment Guide](/cv/commercial_vantage.md)  Also here:  https://support.lenovo.com/us/en/solutions/hf003321
</details>

<details>
<summary>Can an end-user set the date/time for this schedule, using the Commercial Vantage GUI?</summary>
No.  The only thing the end-user can do is click on "Check for Updates".  If the end user tries to manually adjust the scheduled task within Task Scheduler, Commercial Vantage may overwrite those changes.
</details>

<details>
<summary>Why can't I find a log file for the LenovoSystemUpdateAddin?</summary>
Due to requirements from the Lenovo Product Security team, logging is not enabled by default any longer.  To enable logging, set the following registry value to "True":

```Registry
[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\SystemUpdateAddin\Logs]
"EnableLogs"="True"
```

</details>
