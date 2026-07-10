{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.nixos.system.boot;
in
{
  options.customOpts.nixos.system.boot = {
    limine = {
      enable = lib.mkEnableOption "Limine bootloader";
      resolution = lib.mkOption {
        type = lib.types.str;
        default = "1920x1080";
      };
      branding = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = "LIMINE BOOTLOADER";
      };

      dualBoot = {
        enable = lib.mkEnableOption "Windows dualboot with Limine";
        path = lib.mkOption {
          type = lib.types.str;
          default = "boot()";
        };
      };

      secureBoot.enable = lib.mkEnableOption "Secure Boot with Limine";
    };
    # grub = {...};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.limine.enable {
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.limine = {
        enable = true;
        extraConfig = "timeout: no";
        maxGenerations = 5;
        style = {
          wallpapers = [ ];
          backdrop = "000000";
          interface = {
            branding = cfg.limine.branding;
            resolution = cfg.limine.resolution;
          };
        };
      };
    })

    (lib.mkIf cfg.limine.dualBoot.enable {
      boot.loader.limine.extraEntries = ''
        /Windows
          comment: Windows Boot Entry
          protocol: efi
          path: ${cfg.limine.dualBoot.path}:/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    })

    (lib.mkIf cfg.limine.secureBoot.enable {
      boot.loader.limine.secureBoot = {
        enable = true;
        autoGenerateKeys = true;
        autoEnrollKeys.enable = true;
      };
      environment.systemPackages = [ pkgs.sbctl ];
    })

    {
      assertions = [
        {
          assertion = cfg.limine.dualBoot.enable -> cfg.limine.enable;
          message = "limine.dualboot requires limine.enable = true;";
        }
        {
          assertion = cfg.limine.secureBoot.enable -> cfg.limine.enable;
          message = "limine.secureboot requires limine.enable = true;";
        }
        {
          assertion = cfg.limine.dualBoot.path != "";
          message = "dualboot.path can't be an empty string";
        }
      ];
    }
  ];
}