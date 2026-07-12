{ config, pkgs, ... }:
{ 
  # Installe GNOME
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}