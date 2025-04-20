{
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  networking.hostName = "apus";

  time.timeZone = "Asia/Shanghai";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  imports = [
    ./desktop.nix
    ./disk.nix
    ./keyd.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
  ];
}
