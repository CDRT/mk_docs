# Commercial Vantage

**Commercial Vantage** provides a user interface for changing hardware settings, checking for Lenovo software and driver updates, and more. **Commercial Vantage** is a slimmed-down and customizable version of Lenovo Vantage which has been available in the Microsoft Store since December 2017. To use **Commercial Vantage**, you must first uninstall any existing version of Lenovo Vantage, Lenovo Companion, or Lenovo Settings that may already exist on your PC.

The following software components are required to take full advantage of the Commercial Vantage features:

- **The Application: Commercial Vantage**

This Windows 10 store application provides the user interface. You can install the application from the Microsoft Store, or you can side-load it using the MSIXBUNDLE files that we provide. Note that any previous version of Lenovo Vantage, Lenovo Companion, or Lenovo Settings must be uninstalled before installing Commercial Vantage.

- **Lenovo System Interface Foundation**

This driver is required to allow the **Commercial Vantage** to provide control of system features. The driver is installed to **Device Manager -> System Devices** as **System Interface Foundation V2 Device**. The driver also installs the **System Interface Foundation Service**. The service uses a plugin framework which provides the individual features of **Commercial Vantage**. The System Interface Foundation Service and these plugins are automatically updated by Lenovo to fix bugs and provide new features.

- **Lenovo Vantage Service**

This package installs the Lenovo System Interface Foundation plugins that are required for **Commercial Vantage**

The latest version can always be found at [https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise](https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise) 
