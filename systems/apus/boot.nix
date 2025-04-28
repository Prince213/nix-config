{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader = {
    systemd-boot = {
      editor = false;
    };
  };
}
