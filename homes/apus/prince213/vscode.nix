{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions =
        let
          inherit (pkgs.vscode-marketplace.github) copilot copilot-chat;
        in
        with pkgs.open-vsx;
        [
          copilot
          copilot-chat
          github.github-vscode-theme
          golang.go
          jnoortheen.nix-ide
          lencerf.beancount
          mkhl.direnv
          myriad-dreamin.tinymist
          pkief.material-icon-theme
        ];
      userSettings = {
        "telemetry.telemetryLevel" = "off";
        "editor.fontFamily" = "Iosevka SS07";
        "workbench.colorTheme" = "GitHub Dark Default";
        "workbench.iconTheme" = "material-icon-theme";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}
