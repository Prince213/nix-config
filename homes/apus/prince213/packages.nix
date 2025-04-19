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

  programs.jujutsu.enable = true;

  programs.starship.enable = true;
}
