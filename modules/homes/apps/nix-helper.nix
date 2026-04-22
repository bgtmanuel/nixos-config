{ ... }:
{
  programs.nh = {
    enable = true;
    osFlake = "../../../flake.nix";
    clean = {
      enable = true;
      dates = "daily";
      extraArgs = "--keep 5 --keep-since 3d";
    };
  };
}