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
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    opts = {
      number = true;
    };

    globals = {
      mapleader = ",";
    };

    keymaps = [
      {
        mode = "n";
        key = "<Leader>e";
        action = "<Cmd>Neotree toggle<CR>";
      }
    ];

    plugins = {
      blink-cmp.enable = true;

      leap.enable = true;

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          gopls.enable = true;
        };
      };

      lualine.enable = true;

      neo-tree.enable = true;

      noice.enable = true;

      telescope = {
        enable = true;
        keymaps = {
          "<Leader>ff" = "find_files";
        };
      };

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

      trouble = {
        enable = true;
      };

      web-devicons.enable = true;
    };
  };
}
