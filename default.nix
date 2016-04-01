{ system ? import <nixpkgs> {} }:

let
  callPackage = system.lib.callPackageWith (system // self);

  self = rec {

    FileCopyLink = with system ; buildPerlPackage rec {
      name = "File-Copy-Link-0.140";
      src = fetchurl {
        url = "mirror://cpan/authors/id/R/RM/RMBARKER/${name}.tar.gz";
        sha256 = "2063656dcd38bade43dc7f1e2ef5f1b6a8086c2f15d37b334189bd2a28e8ffeb";
      };
      meta = {
        description = "Extension for replacing a link by a copy of the linked file";
        license = with stdenv.lib.licenses; [ artistic1 gpl1Plus ];
      };
    };

    perlPackages = system.perlPackages // {
      inherit FileCopyLink;
    };

    art = callPackage pkgs/art { };

    bedtools = callPackage pkgs/bedtools { };

    bowtie = callPackage pkgs/bowtie { };

    bowtie2 = callPackage pkgs/bowtie2 { };

    cisa = callPackage pkgs/cisa { };

    fastqc = callPackage pkgs/fastqc { };

    htseq = callPackage pkgs/htseq { };

    idba = callPackage pkgs/idba { };

    macs2 = callPackage pkgs/macs2 { };

    meme = callPackage pkgs/meme { };

    mummer = callPackage pkgs/mummer { };

    ncbi_blast = callPackage pkgs/ncbi-blast { };

    ncbi-ngs = callPackage pkgs/ncbi-ngs { };

    quast = callPackage pkgs/quast { };

    reapr = callPackage pkgs/reapr { };

    samtools = callPackage pkgs/samtools { };

    spades = callPackage pkgs/spades { };

    trinity = callPackage pkgs/trinity { };
  
    velvet = callPackage pkgs/velvet { };
  };

in self
