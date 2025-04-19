{ pkgs, ... }:
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

  programs.starship.enable = true;

  home.packages = with pkgs; [
    (iosevka-bin.override { variant = "SS07"; })
  ];
}
