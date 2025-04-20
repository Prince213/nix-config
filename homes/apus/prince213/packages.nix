{ vscode-extensions, pkgs, ... }:
{
  programs.direnv.enable = true;

  programs.fastfetch.enable = true;

  programs.fish.enable = true;

  programs.git.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  programs.kitty = {
    enable = true;
    font.name = "Iosevka Term SS07";
  };

  programs.nh.enable = true;

  programs.ssh.enable = true;

  programs.starship.enable = true;

  programs.zoxide.enable = true;

  nixpkgs.overlays = [
    vscode-extensions.overlays.default
  ];

  home.packages = with pkgs; [
    (iosevka-bin.override { variant = "SS07"; })
  ];
}
