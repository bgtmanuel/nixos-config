{ config, lib, ... }:
{
  # Créer les options custom à utiliser si la configuration doit changer entre plusieurs hosts
  options.customOptions.system = {
    bootloader = {
      branding = lib.mkOption {
        type = lib.types.str;
        default = "Limine Bootloader";
        description = "Texte affiché dans le menu de boot Limine";
      };

      resolution = lib.mkOption {
        type = lib.types.strMatching "[0-9]+x[0-9]+";
        default = "1920x1080";
        description = "Résolution du framebuffer, format LARGEURxHAUTEUR";
      };

      dualboot = {
        enable = lib.mkEnableOption "Windows dualboot with Limine";
        path = lib.mkOption {
          type = lib.types.str;
          default = "boot()";
          description = "Référence de partition Limine vers l'ESP Windows";
        };
      };

      secureboot = {
        enable = lib.mkEnableOption "Limine secure boot";
      };
    };

    ia = {
      enable = lib.mkEnableOption "Local AI stack";
      backend = lib.mkOption {
        type = lib.types.enum [ "cpu" "vulkan" "rocm" ];
        default = "cpu";
      };
      threads = lib.mkOption {
        type = lib.types.int;
        default = 8;
      };
    };
  };
}