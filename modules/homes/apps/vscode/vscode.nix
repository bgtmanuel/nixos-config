{ pkgs, ... }:
{
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
      ];
      userSettings = builtins.fromJSON (builtins.readFile ./vscode-settings.json);
    };
  };
}
