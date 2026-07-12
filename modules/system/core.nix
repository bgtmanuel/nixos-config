{ config, pkgs, ... }:
{
  # Utiliser le dernier kernel linux
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Activer le support des flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Autoriser l'installation de paquets venant de sources propriétaires
  nixpkgs.config.allowUnfree = true;

  # Installer nix-helper et activer l'optimisation automatique du store
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 5 --optimise";
    };
  };
}