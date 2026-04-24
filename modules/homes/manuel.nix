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
  ];

  programs.fastfetch.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      name = "manuel";
      email = "manuel.bagot@protonmail.com";
    };
  };
}
