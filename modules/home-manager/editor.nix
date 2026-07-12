{ config, pkgs, ... }:
{
  # Installe et configure VSCodium
  programs.vscodium = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      extensions = with pkgs.vscode-extensions; [
        aaron-bond.better-comments
        enkia.tokyo-night
        jnoortheen.nix-ide
        miguelsolorio.fluent-icons
        pkief.material-icon-theme
        christian-kohler.path-intellisense
      ];
      userSettings = builtins.fromJSON (builtins.readFile ./vscode-settings.json);
    };
  };
}