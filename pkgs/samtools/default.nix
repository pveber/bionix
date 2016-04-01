{stdenv, fetchurl, ncurses, zlib}:

stdenv.mkDerivation {
  name = "samtools";
  src = fetchurl {
    url = http://downloads.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2;
    sha256 = "1m33xsfwz0s8qi45lylagfllqg7fphf4dr0780rsvw75av9wk06h";
  };

  buildInputs = [ncurses zlib];

  preBuild = ''
    sed -i "s/-lcurses/-lncurses/g" Makefile
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp samtools $out/bin

    mkdir -p $out/include/bam
    cp *.h $out/include/bam

    mkdir -p $out/lib
    cp libbam.a $out/lib
  '';

  meta = {
    description     = "Tools for manipulating next-generation sequencing data";
    license     = stdenv.lib.licenses.mit;
    homepage    = https://github.com/samtools/samtools;
  };
}
