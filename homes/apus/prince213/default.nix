{
  home.stateVersion = "25.05";

  imports = [
    ./neovim.nix
    ./nix.nix
    ./packages.nix
    ./vscode.nix
  ];
}
