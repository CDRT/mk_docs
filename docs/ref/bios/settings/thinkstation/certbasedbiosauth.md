# Certificate-based BIOS Authentication #

![CB Bios Auth](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/certbased_bios_authentication.PNG)

Beginning with 2022 ThinkPad models, it is now possible to configure systems to use a digital signing certificate instead of a supervisor password. Although this feature does not eliminate the challenge of initially securing the device, it does eliminate the need to exchange passwords in plain text when scripting BIOS settings changes.

Issuer
:	Displays the issuer of the enrolled certificate.

	View only.


Subject
:	Displays the subject of the enrolled certificate.

	View only.


Reset Certificate
:	Remove the enrolled certificate.


Allow the Jumper to Reset Certificate
:	Whether to allow the hardware jumper to reset the enrolled certificate.

	Options:

	1. **Yes** – Default.
	2. No.
