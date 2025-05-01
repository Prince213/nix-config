{
  hardware.cpu.amd.updateMicrocode = true;

  boot.loader = {
    grub.enable = true;
    systemd-boot.enable = false;
  };
}
