{ config, lib, pkgs, ... }:
let
  cfg = config.customOptions.system.ia;
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      environment.systemPackages = with pkgs; [
        process-compose
        python314
        uv
        llama-swap
      ];

      environment.sessionVariables = { # Nécéssite un reboot
        UV_PYTHON_DOWNLOADS = "never";
        UV_PYTHON_PREFERENCE = "only-system";
        UV_PYTHON = "${pkgs.python314}/bin/python3";

        JERRIX_THREADS = cfg.threads;
      };
    })

    (lib.mkIf (cfg.backend == "cpu") {
      environment.systemPackages = [ pkgs.llama-cpp ];
    })

    (lib.mkIf (cfg.backend == "vulkan") {
      environment.systemPackages = [ pkgs.llama-cpp-vulkan ];
    })

    (lib.mkIf (cfg.backend == "rocm") {
      environment.systemPackages = [ pkgs.llama-cpp-rocm ];
    })
  ];
}