{ pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.manuel.shell = pkgs.fish;
}