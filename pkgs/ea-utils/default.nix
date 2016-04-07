{stdenv, fetchurl, gsl, zlib}:

stdenv.mkDerivation {
  name = "ea-utils.1.1.2";
  src = fetchurl {
    url = https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ea-utils/ea-utils.1.1.2-537.tar.gz;
    sha256 = "15hb138vmz9dy4ylslg85mff00r707zymaw4k70bv0i1xvyc926d";
  };

  buildInputs = [gsl zlib];

  installPhase = ''
    PREFIX=$out make install
  '';
  
  meta = {
    description     = "FASTQ processing utilities";
    longDescription = ''Command-line tools for processing biological sequencing data. Barcode demultiplexing, adapter trimming, etc. Primarily written to support an Illumina based pipeline - but should work with any FASTQs.''; 
    license     = stdenv.lib.licenses.mit;
    homepage    = https://code.google.com/archive/p/ea-utils/;
  };
}
