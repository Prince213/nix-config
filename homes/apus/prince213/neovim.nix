{ neovim-nightly, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    withPython3 = false;
    withRuby = false;
    colorschemes.catppuccin.enable = true;
  };
}
