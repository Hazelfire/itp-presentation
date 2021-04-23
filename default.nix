{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "presentation";
  src = ./.;
  buildPhase = ''
    pandoc -t revealjs -s -o index.html presentation.md -V revealjs-url=https://unpkg.com/reveal.js@3.9.2/
    '';
  buildInputs = with pkgs; [ pandoc ];
  installPhase = ''
    mkdir -p $out/share/html
    cp index.html $out/share/html/index.html
  '';
}
