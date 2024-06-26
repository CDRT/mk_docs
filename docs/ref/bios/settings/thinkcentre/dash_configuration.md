# DASH Configuration

![DASH Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_dash_config.PNG)

DASH Support
:  
    Options:

    1. **Disabled** - Default.
    2. Enabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | DASHSupport | Disabled, Enabled | yes |

Console Redirection Terminal Type
:  
    !!! note ""
    The following emulation types are available.
    ANSI: Extended ASCII char set.
    VT100: ASCII char set.
    VT100+: Extends VT100 to support color, function keys, etc.
    VT-UTF8: Uses UTF8 encoding to map Unicode chars onto 1 or more bytes.

    Options:

    1. VT100.
    1. **VT100+** - Default.
    1. VT-UTF8.
    1. PC-ANSI.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | ConsoleRedirectionTerminalType | VT100, VT100+, VT-UTF8, PC-ANSI | yes |
