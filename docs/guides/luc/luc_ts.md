# **Troubleshooting**
## **Lenovo Updates Catalog Sync Status of Trust Failed**
### Purpose
To address results in the Third-Party Software Update Catalogs node where the Last Sync Status for the Lenovo Updates entry is Trust Failed.
### Symptom
In the Software Library > Overview > Software Updates > Third-Party Software Update Catalogs, the Lenovo Updates catalog entry has a Last Sync Status of Trust Failed.
### Cause
Upon the initial synchronization of the Lenovo Updates Third-Party Software Updates Catalog, a request is made to approve or allow the certificates associated with the catalog.  In subsequent catalogs, new certificates may be provided to sign content.  These certificates are not automatically approved or allowed by Configuration Manager.  The error message in the log file is indicating that a new signing certificate is available for one or more updates and is blocked in the Configuration Manager console.
### Resolution
In the log file, there is an entry stating "SyncUpdateCatalog: Certificate 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' is not yet approved, try again after approval."  The 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' is the Certificate GUID.  To find and unblock the certificate, perform the following steps.
![](https://cdrt.github.io/mk_docs/img/guides/luc/luc_cat_trust_fail_01.png)

1. In the Configuration Manager console, navigate to Administration > Overview > Security > Certificates
2. ![](https://cdrt.github.io/mk_docs/img/guides/luc/luc_cat_trust_fail_02.png)
	Copy the Certificate GUID from the log file and paste it into the search bar of the Certificates node.
3. Right click on the certificate item returned in the Certificates node and click Unblock from the context menu.
4. Repeat for any other blocked certificates.
5. Once all unapproved certificates referenced in the SMS_ISVUPDATES_SYNCAGENT.log file have been unblocked, manually synchronize the catalog and verify it completed correctly.

## **Logs: Updates Failed to Publish When Synchronizing Metadata Only**
### Purpose
To address the results in the SMS_ISVUPDATES_SYNCAGENT.log when the Lenovo Updates third party catalog synchronizes with a message of "X number of updates were synchronized to WSUS successfully, and Y failed to publish" and using the "Do not stage content, synchronize for scanning automatically (recommended)" selection on the Stage Content tab.
### Symptom
![](https://cdrt.github.io/mk_docs/img/guides/luc/luc_su_mdo_01.png)
### Cause
The failed to publish portion of the message is not actually a failure.  The message shows the number of updates where the metadata is already published.

## **The Number of Lenovo Updates in All Software Updates Does Not Match the Number in the Logs**

### Purpose
To address the results in the SMS_ISVUPDATES_SYNCAGENT.log when the Lenovo Updates third party catalog synchronizes with a message of "X number of updates were synchronized to WSUS successfully, and Y failed to publish" where the total number of updates (X+Y) listed is far greater than the number of Lenovo Updates displayed in the All Software Updates node.

### Symptom
Example: The message in the log file at the end of the synchronization could show 167 updates were synchronized to WSUS successfully, and 0 failed to publish.  When reviewing the All Software Updates node, only 49 may be displayed.

![](https://cdrt.github.io/mk_docs/img/guides/luc/luc_su_asu_01.png)

![](https://cdrt.github.io/mk_docs/img/guides/luc/luc_su_asu_02.png)
### Cause
All update metadata matching the category selections will be published to WSUS to establish the total list of updates available.  Once Configuration Manager performs its initial synchronization with WSUS, only non-superseded updates will be displayed.  In subsequent synchronizations and depending on the Supersedence Rules defined in the Site Software Update Point Components properties, some superseded or expired updates may show until the threshold defined has been met.

## **Lenovo Updates Not Reporting Scan Data**
### Purpose
To address the situation where Lenovo Updates in the All Software updates view do not contain status data in the Required, Not Required, and Installed columns.
### Symptom
![](https://cdrt.github.io/mk_docs/img/guides/luc/luc_asu_scandata_01.png)
### Cause
The Lenovo Update Catalog Agent is not installed on endpoints to facilitate scanning for installation or applicability data.
### Resolution
Publish and deploy the latest Lenovo Update Catalog Agent.  See more information in the [Lenovo Update Catalog Agent - Functionality section](https://cdrt.github.io/mk_docs/docs/guides/luc/luc_agnt).

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