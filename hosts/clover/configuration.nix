{ config, pkgs, username, ... }:
{
  imports = [
    ./hardware-configuration.nix # Configuration générée automatiquement en fonction de l'hardware de l'host
    ../../modules/options.nix    # Liste des options custom disponibles
    ../../modules/system         # Import des modules de configuration système
  ];

  # Hostname
  networking.hostName = "nixos-clover";

  # Path du fichier de configuration Home-Manager
  home-manager.users.${username} = ./home.nix;

  # Options custom
  customOptions.system = {
    bootloader = {
      resolution = "1920x1200";
      dualboot.enable = true;
    };

    ia = {
      enable = true;
      backend = "cpu";
      threads = 8;
    };
  };

  # Ne pas toucher.
  system.stateVersion = "25.11";
}