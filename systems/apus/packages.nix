{ pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  hardware.bluetooth.enable = true;

  programs.clash-verge.enable = true;

  programs.fish.enable = true;

  networking.networkmanager.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
  ];
}
