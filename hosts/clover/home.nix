{ config, pkgs, user, hostname, ... }:
{
  imports = [ ../../modules/home-manager/options.nix ];

  home.stateVersion = "25.11";

  customOpts.home-manager = {

    core = {
      user = user;
    };

    cli = {
      shell = {
        fish = {
          enable = true;
          starship = {
            enable = true;
          };
        };
      };

      git.enable = true;
    };

    gui = {
      browser = {
        firefox.enable = true;
      };

      editor = {
        vscodium.enable = true;
      };
    };
  };
}