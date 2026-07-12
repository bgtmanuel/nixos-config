{ config, pkgs, ... }:
{
  # Installe et configure Git
  programs.git = {
    enable = true;
    settings.user = {
      name = "manuel";
      email = "manuel.bagot@protonmail.com";
    };
  };
}