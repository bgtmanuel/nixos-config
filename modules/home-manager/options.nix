{ ... }:
{
  imports = [
    # Core
    ./core.nix

    # CLI related
    ./cli/git.nix
    ./cli/shell.nix

    # GUI related
    ./gui/browser.nix
    ./gui/editor.nix
  ];
}