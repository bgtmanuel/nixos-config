{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.home-manager.core;
in
{
  options.customOpts.home-manager.core = {
    user = lib.mkOption {
      type = lib.types.str;
      default = "manuel";
    };
  };

  config = lib.mkMerge [
    {
      home.username = cfg.user;
      home.homeDirectory = "/home/${cfg.user}";
      programs.home-manager.enable = true;
    }
  ];
}