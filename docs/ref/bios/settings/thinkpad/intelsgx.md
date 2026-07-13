# Intel® SGX Settings

Intel® Software Guard Extensions (SGX) is a set of instructions that increases the security of application code and data, letting developers protect sensitive data from disclosure or modification by isolating it in a hardware-protected enclave.

Change Owner EPOCH
:  Change the SGX Owner EPOCH value, which is used as part of the key derivation for sealed enclave data. Changing this value invalidates any data previously sealed by enclaves on this system.

    !!! note ""
        This option requires additional confirmation.
