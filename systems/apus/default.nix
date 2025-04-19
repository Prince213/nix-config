{
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "25.05";

  time.timeZone = "Asia/Shanghai";

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = true;

  networking.networkmanager.enable = true;

  nix.settings.substituters = [
    "https://mirror.sjtu.edu.cn/nix-channels/store"
  ];

  programs.fish.enable = true;

  imports = [
    ./desktop.nix
    ./disk.nix
    ./users.nix
  ];
}
