{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "presentation";
  src = ./.;
  buildPhase = ''
    pandoc --template ./revealjs.html -t revealjs -s -o index.html presentation.md -V revealjs-url=https://unpkg.com/reveal.js@4.1.0 --slide-level=2
    '';
  buildInputs = with pkgs; [ pandoc ];
  installPhase = ''
    mkdir -p $out/share/html
    cp index.html $out/share/html/index.html
    cp -r plugin $out/share/html/plugin
  '';
}
