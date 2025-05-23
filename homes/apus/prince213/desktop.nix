let
  google-chrome = "com.google.Chrome.desktop";
in
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
          {
            kickoff = {
              icon = "nix-snowflake";
            };
          }
          "org.kde.plasma.pager"
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:kitty.desktop"
                "applications:dev.zed.Zed.desktop"
                "applications:${google-chrome}"
              ];
            };
          }
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
        "x-scheme-handler/http" = [ google-chrome ];
        "x-scheme-handler/https" = [ google-chrome ];
      };
    };
    defaultApplications = {
      "x-scheme-handler/http" = [ google-chrome ];
      "x-scheme-handler/https" = [ google-chrome ];
    };
  };
}
