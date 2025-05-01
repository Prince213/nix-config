{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  hardware.cpu.amd.updateMicrocode = true;

  boot.loader = {
    grub.enable = true;
    systemd-boot.enable = false;
  };
}
