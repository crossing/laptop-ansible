{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
}:
pkgs.mkShell {
  name = "ansible";
  buildInputs = [
    pkgs.git
    pkgs.ansible
  ];
}
