{ config, pkgs, ... }:
{
  home.username = "manuel";
  home.homeDirectory = "/home/manuel";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
  
  imports = [
    ./apps/vscode/vscode.nix
    ./apps/librewolf.nix
    ./apps/nix-helper.nix
    ./apps/git.nix
  ];

  home.packages = with pkgs; [
    deezer-desktop
  ];

}
