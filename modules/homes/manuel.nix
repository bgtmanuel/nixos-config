{ config, pkgs, ... }:
{
  home.username = "manuel";
  home.homeDirectory = "/home/manuel";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: { inherit (tpkgs) scheme-full; };
  };
  
  imports = [
    ./apps/vscode/vscode.nix
    ./apps/librewolf.nix
    ./apps/nix-helper.nix
    ./apps/git.nix
    ./apps/fish.nix
  ];
}
