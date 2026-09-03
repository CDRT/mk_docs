---
title: Commercial Vantage Policy Manager for Intune
description: PowerShell GUI tool for building and deploying Commercial Vantage Intune configuration profiles as a single Custom OMA-URI profile, without ADMX template ingestion.
---

# Commercial Vantage Policy Manager for Intune

The Commercial Vantage Policy Manager is a WPF-based PowerShell GUI that configures Lenovo Commercial Vantage group policies and deploys them to Microsoft Intune as a single Custom OMA-URI configuration profile through the Microsoft Graph API. It removes the need to import ADMX templates or hand-write OMA-URI policy strings.

## Why Use Policy Manager Instead of ADMX Templates?

Both approaches ultimately write the same policy CSPs to the device, but they differ operationally:

- **ADMX ingestion** - Requires importing the Commercial Vantage ADMX template into Intune, then configuring each policy individually through the generated Administrative Templates profile. Adding new policies as Lenovo releases them requires re-importing an updated ADMX file.
- **Custom OMA-URI** - Stores every configured policy as an explicit OMA-URI string in one profile. This makes the profile easy to review, export, and recreate in another tenant, but hand-authoring OMA-URI strings is tedious and error-prone.

Commercial Vantage Policy Manager automates the Custom OMA-URI approach, building the profile from a policy catalog so administrators never write an OMA-URI string by hand.

## Requirements

- PowerShell 5.1 or higher
- .NET Framework 4.7.2 or later
- `Microsoft.Graph.Authentication` PowerShell module
- Internet access, to retrieve the latest policy catalog from GitHub
- An Entra ID account with permission to create Intune device configuration profiles

## Installation and Launch

```powershell
Install-Module Microsoft.Graph.Authentication -Scope CurrentUser
Install-Script Invoke-LnvCVPolicyManager
```

Launch the GUI from a PowerShell session:

```powershell
.\Invoke-LnvCVPolicyManager.ps1
```

## Policy Catalog

Commercial Vantage Policy Manager does not hardcode its list of policies and OMA-URIs. On startup, it fetches the current catalog from `https://raw.githubusercontent.com/CDRT/api/main/cv-policies.json`, so newly added Commercial Vantage policies become available in the tool without a script update.

---

## Workflow

### Step 1: Sign In

Click **Sign In** in the header bar and choose an authentication flow:

- Interactive sign-in
- Certificate-based app registration
- Secret-based app registration

Commercial Vantage Policy Manager requests the `DeviceManagementConfiguration.ReadWrite.All` Microsoft Graph scope, which is required to create device configuration profiles.

### Step 2: Apply the Recommended Baseline (Optional)

The left navigation includes a **Baselines** section with a Recommended Baseline. Selecting it lists the policies it applies. Click **Apply Baseline** to enable all of them at once, then continue to add or adjust individual policies as needed.

**Recommended Baseline Policies:**

| Policy | Purpose |
| --- | --- |
| Accept EULA | Suppresses the initial EULA prompt |
| Write Warranty to WMI | Exposes warranty data to inventory tools |
| Write Battery to WMI | Exposes battery health data to WMI |
| Turn off Metrics Collection | Disables telemetry |
| Turn off Network | Disables the Network feature |
| Turn off Sustainability | Hides the Sustainability page |
| Turn off Give Feedback | Hides the feedback option |
| Turn off Run Once Task | Suppresses first-run popups |

### Step 3: Browse and Configure Policies

The **Policies** tree mirrors the categories in the policy catalog. Each policy card has three states:

- **Not Configured** - The policy is omitted from the profile entirely
- **Enabled** - The policy is enabled, with any associated data elements editable inline
- **Disabled** - The policy is explicitly disabled

Numeric inputs enforce their catalog-defined minimum and maximum values. A counter in the footer tracks how many policies are currently configured.

### Step 4: Create the Intune Profile

Once policies are configured, review or edit the profile name and click **Create Profile**. The default name follows this convention:

`Win - Custom - Lenovo Commercial Vantage - D - v1.0`

- **Win** - Target platform
- **Custom** - Profile type
- **Lenovo Commercial Vantage** - Application area
- **D** - Assignment scope (`D` for devices, `U` for users)
- **v1.0** - Version

Commercial Vantage Policy Manager POSTs a `windows10CustomConfiguration` object to the Graph API, with one OMA setting per configured policy.

!!! note "Profile is not auto-assigned"
    The profile is created under **Devices -> Configuration** in Intune, but Commercial Vantage Policy Manager does not assign it to a group. Assign the profile manually after creation.

---

## Logging

Session logs write to a date-stamped file at `%ProgramData%\Lenovo\CVPolicyManager\CVPolicyManager_YYYYMMDD.log`.

The same output streams to the GUI's **Log** panel, toggled from the header bar, using `INFO`, `WARN`, `ERROR`, and `SUCCESS` levels.

## Theming

Commercial Vantage Policy Manager detects the OS light/dark preference at launch by reading `HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize\AppsUseLightTheme`. A sun/moon button in the header overrides the detected theme manually.

---

## ADMX Ingestion

Commercial Vantage Policy Manager currently focuses on the Custom OMA-URI workflow above. Before any policy can be set on the device, the ADMX template will need to be deployed.

This can be accomplished in 2 ways. Manually, following the steps below:

1. Open the Microsoft Intune admin center.
2. Navigate to **Devices** > **Windows** > **Configuration Profiles**.
3. Select **New Policy** > **Windows 10 and later** platform.
4. Choose **Templates** > **Custom**.
5. Name the profile, for example `Lenovo Commercial Vantage ADMX`.
6. Add a configuration row with the OMA-URI:

    ```URL
    ./Device/Vendor/MSFT/Policy/ConfigOperations/ADMXInstall/CommercialVantage/Policy/CommercialVantage
    ```

7. Assign the profile to the target group.

-**Or**-

Clicking the **Create ADMX Profile** button in the Policy Manager GUI. This feature was added in version 1.2.0.

---

## See Also

- [Commercial Vantage Product Guide](../lcv/index.md)
- [Introducing Commercial Vantage Policy Manager for Intune](https://blog.lenovocdrt.com/introducing-commercial-vantage-policy-manager-for-intune/) - original announcement post

!!! question "Need Help?"
    Have questions? Visit the [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg).
