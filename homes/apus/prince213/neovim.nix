{
  config,
  neovim-nightly,
  pkgs,
  ...
}:
{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly.packages.${pkgs.system}.default;
    defaultEditor = true;

    withPython3 = false;
    withRuby = false;
    colorschemes.tokyonight.enable = true;

    plugins = {
      blink-cmp.enable = true;

      leap.enable = true;

      lsp = {
        enable = true;
        servers.nixd.enable = true;
      };

      lualine.enable = true;

      treesitter = {
        enable = true;
        grammarPackages =
          let
            cfg = config.programs.nixvim.plugins.treesitter;
          in
          with cfg.package.builtGrammars;
          [
            c
            lua
            markdown
            markdown_inline
            nix
            query
            vim
            vimdoc
          ];
      };
    };
  };
}
