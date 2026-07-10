{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.home-manager.gui.editor;
in
{
  options.customOpts.home-manager.gui.editor = {
    vscodium = {
      enable = lib.mkEnableOption "VSCodium";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.vscodium.enable {
      programs.vscodium = {
        enable = true;
        profiles.default = {
          enableExtensionUpdateCheck = true;
          enableUpdateCheck = true;
          extensions = with pkgs.vscode-extensions; [
            aaron-bond.better-comments
            enkia.tokyo-night
            ms-python.python
            ms-toolsai.jupyter
            vscode-icons-team.vscode-icons
            jnoortheen.nix-ide
            christian-kohler.path-intellisense
            miguelsolorio.fluent-icons
            charliermarsh.ruff
            # james-yu.latex-workshop
          ];
          userSettings = builtins.fromJSON (builtins.readFile ./vscode-settings.json);
        };
      };
    })
  ];
}