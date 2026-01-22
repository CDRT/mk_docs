# WQL Queries for Lenovo Docks

This section contains example queries that can be used in your ConfigMgr hierarchy.  The results from these queries will return the **Device Name** connected to the dock, **IP Addresses**, and **Last Logged On User**.

[Thunderbolt 3 Workstation Gen 2](https://support.lenovo.com/solutions/PD500333)

[Thunderbolt 3 Gen 2](https://support.lenovo.com/solutions/pd500265)

```wql
SELECT DISTINCT sms_r_system.NAME,
                sms_r_system.ipaddresses,
                sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_2109&pid_8887%"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[Thunderbolt Essential](https://support.lenovo.com/solutions/PD500373)

```wql
SELECT DISTINCT sms_r_system.NAME,
                sms_r_system.ipaddresses,
                sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_308d%"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[USB-C Gen 2](https://support.lenovo.com/solutions/acc500106)

```wql
SELECT DISTINCT sms_r_system.NAME,
                sms_r_system.ipaddresses,
                sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_a38f%"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[Hybrid USB-C with USB-A](https://support.lenovo.com/solutions/pd500180)

```wql
SELECT DISTINCT sms_r_system.NAME,
                sms_r_system.ipaddresses,
                sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_a354%"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[Thunderbolt 3](https://support.lenovo.com/solutions/acc100356)

```wql
SELECT sms_r_system.NAME,
       sms_r_system.ipaddresses,
       sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_3069%"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[USB-C](https://support.lenovo.com/accessories/ACC100348)

```wql
SELECT DISTINCT sms_r_system.NAME,
                sms_r_system.ipaddresses,
                sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_3060%"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[OneLink+](https://support.lenovo.com/solutions/acc100252)

```wql
SELECT sms_r_system.NAME,
       sms_r_system.ipaddresses,
       sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
       INNER JOIN sms_g_system_system_enclosure
               ON sms_g_system_system_enclosure.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_1019%"
       AND sms_g_system_pnp_device_driver.NAME = "generic superspeed usb hub"
       AND sms_g_system_system_enclosure.chassistypes IN (
           "8", "9", "10", "11",
           "12", "14", "18", "21",
           "30", "31", "32" )
```

[Mechanical Pro ](https://support.lenovo.com/solutions/pd027981)

```wql
SELECT sms_r_system.NAME,
       sms_r_system.ipaddresses,
       sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_1012%"
       AND sms_g_system_pnp_device_driver.NAME = "generic superspeed usb hub" 
```

[Mechanical Ultra](https://support.lenovo.com/solutions/pd028010)

```wql
SELECT sms_r_system.NAME,
       sms_r_system.ipaddresses,
       sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_1010%"
       AND sms_g_system_pnp_device_driver.NAME = "generic superspeed usb hub"
```

[Mechanical Workstation](https://support.lenovo.com/solutions/acc100247)

```wql
SELECT sms_r_system.NAME,
       sms_r_system.ipaddresses,
       sms_r_system.lastlogonusername
FROM   sms_r_system
       INNER JOIN sms_g_system_pnp_device_driver
               ON sms_g_system_pnp_device_driver.resourceid =
                  sms_r_system.resourceid
WHERE  sms_g_system_pnp_device_driver.pnpdeviceid LIKE "usb\\vid_17ef&pid_305%"
       AND sms_g_system_pnp_device_driver.NAME = "generic superspeed usb hub" 
```