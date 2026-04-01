# Audio Setup Settings #

## Intel version

![Audio Setup Intel](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_audiosetup.PNG)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /audiosetup.png)-->

Onboard Audio Controller
:	Enable or disable onboard audio controller.

	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	!!! note ""
		If set to `Disabled`, the `Internal Speaker` setting will be unavailable.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| OnboardAudioController | Disabled, Enabled | Yes | Intel |



Internal Speaker
:	Whether the internal speaker is available in the OS.

	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	!!! note ""
		Unavailable if `Onboarding Audio Controller` is set to `Disabled`.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| InternalSpeaker | Disabled, Enabled | Yes | both |



### AMD Version ###

![Audio Setup AMD](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_audiosetup.PNG)

Front Audio Controller
:	Whether to enable Front Audio Controller.

	!!! note ""
		Setting to disabled also disables all front USB ports (both 2.0 and 3.0) and Rear Audio Controller.

	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| FrontAudioController | Enabled, Disabled | Yes | AMD |



Rear Audio Controller
:	Whether to enable Rear Audio Controller.

	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| RearAudioController | Disable, Enable | Yes | AMD |






