{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "pure"; src = pkgs.fishPlugins.pure.src; }
      { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
    ];
  };
}