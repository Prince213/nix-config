{
  boot.loader = {
    limine.enable = true;
    systemd-boot.enable = false;
  };

  hardware.cpu.intel.updateMicrocode = true;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
