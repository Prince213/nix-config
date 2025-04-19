{
  nixpkgs.hostPlatform = "x86_64-linux";

  boot.loader.systemd-boot.enable = true;

  imports = [
    ./disk.nix
  ];
}
