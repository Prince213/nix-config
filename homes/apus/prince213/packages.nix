{
  nix-packages,
  vscode-extensions,
  lib,
  pkgs,
  ...
}:
{
  programs.btop.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fastfetch.enable = true;

  programs.fish.enable = true;

  programs.git.enable = true;

  programs.go.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
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
    vscode-extensions.overlays.default
  ];

  home.packages = with pkgs; [
    (iosevka-bin.override { variant = "SS07"; })
    nixd
    nixfmt-rfc-style
    scrcpy
    telegram-desktop
    wl-clipboard
    wubi98-fonts
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "vscode-extension-github-copilot"
      "vscode-extension-github-copilot-chat"
    ];
}
