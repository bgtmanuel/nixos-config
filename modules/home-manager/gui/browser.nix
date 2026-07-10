{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.home-manager.gui.browser;
in
{
  options.customOpts.home-manager.gui.browser = {
    firefox = {
      enable = lib.mkEnableOption "Firefox browser";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.firefox.enable {
      programs.firefox.enable = true;
    })
  ];
}