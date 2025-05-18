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
    panels = [
      {
        floating = true;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
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
