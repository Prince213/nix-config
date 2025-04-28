{ lib, pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = true;

  programs.clash-verge.enable = true;

  programs.fish.enable = true;

  programs.localsend.enable = true;

  networking.networkmanager.enable = true;

  programs.steam.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];
}
