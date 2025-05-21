{ lib, ... }:
{
  boot.initrd.systemd.enable = true;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      configurationLimit = 3;
    };
    limine = {
      maxGenerations = 3;
    };
    systemd-boot = {
      enable = lib.mkDefault true;
      editor = false;
      configurationLimit = 3;
    };
  };
}
