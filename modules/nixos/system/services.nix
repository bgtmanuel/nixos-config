{ config, lib, pkgs, ... }:
let 
  cfg = config.customOpts.nixos.system.services;
in
{
  options.customOpts.nixos.system.services = {
    printing.enable = lib.mkEnableOption "printing service";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.printing.enable {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };

      services.printing = {
        enable = true;
        drivers = with pkgs; [ # Voir les drivers CUPS
          cups-filters
          cups-browsed
          brlaser
        ];
      };
    })
  ];
}