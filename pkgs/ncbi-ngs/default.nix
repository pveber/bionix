{stdenv, fetchurl, perl}:

stdenv.mkDerivation {
  name = "ncbi-ngs.1.2.3";
  src = fetchurl {
    url = https://github.com/ncbi/ngs/archive/1.2.3.tar.gz;
    sha256 = "15074fdi94c6pjy83hhk22r86kfvzpaz2i07h3rqg9yy6x3w0pk2";
  };

  buildInputs = [perl];

  configurePhase = ''
    ./ngs-sdk/configure --prefix=$out --build-prefix=_build
  '';

  buildPhase = ''
    make -C ngs-sdk
  '';

  installPhase = ''
    make -C ngs-sdk install
  '';

  meta = {
    description = "API for accessing reads, alignments and pileups produced from Next Generation Sequencing.";
    license     = stdenv.lib.licenses.publicDomain;
    homepage    = http://www.ncbi.nlm.nih.gov/books/NBK158900/;
  };
}
