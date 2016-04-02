{stdenv, fetchurl, libxml2, ncbi-ngs, perl}:

stdenv.mkDerivation {
  name = "ncbi-vdb.2.5.7";
  src = fetchurl {
    url = https://github.com/ncbi/ncbi-vdb/archive/2.5.7.tar.gz;
    sha256 = "0hay5hy8ynva3mi5wbn4wmq1q23qwxc3aqzbb86hg3x4f1r73270";
  };

  buildInputs = [libxml2 ncbi-ngs perl];

  configurePhase = ''
    ./configure --prefix=$out \
                --build-prefix=_build \
                --with-ngs-sdk-prefix=${ncbi-ngs} \
                --with-xml2-prefix=${libxml2}
  '';

  installPhase = ''
    make install
    cp -Rp interfaces $out/include
    cp -Rp _build $out/_build
  '';

  meta = {
    description = "ncbi-vdb";
    license     = stdenv.lib.licenses.publicDomain;
    homepage    = https://github.com/ncbi/ncbi-vdb;
  };
}
