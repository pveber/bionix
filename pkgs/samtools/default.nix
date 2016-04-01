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
    description     = "An ultrafast memory-efficient short read aligner";
    longDescription = ''Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small.'';
    license     = stdenv.lib.licenses.artistic1;
    homepage    = http://bowtie-bio.sourceforge.net/index.shtml;
  };
}
