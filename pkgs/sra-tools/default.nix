{stdenv, fetchurl, libxml2, ncbi-ngs, ncbi-vdb, perl}:

stdenv.mkDerivation {
  name = "sra-tools.2.5.7";
  src = fetchurl {
    url = https://github.com/ncbi/sra-tools/archive/2.5.7.tar.gz;
    sha256 = "0q93qg744x787d08qmjmdafki1wkbvkdwynayjnjd454gkd26jl5";
  };

  buildInputs = [libxml2 ncbi-ngs ncbi-vdb perl];

  configurePhase = ''
    ./configure --prefix=$out \
                --build-prefix=_build \
                --with-ngs-sdk-prefix=${ncbi-ngs} \
                --with-ncbi-vdb-sources=${ncbi-vdb}/include \
                --with-ncbi-vdb-build=${ncbi-vdb}/_build \
#                --with-xml2-prefix=${libxml2}  # Building with libxml2 fails with puzzling ld error
  '';

  meta = {
    description = "Tools and libraries for reading and writing sequencing data";
    longDescription = "The SRA Toolkit from NCBI is a collection of tools and libraries for reading of sequencing files from the Sequence Read Archive (SRA) database and writing files into the .sra format.";
    license     = stdenv.lib.licenses.publicDomain;
    homepage    = https://github.com/ncbi/sra-tools;
  };
}
