{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans CJK SC" ];
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [ pkgs.fcitx5-rime ];
      settings = {
        globalOptions = {
          "Hotkey/TriggerKeys" = {
            "0" = "Control+Shift+Shift_L";
          };
        };
      };
    };
  };
}
