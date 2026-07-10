{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.nixos.system.shell;
in
{
  options.customOpts.nixos.system.shell = {
    fish = {
      enable = lib.mkEnableOption "Fish shell";
      userToIntegrate = lib.mkOption {
        type = lib.types.str;
        default = "manuel";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.fish.enable {
      programs.fish.enable = true;
      users.users.${cfg.fish.userToIntegrate}.shell = pkgs.fish;
    })
  ];
}