{ pkgs, ... }:
{
  imports = [ ./firefox-settings.nix ];
  programs.firefox = {
    enable = true;
    profiles.default = {
      id        = 0;
      isDefault = true;
      name      = "default";
    };
  };
}