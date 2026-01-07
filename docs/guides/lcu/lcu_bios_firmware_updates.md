# BIOS/UEFI and Firmware Updates

LSUClient will install BIOS/UEFI updates silently when possible. Like with any other package, those for which a silent installation is supported will have their `.Installer.Unattended` property set to `$True`.

If you get a BIOS/UEFI update for which `.Installer.Unattended` is `$False`, that means it uses a type of installer/flasher for which either no silent install options exist or LSUClient doesn’t support performing silent installs yet.

When you install such a non-silent package, its setup routine will be invoked with the default arguments in the same way System Update would. Likely this will mean a graphical wizard will come up and wait for you to confirm or cancel the update.

## Handling Reboots

```powershell
$results = Install-LSUpdate -Package $updates

if ($results.PendingAction -contains 'REBOOT_MANDATORY') {
    # reboot immediately or set a marker for yourself to perform the reboot shortly
}

if ($results.PendingAction -contains 'SHUTDOWN') {
    # shutdown immediately or set a marker for yourself to perform the shutdown shortly
}

foreach ($update in $updates) {
    $result = Install-LSUpdate -Package $update
    switch ($result.PendingAction) {
        'REBOOT_MANDATORY' { # reboot immediately or set a marker }
        'SHUTDOWN' { # shutdown immediately or set a marker }
    }
}
```

## Filtering Updates

Exclude BIOS updates:
```powershell
$updates = Get-LSUpdate |
    Where-Object { $_.Type -ne 'BIOS' } |
    Where-Object { $_.Category -notmatch "BIOS|UEFI" } |
    Where-Object { $_.Title -notmatch "BIOS|UEFI" }
```

Exclude Firmware updates:
```powershell
$updates = Get-LSUpdate |
    Where-Object { $_.Type -ne 'Firmware' } |
    Where-Object { $_.RebootType -ne 5 } |
    Where-Object { $_.Category -notlike "*Firmware*" } |
    Where-Object { $_.Title -notlike "*Firmware*" }
```

### References
- [Lenovo BIOS flashing SCCM support](https://support.lenovo.com/de/en/solutions/ht507859-bios-flashing-sccm-support-thinkcentre-thinkstation)
- [Reboot delayed updates](https://thinkdeploy.blogspot.com/2019/06/what-are-reboot-delayed-updates.html)

*This Markdown was generated from the LSUClient BIOS/UEFI and Firmware Updates page.*
