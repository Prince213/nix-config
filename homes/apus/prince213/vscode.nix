{ vscode-extensions, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with vscode-extensions.extensions.${pkgs.system}.open-vsx; [
        github.github-vscode-theme
        golang.go
        jnoortheen.nix-ide
        lencerf.beancount
        mkhl.direnv
        myriad-dreamin.tinymist
        pkief.material-icon-theme
      ];
      userSettings = {
        "editor.fontFamily" = "Iosevka SS07";
        "workbench.colorTheme" = "GitHub Dark Default";
        "workbench.iconTheme" = "material-icon-theme";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}
