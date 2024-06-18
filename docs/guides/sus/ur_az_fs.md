# Hosting a Repository in an Azure File Share 
![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/azurefs.jpg)

*Author: Philip Jorgensen*

This option leverages the Lenovo cloud repository feature in Update Retriever.  By choosing this option, only the package XML's will be downloaded to the repository while the full content will be hosted by Lenovo. 

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image1.jpg) 

If you're moving your on-prem repository to the cloud, this option will most definitely cut down storage costs as these XML's are only a couple of Kilobytes in size.

A few things to note before exploring this route:

* System Update (version **5.07.0046** and later) is supported
* Commercial Vantage is supported
* Thin Installer is NOT supported

## Creating the Storage Account
You'll need to create a new [storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal#create-a-storage-account) first.  During the creation, make sure you set the account kind to **StorageV2** since we're going to be using this as an Azure file share. 

After creation, go to the new storage account and scroll down to the **File service** section and click **File shares**.  Click **+File share**, give it a name and click **Create**.

The URL of the share can be found in **Properties**

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image2.jpg)

You'll need to take note of one of the **Access keys** for the storage account, which will be used to later on.  These can be found under **Settings + networking**.

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image3.jpg)

If you need to lock down access to specific vNets and/or IP ranges, you can configure this under **Networking**.

## Populating the Update Retriever Repository
Install the latest version of [Update Retriever](https://support.lenovo.com/solutions/ht037099) on a technician system.  We're going to use [cmdkey](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cmdkey) to store the Azure storage account credentials.  Launch PowerShell and enter the following command (replacing the storage account name and access key):
```
Invoke-Expression -Command "cmdkey /add:<storageaccountname>.file.core.windows.net /user:Azure\<storageaccountname> /pass:<accesskey>"
```

You should see cmdkey return a Credential added successfully message.  You can verify by opening Credential Manager and looking under Windows Credentials.

Now, launch Update Retriever and select Lenovo Cloud repository.  Instead of entering the URL of the file share, enter it as a UNC path:

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image4.jpg)

Set any other options and click **Continue**.  You may see a spinning wheel for a bit but will eventually proceed to the **Get new updates** screen.  Here you can add your MTM's and check for updates.  You should see Update Retriever connect to your Azure file share and download content.

If you look in Event Viewer under **Applications and Services Logs > Lenovo > ThinkVantage > UpdateRetriever** and look through the **This is the operational log of ThinkVantage UpdateRetriever** log, you'll see Events like this:

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image5.jpg)

Back in the Azure portal, navigate to your file share and you should now see all of the package ID directories with corresponding .xml's, as well as the database.xml.

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image6.jpg) ![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image7.jpg)

## Client Side Configuration
We need to upload and deploy a PowerShell script to add the Azure storage account credentials on the client.  Unfortunately, SAS tokens aren't supported with SMB access so one option is to use a Storage Account Access Key.

Copy the same command that was used earlier into a **.ps1** file and add it to **Device Scripts** in the MEM admin center.

Set the Script settings to:

**Run this script using the logged on credentials - Yes**
**Run script in 64 bit PowerShell host - Yes**

Assign to a group.

Verify the System Update scheduled task has been configured.  Refer to the System Update Deployment [Guide]((su/su_dg.md)).

To confirm everything works, manually start the scheduled task and monitor the **tvsu_timestamp.log** which can be found under **%ProgramData%\Lenovo\SystemUpdate\logs**

I can see the client connects to the repository and finds the database.xml

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image8.jpg)

And further down the log, once the client parses through the database.xml for applicable updates, the packages are downloaded from Lenovo

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image10.jpg)

I've set my AdminCommandLine to list the updates so I can select which ones to install.

```
/CM -search A -action LIST -includerebootpackages 3,5 -noreboot -noicon -exporttowmi
```

And here's a screenshot of updates that are applicable to download and install

![](https://cdrt.github.io/mk_docs/img/guides/ur/az_fs/image11.jpg)

If you're using Commercial Vantage, ensure you've configured the Local Repository GPO to point to the UNC of your Azure file share.

?>Further reading: https://docs.microsoft.com/en-us/azure/storage/files/storage-files-faq#security-authentication-and-access-control