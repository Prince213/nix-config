{
  system.stateVersion = "25.05";
  networking.hostName = "draco";
  nixpkgs.hostPlatform = "x86_64-linux";
  time.timeZone = "Asia/Shanghai";

  imports = [
    ./boot.nix
    ./disk.nix
  ];
}
