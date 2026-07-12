# Certificate-based BIOS Authentication

![Certificate](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_certbasedbiosauth.png)

Beginning with 2022 ThinkPad models, it is now possible to configure systems to use a digital signing certificate instead of a supervisor password. Although this feature does not eliminate the challenge of initially securing the device, it does eliminate the need to exchange passwords in plain text when scripting BIOS settings changes.

Learn more here:

[ThinkDeploy Blog article: Certificate-based BIOS Authentication](https://blog.lenovocdrt.com/certificate-based-bios-authentication/)

[Lenovo BIOS Certs Tool Reference](https://docs.lenovocdrt.com/guides/lbct/)

Reset Supervisor Certificate
:  Remove the enrolled Supervisor certificate.

    !!! note ""
        Grayed out if 'Subject' and 'Issuer' are both 'No Certificate'.

Reset System Management Certificate
:  Remove the enrolled System Management certificate.

    !!! note ""
        Grayed out if 'Subject' and 'Issuer' are both 'No Certificate'.

Supervisor Certificate Information
:  View-only display of the currently enrolled Supervisor certificate.

    Subject:
    :  The subject of the enrolled Supervisor certificate.

        Possible options:

        1. **No Certificate** – Default.

    Issuer:
    :  The issuer of the enrolled Supervisor certificate.

        Possible options:

        1. **No Certificate** – Default.

System Management Certificate Information
:  View-only display of the currently enrolled System Management certificate.

    Subject:
    :  The subject of the enrolled System Management certificate.

        Possible options:

        1. **No Certificate** – Default.

    Issuer:
    :  The issuer of the enrolled System Management certificate.

        Possible options:

        1. **No Certificate** – Default.
