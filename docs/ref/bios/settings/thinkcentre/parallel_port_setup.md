# Parallel Port Setup

![Parallel Port Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_parallel_port_setup.PNG)

Parallel Port Address
:  
    Options:

    1.  **378** - enables logical parallel port 378. Default.
    2.  278 - enables logical parallel port 278.
    3.  Disabled - disables the parallel port. The parallel port will not be seen by the OS.

Parallel Port Mode
:  The parallel port mode to use.

    1. **EPP** - Default.
    1. ECP+EPP.
    1. EPP.

EPP Version
:  Version of the EPP (Enhanced Parallel Port) standard used.

    Options:

    1.  **1.9** - enables version 1.9. Default.
    2.  1.7 - enables version 1.7.

    !!! note ""
        Version 1.7 is supported as an optional setting for backward compatibility with older devices. There are differences between versions 1.9 and 1.7 which may affect the operation of devices.

ECP Mode DMA Channel
:  DMA (Direct Memory Access), a technique for transferring data from main memory to the parallel port devices without passing it through the CPU. Computers that have DMA channels can transfer data to and from devices while the CPU works on other tasks. Select DMA3 or DMA1 channel.

    Options:

    1.  **DMA3** - Default.
    2.  DMA1.

Parallel Port IRQ
:Settings for the IRQ (Interrupt Request) line.

    Options:

    1.  **IRQ7** - enables interrupt line 7. Default.
    2.  IRQ 5 - enables interrupt line 5.
