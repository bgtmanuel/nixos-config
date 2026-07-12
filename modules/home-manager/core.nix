{ config, pkgs, username, ... }:
{
  # Configure l'utilisateur pour Home-Manager
  home.username = username;
  home.homeDirectory = "/home/${username}";
  programs.home-manager.enable = false;
}