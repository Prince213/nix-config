{ lib, ... }:
{
  boot.initrd.systemd.enable = true;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = lib.mkDefault true;
      editor = false;
    };
  };
}
