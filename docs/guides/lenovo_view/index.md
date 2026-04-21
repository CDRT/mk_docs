---
title: Lenovo View
description: Hardware support app for the Lenovo View camera driver providing enhanced collaboration features.
icon: material/alert
status: deprecated
---

# Lenovo View Configuration Guide

!!! warning "Lenovo View is being withdrawn"
    Beginning in January 2026, Lenovo View will begin to be withdrawn. There may be an additional update released to assist in the automatic removal of this solution. For more details, see the [End of Support statement.](https://support.lenovo.com/us/en/solutions/HT518161)

## Overview

Lenovo View is a hardware support app for the Lenovo View device driver that enhances camera quality and provides collaboration features for some mainstream video call apps.

## Deploying Lenovo View

!!! warning
    The Lenovo View device driver must be deployed to the device before deploying the app. Deploying only the app without the driver will result in non-functional features. The device driver is included in the SCCM driver packs and available on the Lenovo Support site.

As an HSA, the Lenovo View app is available in the HSA pack for models that support it. For systems which have access to the Microsoft Store, the OS will automatically install the Lenovo View app after the device driver is deployed. Otherwise, refer to [Hardware Support Apps Without Microsoft Store](https://blog.lenovocdrt.com/hardware-support-apps-without-microsoft-store) for details on how to sideload the app from the HSA pack.

### Explore key features

- **Video Enhancer:** Adjust relevant camera parameters (light, intensity, color) and reduce noise to improve your video call experience.

![Video Enhancer](https://cdrt.github.io/mk_docs/img/guides/view/Video_Enhancer.jpg)

- **Collaboration**
    - **Background Removal:** Conceal the background during a video call to keep the focus on you.

 ![Background Removal](https://cdrt.github.io/mk_docs/img/guides/view/Background_Removal.jpg)

- **Auto-framing:** Automatically keep your face centered in the video call when you move around.

 ![Auto-Framing](https://cdrt.github.io/mk_docs/img/guides/view/Auto-Framing.jpg)

- **Privacy**
    - **Privacy Alert:** An alert icon appears on your computer screen when a shoulder surfer appears behind you.

 ![Privacy Alert](https://cdrt.github.io/mk_docs/img/guides/view/Privacy_Alert_2023.jpg)

- **Privacy Guard:** Your screen becomes blurred when a shoulder surfer appears behind you. Press Alt + F2 to cancel the blur effect.

 ![Privacy Guard](https://cdrt.github.io/mk_docs/img/guides/view/Privacy_Guard.jpg)

- **Wellness**
    - **Posture Warning:** Remind you to adjust your posture when you hunch toward the screen.
    - **Eye Wellness:** Remind you to look away from the screen and relax your eyes for 20 seconds every 20 minutes.

 ![Wellness](https://cdrt.github.io/mk_docs/img/guides/view/a_temp_digital_wellness_2023.jpg)

!!! note
    The available features vary depending on the computer model. Additionally, the Lenovo View app periodically updates features to improve camera and video call experience, so feature descriptions may differ from what appears in your user interface.

## Managing Configuration with Group Policy

The Lenovo View app supports group policy controls of the configuration settings listed below. To define a policy for your devices running Lenovo View, download the ADMX template and use the standard procedure to implement your desired settings through Active Directory. You may also [import the ADMX template into Intune](https://learn.microsoft.com/en-us/mem/intune/configuration/administrative-templates-import-custom) to manage these policies.

If testing on a local machine, copy the contents of the zip file below to C:\Windows\PolicyDefinitions, then open Group Policy Editor. The Lenovo View items will be available under Administrative Templates.
![Lenovo View policies](https://cdrt.github.io/mk_docs/img/guides/view/gpedit.png)

Download:  [LenovoViewADMX.zip](https://download.lenovo.com/cdrt/tools/LenovoViewADMX.zip)

---

!!! note
    All policies below can be configured as Enabled or Disabled. If a policy is not configured, the default behavior is enabled.

## Policy Settings

| Policy | Description |
|--------|-------------|
| Auto Framing | Keeps the user centered in the video by changing the region of interest. The camera follows the person, and video conference participants see the user always centered in the frame. |
| Background Concealment | Separates the user from the background and blurs it. |
| Eye Wellness | Tracks display time and reminds the user to look at something different after 20 minutes to protect the eyes. A banner appears across the display to remind the user when it is time for a break. |
| Light Enhancement | Improves overall image brightness, contrast, and saturation. On certain products, performs temporal noise reduction and high dynamic range (HDR) to increase contrast and colors in bright light conditions. |
| Posture Warning | Observes the user and notifies them when their posture is unhealthy or slouching. A banner appears across the display to warn the user of incorrect posture. |
| Privacy Alert | Notifies the user if onlookers have been detected (a second or third person trying to view the display). The notification appears as a floating image on the screen. |
| Privacy Guard | Protects the display by blurring the screen if onlookers have been detected. |
| Virtual Presenter | Shows the user in a floating decal-like window overlay on the screen. |
