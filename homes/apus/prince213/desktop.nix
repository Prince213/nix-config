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
    };
  };
}
