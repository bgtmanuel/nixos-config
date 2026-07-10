{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.nixos.hardware.gpu;
in
{
  options.customOpts.nixos.hardware.gpu = {
    hardwareAccelerationSupport = lib.mkEnableOption "GPU hardware acceleration support";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.hardwareAccelerationSupport {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    })
  ];
}