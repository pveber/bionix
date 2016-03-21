{ nixpkgs ? import <nixpkgs> {} }:

let callPackage = nixpkgs.callPackage; in

{
  art = callPackage pkgs/art { };

  cisa = callPackage pkgs/cisa { };

  idba = callPackage pkgs/idba { };

  mummer = callPackage pkgs/mummer { };

  ncbi_blast = callPackage pkgs/ncbi-blast { };

  quast = callPackage pkgs/quast { };

  reapr = callPackage pkgs/reapr { };

  spades = callPackage pkgs/spades { };
  
  velvet = callPackage pkgs/velvet { };
}
