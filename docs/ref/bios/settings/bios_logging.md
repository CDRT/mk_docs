
# BIOS Event Logging

This feature logs system and BIOS configuration change events.

## How to view event logs <!-- {docsify-ignore} -->

A log viewer application can be launched from the BIOS Setup Menu.

It allows you to

- show logs
- clear logs

!!! info ""
    The clear log process will be run after setup exit.

!!! info ""
    The clear operation is protected by SVP.

- [Main (ThinkPad )](/bios/settings/thinkpad/main)
- [Main (ThinkCentre)](/bios/settings/thinkcentre/main)
- [Main (ThinkStation)](/bios/settings/thinkstation/main.md)

## Details of event logs <!-- {docsify-ignore} -->

The number of slots (16 or 64) varies between events.

Each event has a header with event metadata.

The following events are logged:

- Power On Event
- Subcomponent Measurement Event
- BIOS Password Change Event
- Subcomponent Self-healing Event
- BIOS Setup Configuration Change Event
- Device Change Event
- System Boot Event
- System Preboot Authentication Event
- System Tamper Event
- POST Error Event
- Flash Update Event
- Set On-Premise Event
- Capsule Update Event
- Log Cleared Event
- Shutdown/Reboot Event

The details provided for each event may vary.  An example is shown below:

![Example log entry](thinkpad/img/eventlogentry.png)
