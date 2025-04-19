{ vscode-extensions, pkgs, ... }:
{
  programs.fastfetch.enable = true;

  programs.firefox.enable = true;

  programs.fish.enable = true;

  programs.git.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      ui = {
        show-cryptographic-signatures = true;
      };
      signing = {
        behavior = "own";
        backend = "gpg";
      };
    };
  };

  programs.kitty = {
    enable = true;
    font.name = "Iosevka Term SS07";
  };

  programs.nh.enable = true;

  programs.starship.enable = true;

  nixpkgs.overlays = [
    vscode-extensions.overlays.default
  ];

  home.packages = with pkgs; [
    (iosevka-bin.override { variant = "SS07"; })
  ];
}
