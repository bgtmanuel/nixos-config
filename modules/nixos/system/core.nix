{ config, lib, pkgs, ... }:
let
  cfg = config.customOpts.nixos.system.core;
in
{
  options.customOpts.nixos.system.core = {
    optimise = lib.mkEnableOption "NixOS store optimisation";
    nh = {
      enable = lib.mkEnableOption "Nix Helper";
      optimise = lib.mkEnableOption "Nix Helper optimisation";
    };
    user = lib.mkOption {
      type = lib.types.str;
      default = "manuel";
    };
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
    };
    homeFile = lib.mkOption {
      type = lib.types.path;
    };
  };

  config = lib.mkMerge [

    {
      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.networkmanager.enable = true;

      nix.settings.experimental-features = [ "nix-command" "flakes" ];

      time.timeZone = "Europe/Paris";
      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
      };

      console.keyMap = "fr";

      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      nixpkgs.config.allowUnfree = true;

      users.users.${cfg.user} = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${cfg.user} = import cfg.homeFile;
      };

      networking.hostName = cfg.hostname;
    }

    (lib.mkIf cfg.optimise {
      nix.optimise = {
        automatic = true;
        dates = [ "daily" ];
      };
      nix.settings.auto-optimise-store = true;
    })

    (lib.mkIf cfg.nh.enable {
      programs.nh.enable = true;
    })


    (lib.mkIf cfg.nh.optimise {
      programs.nh.clean = {
        enable = true;
        extraArgs = "--keep 5";
        dates = "weekly";
      };
    })

    (lib.mkIf (cfg.optimise && !cfg.nh.optimise) {
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    })

    {
      assertions = [
        {
          assertion = cfg.nh.optimise -> cfg.nh.enable;
          message = "nh.optimise requires nh.enable = true;";
        }
      ];
    }
  ];
}