# Keyboard/Mouse Settings

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_keyboardmouse.png)

TrackPoint
:  Whether to enable built-in TrackPoint.

    Possible options:

    1. Off
    2. **On** - Default.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | TrackPoint | Enable, Disable (on AMD-based machine) <br> Disable, Automatic (on Intel-based machine)| No | Both |

Trackpad
:  Whether to enable built-in Trackpad

    Possible options:

    1. Off
    2. **On** - Default.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | TouchPad | Disable, Enable (on AMD-based machine <br> Disable, Automatic (on Intel-based machine)| No | Both |

Fn and Ctrl Key swap
:  Whether to swap behaviors of Fn key and Ctrl key.

    !!! note ""
        When switched `On`, Fn key works as Ctrl key. Ctrl key works as Fn key.

    !!! note ""
        Bottom-Left key will wake the system from sleep state.

    Possible options:

    1. **Off** - Default.
    2. On

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | FnCtrlKeySwap | Disable, Enable | No | Both |

Fn Sticky Key
:  Whether User can press Fn key to keep it in a pressed condition, then press the desired function key.

    !!! note ""
        Equivalent to pressing the required key and the Fn key simultaneously. When User presses the Fn key twice, the state is locked until User presses the Fn key again.

    Possible options:

    1. **Off** - Default.
    2. On

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | FnSticky | Disable, Enable | No | Both |

F1-F12 as Primary Function
:  Whether to disable the hotkey functionality of the function keys (F1, F2, and so on) in Windows 8.1/10, to avoid having to press Fn to use the function.

    !!! note ""
        When switched `Off`, the special hotkey functionality will be enabled.

    !!! note ""
        The methods differ by model. Examples: <br>  - ["How to use the function keys without pressing Fn in Windows 8.1/10" at Lenovo Support](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-l-series-laptops/thinkpad-l15-type-20u7-20u8/solutions/HT103044) <br> - ["Function keys are not working" at Lenovo Support](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-l-series-laptops/thinkpad-l15-type-20u7-20u8/solutions/ht510960) <br>

    Possible options:

    1. On -
    2. **Off** - Default.

    !!! note ""
        Alternatively, to switch to above two options, press Fn+Esc to use FnLk (Fn Lock). LED is on when FnLk is enabled.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | FnKeyAsPrimary | Disable, Enable | No | Both |

Keyboard Layout
:  Select keyboard layout in pre-OS environment.

    !!! note ""
        This configuration does not affect OS.

    Possible options:

    1. **US English** - Default
    2. Canadian French Multilingual
    3. Canadian French
    4. Spanish (Latin America)
    5. Portuguese (Brazil)
    6. Belgian
    7. Danish
    8. Spanish
    9. French
    10. German
    11. Hungarian
    12. Icelandic
    13. Italian
    14. Norwegian
    15. Portuguese
    16. Slovenian
    17. Swedish
    18. Swiss
    19. Turkish
    20. UK English
    21. Japanese
    22. Korean
    23. Traditional Chinese
    24. Turkish-F
    25. Estonian
    26. Finnish
    27. Czech

    !!! note ""
        On latest machines, BIOS added support for ASCII special characters and symbols such as `@`, `!` , `?`, etc. Those characters depend on keyboard layout and BIOS cannot know the attached keyboard, therefore users have to select keyboard layout if they replace keyboard.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | KeyboardLayout | English_US, CanadianFrenchMultilingual, CanadianFrench, <br>Spanish_LA, Portuguese_BR, Belgian, Danish, <br>Spanish, French, German, Hungarian, Icelandic, <br>Italian, Norwegian, Portuguese, Slovenian, <br>Swedish, Swiss, Turkish, English_UK, Japanese,<br>Korean, TraditionalChinese, Turkish-F, Estonian, Finnish, Czech | Yes | Both |
