# Upgrading

Commercial Vantage is designed to leverage the Vantage Service running in System context to perform updates to itself and to keep each of the Add-ins current. This is often referred to as an "Over The Air" or OTA update. This allows Commercial Vantage to keep itself updated when deployed to systems used by limited users.

If there is any interruption in the self-updating, you may encounter a state where Commercial Vantage is no longer able to update itself or some of the Add-ins. In this case, it may be necessary to redeploy Commercial Vantage from the Enterprise Package.

Commercial Vantage is generally updated on a monthly cadence using OTA's.  The Enterprise Package is generally updated on a quarterly basis. Therefore, there may be cases where it is necessary to deploy a downlevel version of the application and allow it to update itself to the latest version. Going forward, if it is ever necessary to introduce a new group policy setting with an OTA, the Group Policy ADMX template files will be offered separate from the Enterprise Package.

!!! info ""
    Current ADMX Template package:  [v25.09](https://download.lenovo.com/cdrt/tools/lcv_admx_2509.zip)
