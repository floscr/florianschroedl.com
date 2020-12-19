let
  pkgs = import <nixpkgs> {};
  nodejs = pkgs.nodejs-12_x;

in pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    (pkgs.yarn.override { inherit nodejs; })

    # Dependencies for mozjpeg
    autoreconfHook  # Inject nixpkgs for mozjpeg build
    automake autoconf libtool dpkg pkgconfig nasm libpng
  ];
}
