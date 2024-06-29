# SU Helper Reference

## Overview

The SUHelper.exe utility is a companion to Lenovo Commercial Vantage that provides command-line control over the System Update process. This reference guide will document the command line parameters and usage of this utility.

## Installation

SUHelper is provided by its own installer and is not included directly with Lenovo Commercial Vantage. Therefore, only customers that choose to deploy SUHelper to their devices will have it. The installer can be found in the [Lenovo Commercial Vanatage Application and Deployment Guide for Large Enterprise](https://support.lenovo.com/us/en/solutions/hf003321)

The utility can be installed on devices silently using the following command:

```[installer filename] /VERYSILENT```

The utility is designed to be installed in a fixed, secure location under Program Files so that it cannot be altered without Administrator privileges.

## Intended Usage Scenarios

SUHelper is designed to support a few scenarios to provide IT administrators more control over the updating of their devices.

Trigger Auto Update
:  In this scenario, there may be cases where an admin wants to trigger an Auto Update session without waiting for the normal schedule to be triggered.

Trigger Auto Update for filtered updates
:  In this scenario, the admin may want to trigger an update session that only installs certain package types or even specific updates specified by their package IDs.

Exclude an update from being installed
:  In some cases, a customer may find that a particular update has a compatibility issue with their environment when they apply the update to a set of test devices. To prevent that update from being applied to all production devices, SUHelper can be used to add the specific package ID(s) to an "exclude" list on the production devices. This will cause the specified update to be ignored when an Auto Update or a Manual Update is executed.