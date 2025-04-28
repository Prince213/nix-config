{
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  networking.hostName = "cetus";

  time.timeZone = "Asia/Shanghai";
}
