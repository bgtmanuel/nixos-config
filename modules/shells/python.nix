{ pkgs }:
pkgs.mkShell {

  name = "Environnement Python avec uv";

  packages = with pkgs; [
    python314
    uv
  ];

  env = {
    UV_PYTHON_DOWNLOADS = "never";
    UV_PYTHON = "${pkgs.python314}/bin/python3";
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];
  };

  shellHook = ''
    start-jupyter-server() {
      printf "\e[1mDémarrage du serveur Jupyter... (Ctrl+C pour arrêter)\e[0m\n"
      uv run --with jupyter jupyter server
    }
    clear
    printf "\e[1;32mEnvironnement Python chargé\e[0m\n"
    printf "\e[1;31mInstaller l'extension VSCode ty !\e[0m\n"
    echo ""
    printf "\e[4mCommandes utiles :\e[0m\n"
    echo "uv init"
    echo "uv sync"
    echo "uv add numpy pandas ..."
    echo "uv run main.py"
    echo ""
    printf "\e[4mLancer un serveur Jupyter :\e[0m\n"
    echo "uv run --with jupyter jupyter server"
    echo "start-jupyter-server"
  '';
}