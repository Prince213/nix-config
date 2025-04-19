{
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  boot.loader.systemd-boot.enable = true;

  imports = [
    ./disk.nix
  ];
}
