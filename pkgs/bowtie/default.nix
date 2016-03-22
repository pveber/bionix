{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "bowtie-1.1.2";
  src = fetchurl {
    url = https://github.com/BenLangmead/bowtie/archive/v1.1.2.tar.gz;
    sha256 = "19sv2ajbla3yayx0xa72zlmy1f5xzd2587wqf8v9p7jr5pqlawbi";
  };

  preConfigure = ''
    sed -i "s|/usr/local|$out|g" Makefile
  '';

  meta = {
    description     = "An ultrafast memory-efficient short read aligner";
    longDescription = ''Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small.''; 
    license     = stdenv.lib.licenses.artistic1;
    homepage    = http://bowtie-bio.sourceforge.net/index.shtml;
  };
}
