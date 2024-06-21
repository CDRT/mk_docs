# Lenovo View Configuration Guide

## Overview

Lenovo View is a hardware support app for the Lenovo View device driver that enhances camera quality and provides collaboration features for some mainstream video call apps.

## Deploying Lenovo View

As an HSA, the Lenovo View app is available in the HSA pack for models that support it. The Lenovo View device driver, which is included in the SCCM driver packs and available on Lenovo Support site, must be deployed to the device in order for the Lenovo View app to work. For systems which have access to the Microsoft Store, simply deploy the device driver to the device and the OS will automatically install the Lenovo View app. Otherwise, refer to this article for detail on how to 'sideload' the app from the HSA pack: [Hardware Support Apps Without Microsoft Store](https://blog.lenovocdrt.com/#/2020/hsa-1)

## Access Lenovo View

Type Lenovo View in the Windows search box and then press Enter.

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

!!! info ""
   The available features vary depending on the computer model.

!!! info ""
    The Lenovo View app periodically updates features to improve your camera and video call experience. The feature description might be different from that on your actual user interface.

## Managing Configuration with Group Policy

The Lenovo View app supports group policy controls of the configuration settings listed below. To define a policy for you devices running Lenovo View, download the ADMX template and use the standard procedure to implement your desired settings through Active Directory.  You may also import the ADMX template for Lenovo View into Intune to manage the policies.

More about Intune here: [Import custom and third party partner ADMX templates in Microsoft Intune | Microsoft Learn](https://learn.microsoft.com/en-us/mem/intune/configuration/administrative-templates-import-custom)

If testing on a local machine, copy the contents of the zip file below to C:\Windows\PolicyDefinitions, then open Group Policy Editor. The Lenovo View items will be available under Administrative Templates.
![Lenovo View policies](https://cdrt.github.io/mk_docs/img/guides/view/gpedit.png)

Download:  [LenovoViewADMX.zip](https://download.lenovo.com/cdrt/tools/LenovoViewADMX.zip)

---

!!! info ""
    All of the below items can be configured as Enabled or Disabled.  If the policy is not configured, then the default behavior is enabled.

`Auto Framing`
:  Auto Framing keeps the user in the center of the video by changing the region of interest. The camera follows the person, and video conference participant should see the user always in the center of the frame.

`Background Concealment`
:  Background Concealment separates the user from his/her background and blurs it.

`Eye Wellness`
:  Eye Wellness tracks the user's display time and reminds him/her to look at something different after 20 minutes to protect the user's eyes. The effect shows a banner across the display that reminds the user when it is time for a break.

`Light Enhancement`
:  Light Enhancement improves the overall image brightness, contrast, and saturation. On certain products, this feature can perform temporal noise reduction and high dynamic range (HDR) to increase contrast and colors in bright light conditions.

`Posture Warning`
:  Posture Warning observes the user and notifies him/her when the user's posture is unhealthy and slouching. The effect shows a banner across the display that warns the user of an incorrect posture.

`Privacy Alert`
:  Privacy Alert notifies a laptop user if onlookers have been detected (a second or third person who tries to look at the content on the display). The notification appears as a floating image on the screen.

`Privacy Guard`
:  Privacy Guard protects the display by blurring the screen if onlookers have been detected.

`Virtual Presenter`
:  Virtual Presenter shows the user in a floating decal-like window overlay on the screen.
