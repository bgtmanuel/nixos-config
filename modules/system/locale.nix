{ config, pkgs, ... }:
{
  # Règle la langue du système en Anglais (Américain)
  i18n.defaultLocale = "en_US.UTF-8";

  # Règle le format du reste en Français
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Règle le fuseau horaire sur Paris
  time.timeZone = "Europe/Paris";

  # Règle le layout du clavier en français
  console.keyMap = "fr";
}