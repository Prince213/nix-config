{
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

  imports = [
    ./disk.nix
  ];
}
