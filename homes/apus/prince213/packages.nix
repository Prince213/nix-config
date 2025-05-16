{
  nix-packages,
  vscode-extensions,
  lib,
  pkgs,
  ...
}:
{
  programs.btop.enable = true;

  programs.fastfetch.enable = true;

  programs.fish.enable = true;

  programs.git.enable = true;

  programs.go.enable = true;

  programs.nix-index-database.comma.enable = true;

  programs.ripgrep.enable = true;

  programs.ssh.enable = true;
  services.ssh-agent.enable = true;

  programs.starship.enable = true;

  programs.tmux.enable = true;

  programs.zoxide.enable = true;

  nixpkgs.overlays = [
    nix-packages.overlays.default
    vscode-extensions.overlays.default
  ];

  home.packages = with pkgs; [
    cursor
    (iosevka-bin.override { variant = "SS07"; })
    nix-output-monitor
    nixd
    nixfmt-rfc-style
    python3
    scrcpy
    telegram-desktop
    wemeet
    wl-clipboard
    wubi98-fonts
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "cursor"

      "vscode"
      "vscode-extension-github-copilot"
      "vscode-extension-github-copilot-chat"
      "vscode-extension-ms-python-vscode-pylance"
      "vscode-extension-ms-vscode-cpptools"

      # wemeet
      "libwemeetwrap"
      "wemeet"
    ];
}
