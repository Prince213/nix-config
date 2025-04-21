{
  programs.plasma = {
    enable = true;
    configFile = {
      kdeglobals = {
        General = {
          TerminalApplication = "kitty";
          TerminalService = "kitty.desktop";
        };
      };
      kwinrc = {
        Wayland = {
          InputMethod = {
            value = "fcitx5-wayland-launcher.desktop";
            shellExpand = true;
          };
        };
      };
    };
  };
}
