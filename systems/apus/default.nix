{
  system.stateVersion = "25.05";
  networking.hostName = "apus";
  nixpkgs.hostPlatform = "x86_64-linux";
  time.timeZone = "Asia/Shanghai";

  i18n.supportedLocales = [
    "C.UTF-8/UTF-8"
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
  ];

  imports = [
    ./boot.nix
    ./desktop.nix
    ./disk.nix
    ./keyd.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./printing.nix
    ./users.nix
  ];
}
