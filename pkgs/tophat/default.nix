{stdenv, fetchurl, boost, python, zlib}:

stdenv.mkDerivation {
  name = "tophat.2.1.1";
  src = fetchurl {
    url = https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.tar.gz;
    sha256 = "19add02kv2xhd6ihd779dr7x35ggym3jqr0m5c4315i1yfb0p11p";
  };

  buildInputs = [boost python zlib];

  meta = {
    description     = "Spliced read mapper for RNA-Seq data";
    longDescription = ''TopHat is a fast splice junction mapper for nucleotide sequence reads produced by the RNA-Seq method.  It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons.'';
    license     = stdenv.lib.licenses.boost;
    homepage    = http://ccb.jhu.edu/software/tophat/index.shtml;
  };
}
