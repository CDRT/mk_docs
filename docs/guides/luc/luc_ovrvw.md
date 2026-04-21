---
title: Lenovo Updates Catalog
description: Overview of the Lenovo Updates Catalog, supported models, content, and integration with Configuration Manager.
---

# Lenovo Updates Catalog

## Overview

The Lenovo Updates Catalog is a Lenovo curated catalog of update information available for subscription and synchronization found in the Software Library > Overview > Software Updates > Third-Party Software Update Catalogs node in Configuration Manager.  The catalog contains update information categorized by model in the V3 format.  The V3 catalog format provides granular control of the update metadata and content made available to endpoints in an environment.

## Supported Models

The Lenovo Updates Catalog provides update metadata and content for the following devices:

| | Models |
|---|--------|
| **Supported** | ThinkPad, ThinkStation, ThinkCentre |
| **Not Supported** | IdeaPad, IdeaCentre, Legion, Lenovo, ThinkBook, ThinkCentre Neo, ThinkEdge, ThinkServer, ThinkSmart |

## Catalog Agent

To ensure Lenovo Updates are correctly detected as either applicable, installed, or not needed, the Lenovo Updates Catalog Agent is a required software update. Deploy this update to all Lenovo ThinkPad, ThinkStation, or ThinkCentre devices under management by Configuration Manager. For more information, see the [Lenovo Updates Catalog Agent](../luc/luc_agnt.md) guide.

## Content Availability

In the Lenovo Updates Catalog, we attempt to provide as many drivers, BIOS, and applications as possible.  Due to certain content restrictions and limitations from WSUS, we cannot provide firmware (including Docking Stations) and some drivers due to vendor limitations.
