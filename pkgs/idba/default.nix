{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "idba-1.1.1";
  src = fetchurl {
    url = http://hku-idba.googlecode.com/files/idba-1.1.1.tar.gz;
    sha256 = "0lwb29999sdvfczv7q27j42zka8xw4n1m4zp5zg6w68biir4qj7p";
  };

  buildInputs = [];

  # http://seqanswers.com/forums/showthread.php?t=29109
  preBuild = ''
    sed -i 's/kMaxShortSequence = 128/kMaxShortSequence = 300/g' src/sequence/short_sequence.h
  '';

  # make install doesn't work: https://github.com/loneknightpy/idba/issues/5
  installPhase = ''
    mkdir -p $out/bin
    find bin -type f -executable -print | xargs cp -t $out/bin
  '';

  meta = {
    description     = "Iterative De Bruijn Graph De Novo Assembler for Short Reads Sequencing data";
    longDescription = ''It is an extension of IDBA algorithm. IDBA-UD also iterates from small k to a large k. In each iteration, short and low-depth contigs are removed iteratively with cutoff threshold from low to high to reduce the errors in low-depth and high-depth regions. Paired-end reads are aligned to contigs and assembled locally to generate some missing k-mers in low-depth regions. With these technologies, IDBA-UD can iterate k value of de Bruijn graph to a very large value with less gaps and less branches to form long contigs in both low-depth and high-depth regions.''; 
    license     = stdenv.lib.licenses.gpl2;
    homepage    = http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/index.html;
  };
}
