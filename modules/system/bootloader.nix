{ config, lib, pkgs, ... }:
let
  cfg = config.customOptions.system.bootloader;
in
{
  config = lib.mkMerge [

    # Installe le bootloader Limine et active une configuration générique
    {
      boot.loader.limine = {
        enable = true;
        extraConfig = "timeout: no"; # Voir https://github.com/limine-bootloader/limine/blob/trunk/CONFIG.md
        maxGenerations = 5;
        style = {
          wallpapers = [ ];
          backdrop = "000000";
          interface = {
            branding = cfg.branding;
            resolution = cfg.resolution;
          };
        };
      };
    }

    # Configuration du dualboot
    (lib.mkIf cfg.dualboot.enable {
      boot.loader.limine.extraEntries = ''
        /Windows
          comment: Windows Boot Entry
          protocol: efi
          path: ${cfg.dualboot.path}:/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    })

    # Configuration du secureboot
    (lib.mkIf cfg.secureboot.enable {
      boot.loader.limine.secureBoot = {
        enable = true;
        autoGenerateKeys = true;
        autoEnrollKeys.enable = true;
      };
      environment.systemPackages = [ pkgs.sbctl ];
    })
  ];
}