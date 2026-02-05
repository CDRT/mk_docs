# Commercial Vantage FAQ

!!! note "How do I enable logging for the System Update process?"
    Due to requirements from the Lenovo Product Security team, logging is not enabled by default any longer. To enable logging, set the following registry value to "True": [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\SystemUpdateAddin\Logs]"EnableLogs"="True"

    Logs can be found in:
    ```%ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs```

!!! note "Are there IP addresses I need to whitelist for Commercial Vantage to function properly?"
    No. The content that Commercial Vantage consumes comes from a Content Delivery Network that uses "edge" servers located all around the world. This allows the content to be pulled from a server that is geographically close. However, there are thousands of IP addresses used in the Content Delivery Network which change over time as the network infrastructure is maintained. There are, however, several domain names that can be whitelisted which cover the endpoints that Commercial Vantage retrieves content from: (HTTPS)

    ```
    download.lenovo.com
    filedownload.lenovo.com
    filedownload.csw.lenovo.com
    supportapi.lenovo.com
    ```

!!! note "Can I control the System Update process by command line?"
    Yes, it is now possible to control the System Update process by command line. This requires the latest version of Commercial Vantage released July 2024 and the SU Helper utility deployed on the clients.  Refer to this introduction article with links to the SU Helper reference guide:  [https://blog.lenovocdrt.com/introducing-su-helper-utility/](https://blog.lenovocdrt.com/introducing-su-helper-utility/)

    You may also continue to use the group policy controls to control the update process by defining the timing and filtering as needed.

    Refer to the **CommercialVantage.admx** under the System Update category for more details.

!!! note "When Commercial Vantage is installed, will it automatically create a scheduled task to install System Updates?"
    A scheduled task is created by a background process a few minutes after installation.  The scheduled task is configured to run weekly, at a random day/time.  The randomness helps manage the load on Lenovo's server (e.g. so that not every Lenovo PC in the world is checking for updates at the same time).  If the PC happens to be turned off (or sleeping) at the time the scheduled task is triggered, then Windows itself should try to execute the scheduled task as soon as possible after it is missed.  The scheduled task can be found in Task Scheduler -> Task Scheduler Library -> Lenovo -> ImController -> Plugins -> LenovoSystemUpdatePlugin_WeeklyTask.  There is an additional task (LenovoSystemUpdatePlugin_TVSUUpdateTask_Once) which is designed to run 1 time shortly after installation to install any pending critical updates.
 </details>

!!! note "Can the administrator use a Group Policy to configure a schedule?"
    Yes, there are policies for this in Group Policy Editor -> Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> System Update.  The day and time can be configured, as well as enabling/disabling auto updates (and preventing the end-user from changing this in the GUI).  You can also configure system update to include or exclude certain categories of updates, such as firmware or BIOS.

    Details about configuring Group Policies, or using registry files instead, can be found in the [Commercial Vantage Deployment Guide](https://docs.lenovocdrt.com/guides/cv/commercial_vantage)  Also here:  [https://support.lenovo.com/us/en/solutions/hf003321](https://support.lenovo.com/us/en/solutions/hf003321)

!!! note "Can an end-user set the date/time for this schedule, using the Commercial Vantage GUI?"
    No.  The only thing the end-user can do is click on "Check for Updates".  If the end user tries to manually adjust the scheduled task within Task Scheduler, Commercial Vantage may overwrite those changes.

!!! note "I have Commercial Vantage installed but I am not getting any updates, why?"
    This can happen in some managed environments which have security solutions that limit the executables that are allowed to run. Usually this can be fix in the security solution application by allowing executables in the ```C:\ProgramData\Lenovo\Vantage``` directory and its sub-directories to run. The updating process is handled by the Lenovo System Update Addin executable located under that directory.
