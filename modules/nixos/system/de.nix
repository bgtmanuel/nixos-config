{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.nixos.system.de;
in
{
  options.customOpts.nixos.system.de = {
    gnome = {
      enable = lib.mkEnableOption "GNOME Desktop Environment";
      minimal = lib.mkEnableOption "GNOME without extra apps";
    };
    cosmic = {
      enable = lib.mkEnableOption "COSMIC Desktop Environment";
    };
    # plasma = {...};
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.gnome.enable {
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;
      services.xserver.xkb = {
        layout = "fr";
        variant = "azerty";
      };
    })

    (lib.mkIf cfg.gnome.minimal {
      services.gnome.core-apps.enable = false;
      services.gnome.core-developer-tools.enable = false;
      services.gnome.games.enable = false;
      environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
    })

    (lib.mkIf cfg.cosmic.enable {
      services.displayManager.cosmic-greeter.enable = true;
      services.desktopManager.cosmic.enable = true;
    })

    {
      assertions = [
        {
          assertion = cfg.gnome.minimal -> cfg.gnome.enable;
          message = "gnome.minimal requires gnome.enable = true;";
        }
        {
          assertion = !(cfg.gnome.enable && cfg.cosmic.enable);
          message = "can't have both gnome.enable and cosmic.enable";
        }
      ];
    }
  ];
}