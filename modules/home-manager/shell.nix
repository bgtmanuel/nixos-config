{ config, pkgs, ... }:
{
  # Installe et configure le shell Fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
    ];
  };

  # Active l'intégration Fish
  home.shell.enableFishIntegration = true;
}