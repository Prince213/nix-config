{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "beancount"
      "nix"
      "zig"
    ];
    userSettings = {
      theme = "Ayu Mirage";
      buffer_font_family = "Iosevka SS07";
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
