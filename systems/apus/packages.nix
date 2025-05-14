{ lib, pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  programs.appimage = {
    enable = true;
  };

  hardware.bluetooth.enable = true;

  programs.clash-verge.enable = true;

  programs.fish.enable = true;

  programs.localsend.enable = true;

  programs.nix-ld = {
    enable = true;
  };

  programs.steam.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  systemd.services.ensure-printers = {
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
  };

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  environment.plasma6.excludePackages = [
    pkgs.kdePackages.kate
  ];

  nixpkgs.config = {
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "steam"
        "steam-unwrapped"
      ];
    permittedInsecurePackages = [
      "clash-verge-rev-2.2.3"
      "clash-verge-rev-service-2.2.3"
      "clash-verge-rev-unwrapped-2.2.3"
      "clash-verge-rev-webui-2.2.3"
    ];
  };
}
