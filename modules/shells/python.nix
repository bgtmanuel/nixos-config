{ pkgs }:
pkgs.mkShell {

  name = "Environnement Python avec uv, ruff et ty";

  packages = with pkgs; [
    python314
    uv
    ruff
    ty
  ];

  env = {
    UV_PYTHON_DOWNLOADS = "never";
    UV_PYTHON = "${pkgs.python314}/bin/python3";
    LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
      pkgs.stdenv.cc.cc.lib
      pkgs.zlib
    ];
  };

}