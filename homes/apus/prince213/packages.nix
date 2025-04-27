{ nix-packages, pkgs, ... }:
{
  programs.btop.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

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
    settings = {
      symbol_map = "U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono";
    };
  };

  programs.nh.enable = true;

  programs.nix-index-database.comma.enable = true;

  programs.ripgrep.enable = true;

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;

  programs.starship.enable = true;

  programs.tmux.enable = true;

  programs.zoxide.enable = true;

  nixpkgs.overlays = [
    nix-packages.overlays.wubi98-fonts
  ];

  home.packages = with pkgs; [
    (iosevka-bin.override { variant = "SS07"; })
    nixd
    scrcpy
    telegram-desktop
    wl-clipboard
    wubi98-fonts
  ];
}
