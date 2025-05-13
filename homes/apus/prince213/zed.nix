{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "Ayu Mirage";
        light = "Ayu Light";
      };
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
