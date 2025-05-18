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

  xdg.mimeApps = {
    enable = true;
    associations = {
      added = {
        "x-scheme-handler/http" = [ "com.google.Chrome.desktop" ];
        "x-scheme-handler/https" = [ "com.google.Chrome.desktop" ];
      };
    };
    defaultApplications = {
      "x-scheme-handler/http" = [ "com.google.Chrome.desktop;" ];
      "x-scheme-handler/https" = [ "com.google.Chrome.desktop;" ];
    };
  };
}
