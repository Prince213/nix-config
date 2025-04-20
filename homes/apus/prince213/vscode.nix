{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.open-vsx; [
        github.github-vscode-theme
        jnoortheen.nix-ide
        pkief.material-icon-theme
      ];
      userSettings = {
        "editor.fontFamily" = "Iosevka SS07";
        "workbench.colorTheme" = "GitHub Dark Default";
        "workbench.iconTheme" = "material-icon-theme";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings".nixd =
          let
            self = "(builtins.getFlake \"${toString ../../..}\")";
            system = "${self}.nixosConfigurations.apus";
            home = "${system}.options.home-manager.users.type";
          in
          {
            nixpkgs.expr = "${system}._module.args.pkgs";
            options = {
              nixos.expr = "${system}.options";
              home-manager.expr = "${home}.getSubOptions []";
            };
          };
      };
    };
  };
}
