# System Update FAQ

!!! note "How to run System Update by command line?"

    System Update can be controlled via command line by leveraging the group policy control for the Administrator Command Line. A typical scenario would have System Update executed by a task in the Windows Task Scheduler set to run on a recurring basis to ensure the device stays current. That scheduled task would execute:

    ```
    C:\Program Files (x86)\Lenovo\System Update\tvsu.exe /CM
    ```

    The rest of the command line parameters would be specified as a Policy in the registry using either Group Policy or by manipulating the registry directly at:

    ```
    HKLM\Software\Policies\Lenovo\System Update\UserSettings\General
    Value: [REG_SZ] AdminCommandLine
    ```

!!! note
    When using a custom scheduled task, a new task should be created, and the default task created when System Update is installed should be disabled.

    Additionally, the "SchedulerAbility" setting must be set to “NO” in the registry at:

    ```
    "HKLM:\SOFTWARE\WOW6432Node\Lenovo\System Update\Preferences\UserSettings\Scheduler"
    ```
    This will prevent System Update from re-enabling the default tasks.

!!! note "Does System Update create temporary admin accounts?"
    Yes.  When System Update is used by a standard user, a temporary admin account is created to enable the installation of updates.  This account has a long, complex, random password that is not recorded anywhere.

    After the updates have been installed, the account will be deleted automatically. In the case where a Reboot Type 1 (Forces Reboot) update is applied, the system will reboot before the account can be removed.  System Update will remove the account the next time it runs.

!!! note "How can reboot prompts to users be suppressed?"
    This is not supported by TVSU. Certain updates—such as BIOS and firmware—are classified as Reboot Type 5, meaning they require a mandatory reboot shortly after installation. The system automatically restarts within 5 minutes, and users cannot delay or dismiss the reboot prompt indefinitely.

    To be safe, these updates are designed to always prompt the user *before* installing them.

    We are exploring potential changes to the Auto Update process in a future release of Commercial Vantage, but there are no plans to modify how TVSU handles updates at this time.
