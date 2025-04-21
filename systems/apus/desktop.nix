{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [ pkgs.fcitx5-rime ];
    };
  };
}
