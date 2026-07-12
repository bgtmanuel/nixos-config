{ config, pkgs, username, ... }:
{
  # Active networkmanager
  networking.networkmanager.enable = true;

  # Active le DNS Cloudfare
  networking.networkmanager.insertNameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
  ];

  # Ajoute l'utilisateur dans le groupe networkmanager
  users.users.${username}.extraGroups = [ "networkmanager" ];

  # Active le daemon iwd pour la connection WiFi
  networking.wireless.iwd.enable = true;

  # Utilise iwd dans networkmanager
  networking.networkmanager.wifi.backend = "iwd";

  # Paramètrage de iwd
  networking.wireless.iwd.settings = {
    General.AddressRandomization = "network";
    Network = {
      EnableIPv6 = true;
      NameResolvingService = "none"; # Laisse networkmanager gérer le DNS
    };
    Settings.AutoConnect = true;
  };

  # Active le bluetooth (la gestion des connections se fait via GNOME)
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}