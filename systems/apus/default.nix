{
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  networking.hostName = "apus";

  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
  ];

  time.timeZone = "Asia/Shanghai";

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  imports = [
    ./boot.nix
    ./desktop.nix
    ./disk.nix
    ./keyd.nix
    ./nix.nix
    ./packages.nix
    ./users.nix
  ];
}
