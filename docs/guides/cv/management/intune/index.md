# Overview

This section will present the policies found in the Commercial Vantage ADMX template, along with the OMA-URIs which can be used to configure the application on Intune managed clients.

For steps on how to create and deploy Commercial Vantage as a Win32 app, reference this [page](https://blog.lenovocdrt.com/deploying-commercial-vantage-with-intune).

!!! note ""
    If new policies have been introduced, you will need to ingest the updated ADMX file contained in the Commercial Vantage zip.

!!! note ""
    Introduced in the [2208](https://learn.microsoft.com/mem/intune/fundamentals/whats-new-archive#import-create-and-manage-custom-admx-and-adml-administrative-templates) Intune Service release, you can import, create, and manage custom ADMX and ADML administrative templates.

!!! warning "ADMX Upload Error"
    If you receive the below error when uploading the ADMX, you will need to upload the [Windows.admx](https://www.microsoft.com/download/details.aspx?id=106254) first, then retry uploading the Commercial Vantage ADMX.

![img](https://cdrt.github.io/mk_docs/img/cv/admx_upload_error.jpg)
