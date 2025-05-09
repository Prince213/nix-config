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
          inherit (pkgs.vscode-marketplace.ms-python) vscode-pylance;
          inherit (pkgs.vscode-marketplace.ms-vscode) cpptools;
          inherit (pkgs.vscode-marketplace.platformio) platformio-ide;
          inherit (pkgs.vscode-marketplace.seanwu) vscode-qt-for-python;
        in
        with pkgs.open-vsx;
        [
          charliermarsh.ruff
          copilot
          copilot-chat
          github.github-vscode-theme
          golang.go
          james-yu.latex-workshop
          jnoortheen.nix-ide
          lencerf.beancount
          llvm-vs-code-extensions.vscode-clangd
          mkhl.direnv
          ms-python.python
          cpptools
          myriad-dreamin.tinymist
          pkief.material-icon-theme
          platformio-ide
          vscode-pylance
          vscode-qt-for-python
        ];
      userSettings = {
        "telemetry.telemetryLevel" = "off";
        "editor.fontFamily" = "Iosevka SS07";
        "workbench.colorTheme" = "GitHub Dark Default";
        "workbench.iconTheme" = "material-icon-theme";

        "C_Cpp.intelliSenseEngine" = "disabled";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}
