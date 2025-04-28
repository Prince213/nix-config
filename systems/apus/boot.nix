{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
    };
  };
}
