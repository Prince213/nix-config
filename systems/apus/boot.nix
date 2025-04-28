{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };
}
