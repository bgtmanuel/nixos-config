{ config, pkgs, user, hostname, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/options.nix
  ];

  system.stateVersion = "25.11";

  # Config générale
  customOpts.nixos = {

    system = {

      core = {
        user = user;
        hostname = hostname;
        homeFile = ./home.nix;
        optimise = true;
        nh = {
          enable = true;
          optimise = true;
        };
      };

      boot = {
        limine = {
          enable = true;
          dualBoot = {
            enable = true;
          };
        };
      };

      de = {
        gnome = {
          enable = true;
        };
      };

      shell = {
        fish = {
          enable = true;
          userToIntegrate = user;
        };
      };
    };
  };
}