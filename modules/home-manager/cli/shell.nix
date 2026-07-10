{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.home-manager.cli.shell;
in
{
  options.customOpts.home-manager.cli.shell = {
    fish = {
      enable = lib.mkEnableOption "Fish shell";
      starship = {
        enable = lib.mkEnableOption "Starship prompt";
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.fish.enable {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          set fish_greeting
        '';
        plugins = [
          { name = "done"; src = pkgs.fishPlugins.done.src; }
          { name = "pure"; src = pkgs.fishPlugins.pure.src; }
          { name = "pisces"; src = pkgs.fishPlugins.pisces.src; }
        ];
      };
    })

    (lib.mkIf cfg.fish.starship.enable {
      programs.starship = {
        enable = true;
        enableFishIntegration = true;
      };
    })

    {
      assertions = [
        {
          assertion = cfg.fish.starship.enable -> cfg.fish.enable;
          message = "fish.starship.enable requires fish.enable = true;";
        }
      ];
    }
  ];
}
