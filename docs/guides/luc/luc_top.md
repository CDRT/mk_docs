# Lenovo Updates Catalog

## **What is the Lenovo Updates Catalog Agent?**

### Purpose
Provide general information regarding the functionality, versions, location in the catalog, and installation of the Lenovo Updates Catalog Agent.
### Functionality
**Why is the Lenovo Updates Catalog Agent Needed?**

When installing driver updates, it is imperative to determine if the update is applicable to a managed endpoint.  The data required to determine applicability is located in many places, including but not limited to WMI, the file system, and the registry.  The Lenovo Updates Catalog Agent creates a centralized location in WMI for all driver data to be queried when determining update applicability.

**What Does the Lenovo Updates Catalog Agent Do?**

The Lenovo Updates Catalog Agent is a light weight service installed to each Lenovo ThinkCentre, ThinkPad, or ThinkStation managed endpoint.  When executed, the service creates the Root\Lenovo\drivers WMI namespace and creates the Win32_PNPSignedDriverEx WMI class under the Root\Lenovo\drivers namespace.  The WMI class gets populated with driver data pulled from different sources on the endpoint. The data in the WMI class is used during the scanning and evaluation of Lenovo updates from the WSUS server.

**How Do the Updates Use the WMI Information?**

All updates contain IsInstalled and IsInstallable rules to evaluate applicability.  The Lenovo Updates Catalog contains all the metadata in the form of queries to determine the applicability of the Driver and Software Utility updates.  The data aggregated by the Lenovo Updates Catalog Agent and placed into the WMI class is leveraged by the IsInstalled and IsInstallable applicability rules from the catalog.  All Lenovo Updates perform a check against the Manufacturer and BIOS versions to target the correct model.  For more specific targeting, Lenovo Updates can also leverage checks against PNPID/HardwareID information, driver versions, or driver dates, specific BIOS Versions, OS Versions, OS Build, and OS Architecture.  The checks against the PNPID/HardwareID information, driver versions, or driver dates use the data from the Win32_PNPSignedDriverEx class during evaluation.

**What Initiates the Lenovo Updates Catalog Agent to Run?**

The 2 triggers that cause the Lenovo Updates Catalog Agent to run are the Software Updates Scan Cycle or Software Updates Deployment Evaluation Cycle.  These cycles can be initiated in multiple ways: by the Configuration Manager Client Settings schedule, manually starting from a device or collection from  within the Configuration Manager console, or manually running them from the Configuration Manager Client Actions on the local device.  These cycles ultimately cause the Windows Update Agent to start, which then causes the Lenovo Updates Catalog Agent to populate the WMI Class.

**Where to Find the Lenovo Updates Catalog Agent?**

After subscribing and synchronizing the Lenovo Updates Catalog in Configuration Manager, in the console, navigate to Administration > Overview > Site Configuration > Sites. Click on the Site Server and, in the ribbon bar, click the Configure Site Components button and select Software Update Point. In the Software Update Point Component Properties dialog, click the Products tab. In the Products tree, check the box beside Lenovo, Lenovo Updates, and LUCAgent. Click OK.

![img](https://cdrt.github.io/mk_docs/guides/luc/luc_luca_01.png)

Navigate back to the Software Library > Overview > Software Updates > All Software Updates workspace. Click the Synchronize Software Updates button in the ribbon bar. When the synchronization is complete, the Lenovo Updates Catalog Agent 1007 will display in the All Software Updates workspace as metadata only, as indicated by the blue arrow in the icon column.

![img](https://cdrt.github.io/mk_docs/guides/luc/luc_luca_02.png)

**How to Target the Lenovo Updates Catalog Agent to the Estate**

The Lenovo Updates Catalog Agent installs silently to devices and is deployed just like any other software update. Since the agent is a prerequisite to deploying Lenovo Update Catalog updates, it should only be installed on Lenovo ThinkCentre, ThinkPad, or ThinkStation devices.

**How Does the Lenovo Updates Catalog Agent Impact Compliance in the Estate?**

To report on compliance information for Lenovo Updates in Configuration Manager, the Lenovo Updates Catalog Agent must be installed on the managed endpoints and the updates of interest must be published to WSUS and synchronized to Configuration Manager.  Prior to the evaluation of Lenovo Updates, the 'Unknown' column (you may have to show this column) in the console under the All Software Updates node, will display a fairly high count of endpoints. After the updates are scanned or the updates are deployed, the results are fed back to the console and will show in other columns; 'Required', 'Installed', or 'Not Required' (you may have to show these columns).  These results can be slow to populate due to the frequency of Summarization in Configuration Manager.

**Versions**

- LUCAgent1007 - Lenovo Updates Catalog Agent 1007 (Current)
	- (Fix) Resolve potential WMI errors found in the event viewer.
	- (Fix) Remove WMI Class when agent is uninstalled.
	- (Fix) Resolve install error when MOFComp is not found.
- LUCAgent1006 - Lenovo Updates Catalog Agent 1006
	- (Fix) Improved resilience and functionality during upgrade scenarios.
- LUCAgent1005 - Lenovo Updates Catalog Agent 1005
	- (Fix) Resolves high CPU utilization during the Software Updates Scan Cycle or Software Updates Deployment Evaluation Cycle.
- LUCAgent1003 - Lenovo Updates Catalog Agent 1003.1
	- (New) Initial release.


## **Lenovo Updates Catalog Sync Status of Trust Failed**
### Purpose
To address results in the Third-Party Software Update Catalogs node where the Last Sync Status for the Lenovo Updates entry is Trust Failed.
### Symptom
In the Software Library > Overview > Software Updates > Third-Party Software Update Catalogs, the Lenovo Updates catalog entry has a Last Sync Status of Trust Failed.
### Cause
Upon the initial synchronization of the Lenovo Updates Third-Party Software Updates Catalog, a request is made to approve or allow the certificates associated with the catalog.  In subsequent catalogs, new certificates may be provided to sign content.  These certificates are not automatically approved or allowed by Configuration Manager.  The error message in the log file is indicating that a new signing certificate is available for one or more updates and is blocked in the Configuration Manager console.
### Resolution
In the log file, there is an entry stating "SyncUpdateCatalog: Certificate 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' is not yet approved, try again after approval."  The 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' is the Certificate GUID.  To find and unblock the certificate, perform the following steps.
![img](https://cdrt.github.io/mk_docs/guides/luc/luc_cat_trust_failed_01.png)

1. In the Configuration Manager console, navigate to Administration > Overview > Security > Certificates
2. ![img](https://cdrt.github.io/mk_docs/guides/luc/luc_cat_trust_failed_02.png)
	Copy the Certificate GUID from the log file and paste it into the search bar of the Certificates node.
3. Right click on the certificate item returned in the Certificates node and click Unblock from the context menu.
4. Repeat for any other blocked certificates.
5. Once all unapproved certificates referenced in the SMS_ISVUPDATES_SYNCAGENT.log file have been unblocked, manually synchronize the catalog and verify it completed correctly.

## **Logs: Updates Failed to Publish When Synchronizing Metadata Only**
### Purpose
To address the results in the SMS_ISVUPDATES_SYNCAGENT.log when the Lenovo Updates third party catalog synchronizes with a message of "X number of updates were synchronized to WSUS successfully, and Y failed to publish" and using the "Do not stage content, synchronize for scanning automatically (recommended)" selection on the Stage Content tab.
### Symptom
![img](https://cdrt.github.io/mk_docs/guides/luc/luc_su_mdo_01.png)
### Cause
The failed to publish portion of the message is not actually a failure.  The message shows the number of updates where the metadata is already published.

## **The Number of Lenovo Updates in All Software Updates Does Not Match the Number in the Logs**

### Purpose
To address the results in the SMS_ISVUPDATES_SYNCAGENT.log when the Lenovo Updates third party catalog synchronizes with a message of "X number of updates were synchronized to WSUS successfully, and Y failed to publish" where the total number of updates (X+Y) listed is far greater than the number of Lenovo Updates displayed in the All Software Updates node.

### Symptom
Example: The message in the log file at the end of the synchronization could show 167 updates were synchronized to WSUS successfully, and 0 failed to publish.  When reviewing the All Software Updates node, only 49 may be displayed.

![img](https://cdrt.github.io/mk_docs/guides/luc/luc_su_asu_01.png)

![img](https://cdrt.github.io/mk_docs/guides/luc/luc_su_asu_02.png)
### Cause
All update metadata matching the category selections will be published to WSUS to establish the total list of updates available.  Once Configuration Manager performs its initial synchronization with WSUS, only non-superseded updates will be displayed.  In subsequent synchronizations and depending on the Supersedence Rules defined in the Site Software Update Point Components properties, some superseded or expired updates may show until the threshold defined has been met.

## **Lenovo Updates Not Reporting Scan Data**
### Purpose
To address the situation where Lenovo Updates in the All Software updates view do not contain status data in the Required, Not Required, and Installed columns.
### Symptom
![img](https://cdrt.github.io/mk_docs/guides/luc/luc_asu_scandata_01.png)
### Cause
The Lenovo Update Catalog Agent is not installed on endpoints to facilitate scanning for installation or applicability data.
### Resolution
Publish and deploy the latest Lenovo Update Catalog Agent.  See more information in the [Lenovo Update Catalog Agent - Functionality section](#functionality).

## **Recurring Installation with Error Code: 0x87D00324**
### Purpose
To address the 0x87D00324 error being displayed in Software Center or from the deployment status on the errors tab.
### Symptom
Software Center or the deployment error status has an error code: 0x87D00324
Error message: The application was not detected after installation completed.
### Cause
The installation metadata does not contain all logic to detect installation.
### Resolution
The first step to resolution is to verify the endpoint has been restarted.  If that has taken place and the error persists, follow the steps in the Action section below. Lenovo will have to review and evaluate the Installation metadata.  Lenovo will publish an updated catalog containing the updated metadata for the customer to consume.
### Action
To report an issue as described above contact our support team via the forum and provide the following information.

- Update Title: <Title\>
- Update ID: <Update ID\>
- Model Name: <Model\>
- Machine Type: <Machine Type\>

Example:

- Update Title: Lenovo Power Management Driver - 10 (1607 or Later)/11 (21H2 or Later) - 1.68.37.0
- Update ID: f25d7941-c4f9-4441-bff8-921be20993a2
- Model Name: ThinkPad P1 Gen 5
- Machine Type: 21DD