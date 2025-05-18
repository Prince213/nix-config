{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.google-chrome;
    # https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#Chromium_.2F_Electron
    # chrome://flags/#wayland-text-input-v3
    # commandLineArgs = [
    #   "--wayland-text-input-version=1"
    # ];
  };
}
