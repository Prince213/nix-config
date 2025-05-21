{
  hardware.cpu.intel.updateMicrocode = true;

  boot.loader = {
    grub.enable = false;
    limine = {
      enable = true;
    };
    systemd-boot.enable = false;
  };

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
