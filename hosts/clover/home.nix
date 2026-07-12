{ config, pkgs, ... }:
{
  imports = [ ../../modules/home-manager ]; # Import des modules de configuration Home-Manager

  # Ne pas toucher
  home.stateVersion = "25.11";
}