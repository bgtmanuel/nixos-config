{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.home-manager.cli.git;
in
{
  options.customOpts.home-manager.cli.git = {
    enable = lib.mkEnableOption "Git";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      programs.git = {
        enable = true;
        settings.user = {
          name = "manuel";
          email = "manuel.bagot@protonmail.com";
        };
      };
    })
  ];
}