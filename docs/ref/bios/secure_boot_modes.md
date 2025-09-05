# Guide to Secure Boot Modes

>by Daniel Köllner, Lenovo (Deutschland) GmbH

## What is Secure Boot?

UEFI Secure Boot is a security technology that ensures only trusted software is executed during a computer's startup process. The primary goal is to prevent the loading of malware or unauthorized boot loaders before the main operating system has loaded.

How it works is both simple and effective:

- Signature Verification: The computer's firmware checks the signature of every single software component that is launched. This includes firmware drivers, EFI applications, and especially the operating system.
- Trust Database: This check is performed against certificates stored in secure databases (called db and dbx) located directly in the UEFI firmware. Only if a signature is recognized as valid and trustworthy will the corresponding software be allowed to run.
- Key Management: This entire process is managed by cryptographic keys, such as the Platform Key (PK) and the Key Exchange Key (KEK), which ensure the integrity of the databases themselves.

This mechanism establishes a secure chain of trust from the moment the device is powered on until the operating system is fully loaded.

Multiple keys and databases are used for management:

:material-key-variant: **PK (Platform Key)** - The central platform signature. Set after manufacturing and signals that the firmware is read-only. The PK can sign updates to the KEKs or the deactivation of Secure Boot.

:material-key-variant: **KEK (Key Exchange Key)** - List of keys that are authorized to update the signature database (DB) and the revocation list (DBX).

:material-database: **DB and DBX** - Databases with allowed (DB) and revoked (DBX) signatures and hash values. These are prepopulated by the OEM during production.

The combination of these variables determines the "secure boot mode" of the system. Modern UEFI implementations have at least four modes:

- Setup Mode
- User Mode
- Audit Mode
- Deployed Mode

Lenovo devices launched through 2023 usually only use Setup Mode and User Mode; while newer ThinkPads launched after that also support Audit Mode and Deployed Mode.

## Overview of the Secure Boot Modes in UEFI

| Mode          | Description                                                                                         |
|---------------|-----------------------------------------------------------------------------------------------------|
| **Setup Mode** | Initial manufacturer mode without an installed Platform Key. Allows the installation of keys without signature verification. |
| **User Mode**  | Standard mode with an installed PK. Performs signature checks but allows updates with valid KEKs.  |
| **Deployed Mode** | Strictest mode with a PK and an activated DeployedMode flag. Prevents unauthorized changes to the Secure Boot configuration. |
| **Audit Mode** | Test mode without a PK. Logs all signature checks but allows all images to pass. Ideal for testing new key sets. |

### Setup Mode

> **Purpose**: Initial manufacturer mode. No Platform Key installed yet (PK is deleted).
>
> **Features**: The firmware allows keys to be imported without signature verification; this allows the PK, KEKs and db/dbx to be set initially. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=The%20platform%20owner%20enrolls%20the,immediately%20transition%20to%20user%20mode) If a PK is installed, the system immediately switches to User Mode
>
>**Usage**: Used during production or after the PK is deleted to initialize or reset Secure Boot. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=The%20platform%20owner%20enrolls%20the,immediately%20transition%20to%20user%20mode)

### User Mode

> **Prerequisite**: A valid PK is installed, AuditMode flag = 0, DeployedMode flag = 0. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=After the Platform Key is,Deployed Mode)
>
> **Behavior**: The firmware performs the usual signature checks of EFI images (OS loaders, option ROMs, drivers). Programmatic updates of the secure boot databases (db, dbx, KEK) are possible if they are signed with a valid key exchange key. The UEFI specification allows the key databases to be written in user mode, as long as the data is signed with a previously registered KEK or the Platform Key. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=,priv%7D%3B%20or%20if) Unrestricted mode transitions to audit mode or deployed mode are possible; changing the variables does not require physical access. According to the specification, transitions to the stricter modes can be triggered from User Mode without additional authentication. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Deployed%20Mode%20is%20the%20most,the%20PK%2C%20which%20is%20authenticated)
>
> **Usage**: For a long time, this mode was the only "active" Secure Boot operating mode in practice and is used on many ThinkPad models since 2023.

### Audit Mode

> **Prerequisite**: The PK is removed, no Platform Key is available. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=32)
>
> **Behavior**: The firmware logs all signature checks in the Image Execution Information Table, but still allows the checked images regardless of whether the signature is valid. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Audit%20Mode%20enables%20programmatic%20discovery,signed%20images) Updates to the db/dbx and KEKs are not signed. This mode is suitable for testing new key sets without the risk of a system that no longer boots. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Audit%20Mode%20enables%20programmatic%20discovery,signed%20images)
>
> **Usage**: Used by the vendor or administrator to evaluate which signature lists are needed before a system is put into deployed mode.

### Deployed Mode

> **Prerequisite**: A valid PK is installed and the variable DeployedMode is set to 1. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=32)
>
> **Behavior**: Strictest operating mode: The BIOS firmware checks every update of the policy objects (db/dbx/KEK) against the existing keys and restricts programmatic mode transitions. An automatic switch to audit or setup mode is no longer possible; this requires either the deletion of the PK or a company-specific procedure. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Deployed%20Mode%20is%20the%20most,the%20PK%2C%20which%20is%20authenticated) Deployed Mode ensures that the Secure Boot configuration is not changed without authorization. This mode is therefore particularly intended for OEM devices that are delivered to end customers.
>
> **Usage**: Since UEFI 2.5, Deployed Mode is recommended as a "full" Secure Boot mode. Lenovo introduced this feature in ThinkPads from 2025.

## Differences between User Mode and Deployed Mode

The biggest difference is the degree of limitation and the type of updates:

- **Key Management**: Both User Mode and Deployed Mode require a Platform Key to be present. In User Mode, db/dbx/KEK can be updated with a valid signature; Deployed Mode also checks these updates but prohibits automated switching to less secure modes.
- **Mode transitions**: In User Mode, an administrator can trigger the switch to Audit Mode or Deployed Mode via scripts or tools without physical access. In Deployed Mode, the keys must be removed manually or deleted via a special "Exit Deployed Mode" in the BIOS, as other mode changes will be blocked. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Deployed%20Mode%20is%20the%20most,the%20PK%2C%20which%20is%20authenticated)
- **Security level**: Deployed mode is the safest mode according to the UEFI specification. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Deployed%20Mode%20is%20the%20most,the%20PK%2C%20which%20is%20authenticated) It prevents malware or unauthorized software from making changes to Secure Boot. User Mode already provides protection against unsigned boot loaders, but allows for more flexibility and matches the behavior of previous UEFI implementations.

## Secure Boot in the context of Windows Autopilot and Lenovo ThinkPad

### Modern Deployment / Pre-Provisioning (White Glove)

With Windows Autopilot Pre-provisioning, devices are pre-configured for the end user. During this preparation phase, the devices go through several steps:

1.	**Hardware initialization and BIOS configuration**: On current ThinkPad models, Secure Boot is already enabled and is in Deployed Mode by default.
2.	**Pre-Provisioning (White Glove)**: An administrator or service provider sets up Windows, drivers, applications, and policies. Autopilot does not generate any changes to the UEFI Secure Boot mode during this time; the firmware variables (PK, KEK, db, dbx) remain unchanged.
3.	**User enrollment**: The end user signs in and the device is enrolled in Azure AD or another MDM solution. This step does not change the Secure Boot mode either.

### Why does Secure Boot Mode remain in Deployed Mode?

- **Design according to UEFI specification**: Switching from deployed mode to user mode is not automated. It requires the deletion of the Platform Key (so Setup Mode is active) or the selection of "Exit Deployed Mode" in the BIOS, which uefi.org requires physical interaction and, if necessary, BIOS password.
- **Vendor configuration**: Lenovo provisions devices from 2024 onwards in Deployed Mode by default to ensure that the secure boot configuration remains protected by the OEM. Devices from 2023 and older do not yet have this feature and are automatically operated in User Mode after installing the PK.
- **Autopilot behavior**: Autopilot does not write UEFI variables (PK/KEK/db/dbx); therefore, it does not change the mode. The expectation that Pro-Provisioning will change the mode from Deployed Mode to User Mode is therefore not fulfilled. This is in line with the UEFI standard; operation in Deployed Mode is intended for end users.

### Should the device be delivered to end users in Deployed Mode?

Yes. According to the UEFI standard and Lenovo recommendation, Deployed Mode is the intended operating mode for shipped devices, as it offers the highest level of security. The end user does not notice any difference in everyday life: the Windows boot process is identical, drivers are checked and unsigned software cannot manipulate the boot process. Only if you have to perform specific tasks, e.g. import your own Secure Boot keys or use firmware test signatures, is it recommended to switch to User Mode or Audit Mode.

#### Procedure for switching between modes on a Lenovo ThinkPad

1.	Accessing the BIOS/UEFI: Turn on the device and press F1 several times during boot to  enter the UEFI setup. A supervisor password may be required.
2.	Open the "Security → Secure Boot" menu. Here you can see the current Secure Boot status (enabled) and the Platform Mode or System Mode.
3.	Go to Key Management: Select Key Management. In this menu, Lenovo offers the option "Exit Deployed Mode".
4.	Exit Deployed Mode: Selecting this option resets the DeployedMode flag and associated variables. The system switches to user mode (PK remains installed). After saving the changes and restarting, the device is available in User Mode.

!!!warning "Important Note"
    Deleting the PK via "Reset Platform Key" puts the firmware into Setup Mode. This disables Secure Boot and allows the device to run unsigned bootloaders. This option should only be used in test environments or when setting up your own keys.

## Effects for different generations (2023 and prior vs. 2024 and later)

- **2023 and older ThinkPads**: UEFI implementations only support Setup Mode and User Mode. After setting the Platform Key, the devices are permanently in User Mode. Changes to the db/dbx/KEK are possible via signed updates; a "Deployed Mode" does not exist.
- **2024 and newer ThinkPads**: The firmware implements the additional UEFI variables **AuditMode** and **DeployedMode**. The PK is set by Lenovo in the factory, so the device starts in Deployed Mode. This mode increases security by blocking programmatic mode transitions and strictly checking updates to the secure boot databases. The differences between the generations lead to different display strings in the BIOS; this is **not a bug**, but an evolution of the UEFI specification.

## Conclusion and recommendations

- **No automatic return to User Mode**: Neither Windows Autopilot nor a BIOS update cause a device to leave Deployed Mode. According to the UEFI specification, this is intended. [(source)](https://uefi.org/specs/UEFI/2.9_A/32_Secure_Boot_and_Driver_Signing.html#:~:text=Deployed%20Mode%20is%20the%20most,the%20PK%2C%20which%20is%20authenticated)
- **Maintain Deployed Mode**: For production devices, Lenovo and the UEFI standard recommend leaving Deployed Mode enabled. This ensures that Secure Boot Policy objects and mode transitions can only be modified according to authorized procedures.
- **Switch only when necessary**: If you want to install your own keys (e.g. for Linux distributions) or test them in Audit Mode, you can switch to User Mode via Key Management → Exit Deployed Mode and then go to Setup Mode via "Reset Platform Key" if necessary. Make sure to reset the keys correctly afterwards.

## Transition to MS 2023 Secure Boot certificates

Microsoft is introducing new signing certificates for Secure Boot, known as the "Windows UEFI CA 2023". This transition is necessary for two main reasons:

- **Certificate Expiration**: The previous certificates (e.g., "Microsoft Windows Production PCA 2011") will expire in 2026. Devices that do not have the new certificate in their firmware database (DB) by then will no longer be able to receive future Windows updates signed with the new certificate.
- **Security Hardening**: The transition is part of the mitigation efforts against the security vulnerability **CVE-2023-24932**, associated with the "Black Lotus" bootkit. The goal is to revoke vulnerable bootloaders and strengthen system integrity.

For enterprise environments, a controlled approach is crucial, as the updates are not fully automatic and can cause issues if handled improperly.

- **No Automatic Activation**: While the protections are delivered via Windows Updates, they are not enabled by default. Administrators must initiate the changes manually and in phases.
- **Importance of Testing**: Microsoft strongly recommends carefully validating the updates in a representative test environment before a company-wide rollout to avoid firmware compatibility issues.
- **Updating Boot Media**: All bootable media, such as ISO files, USB drives, PXE images, and Windows Recovery Environments, must be updated. Otherwise, these media may fail to boot on systems where the old certificates have been revoked.

### Phases of Deployment and Mitigation

Microsoft outlines a multi-stage process for implementing the new certificates and revoking the old ones. These steps should be performed in the specified order.

1.	**Install the updated certificate definitions to the DB.** This step will add the “Windows UEFI CA 2023” certificate to the UEFI “Secure Boot Signature Database” (DB). By adding this certificate to the DB, the device firmware will trust boot applications signed by this certificate.

    1. Set the regkey to perform the update to DB. To do this, open a Command Prompt window as an Administrator, type each of the following commands separately, and then press Enter:

        ```PowerShell
        reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Secureboot /v AvailableUpdates /t REG_DWORD /d 0x40 /f
        Start-ScheduledTask -TaskName "\Microsoft\Windows\PI\Secure-Boot-Update"
        ```

    1. Run the following PowerShell command as an Administrator and verify that the DB has been successfully updated. This command should return True.

        ```PowerShell
        [System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI db).bytes) -match 'Windows UEFI CA 2023'
        ```

        !!!note
            A restart might be required if the Virtual Secure Mode feature is enabled on the device. This includes features such as Credential Guard, Device Guard, and Windows Hello.

1. **Update the Windows Boot Manager.** This step will install a boot manager application on your device which is signed with the “'Windows UEFI CA 2023” certificate.

    1. Set the regkey to install the “'Windows UEFI CA 2023” signed boot manager. To do this, open a Command Prompt window as an Administrator, type each of the following commands separately, and then press Enter:

        ```PowerShell
        reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Secureboot /v AvailableUpdates /t REG_DWORD /d 0x100 /f
        Start-ScheduledTask -TaskName "\Microsoft\Windows\PI\Secure-Boot-Update"
        ```

    1. As Administrator, mount the EFI partition to get it ready for inspection:

        ```mountvol s: /s```

    1. Validate that "s:\efi\microsoft\boot\bootmgfw.efi" file is signed by the “Windows UEFI CA 2023” certificate. To do this, follow these steps:

        1. Click Start, type command prompt in the Search box, and then click Command Prompt.
        1. In the Command Prompt window, type the following command and then press Enter:<br>
         ```copy S:\EFI\Microsoft\Boot\bootmgfw.efi c:\bootmgfw_2023.efi```
        1. In File Manager, right-click the file C:\bootmgfw_2023.efi, click Properties, and then select the Digital Signatures tab.
        1. In the Signature list, confirm that the certificate chain includes Windows UEFI CA 2023. The certificate chain should match the following screenshot:

        ![Certificates](https://cdrt.github.io/mk_docs/img/reference/bios/certificates.png){ .centered-image width="400" }

1. **Apply Revocation Lists (DBX Update).** After ensuring the system boots with the new boot manager and all boot media has been updated, the vulnerable bootloaders can be revoked. This is done by updating the Forbidden Signature Database (DBX).
    1. Add the “Windows Production PCA 2011” certificate to the Secure Boot UEFI Forbidden List (DBX). To do this, open a Command Prompt window as an Administrator, type each of the following commands separately, and then press Enter:

        ```PowerShell
        reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Secureboot /v AvailableUpdates /t REG_DWORD /d 0x80 /f
        Start-ScheduledTask -TaskName "\Microsoft\Windows\PI\Secure-Boot-Update"
        ```

    1. Verify installation and revocation list was successfully applied by looking for event 1037 in the event log.

        For information about Event 1037, see [KB5016061: Secure Boot DB and DBX variable update events](https://support.microsoft.com/help/5016061). Or, run the following PowerShell command as Administrator and make sure it returns True: <br>
        ```[System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI dbx).bytes) -match 'Microsoft Windows Production PCA 2011'```

---

## Official Microsoft Sources

The following documents are the primary official sources and guides from Microsoft on this topic:

**KB5025885 - Central Guidance**: This is the main article that describes the entire process, phases, and manual steps for mitigating CVE-2023-24932.
[KB5025885: How to manage the Windows Boot Manager revocations for Secure Boot changes associated with CVE-2023-24932](https://support.microsoft.com/topic/kb5025885-how-to-manage-the-windows-boot-manager-revocations-for-secure-boot-changes-associated-with-cve-2023-24932-41a975df-beb2-40c1-99a3-b3ff139f832d)

**Enterprise Deployment Guidance**: This document provides detailed guidance specifically for enterprise environments, including descriptions of the new certificates and verification steps.
[Enterprise Deployment Guidance for CVE-2023-24932](https://support.microsoft.com/topic/enterprise-deployment-guidance-for-cve-2023-24932-88b8f034-20b7-4a45-80cb-c6049b0f9967)

**KB5036210 - DB Deployment Guidance**: This article focuses specifically on the first step, deploying the "Windows UEFI CA 2023" certificate to the DB.
[KB5036210: Deploying Windows UEFI CA 2023 certificate to Secure Boot Allowed Signature Database (DB)](https://support.microsoft.com/topic/kb5036210-deploying-windows-uefi-ca-2023-certificate-to-secure-boot-allowed-signature-database-db-a68a3eae-292b-4224-9490-299e303b450b)

**Key Management Guidance**: Provides more in-depth technical details about the certificates and requirements for OEMs.
[Windows Secure Boot Key Creation and Management Guidance](https://learn.microsoft.com/windows-hardware/manufacture/desktop/windows-secure-boot-key-creation-and-management-guidance)
