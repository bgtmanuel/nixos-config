{ ... }:
{
  imports = [
    # Hardware related
    ./hardware/gpu.nix

    # System related
    ./system/boot.nix
    ./system/core.nix
    ./system/de.nix
    ./system/services.nix
    ./system/shell.nix
  ];
}