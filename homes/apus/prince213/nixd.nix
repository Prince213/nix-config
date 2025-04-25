let
  self = "(builtins.getFlake \"${toString ../../..}\")";
  system = "${self}.nixosConfigurations.apus";
  home = "${system}.options.home-manager.users.type";
  settings = {
    nixpkgs.expr = "${system}._module.args.pkgs";
    options = {
      nixos.expr = "${system}.options";
      home-manager.expr = "${home}.getSubOptions []";
    };
  };
in
{
  programs.nixvim = {
    plugins.lsp.servers.nixd = {
      inherit settings;
    };
  };

  programs.vscode = {
    profiles.default = {
      userSettings = {
        "nix.serverSettings" = {
          nixd = settings;
        };
      };
    };
  };
}
