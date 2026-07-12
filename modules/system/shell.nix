{ config, pkgs, username, ... }:
{
  # Installe le shell Fish
  programs.fish.enable = true;
  users.users.${username}.shell = pkgs.fish;
}