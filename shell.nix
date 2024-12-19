{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs;[
    gradle 
    openjdk21 
  ];

  JAVA_HOME = "${pkgs.openjdk21}/lib/openjdk";

  shellHook = ''
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
  '';
}

