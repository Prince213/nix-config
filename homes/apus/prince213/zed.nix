{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    userSettings = {
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
        };
      };
    };
  };
}
