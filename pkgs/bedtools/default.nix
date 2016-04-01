{stdenv, fetchurl, zlib}:

stdenv.mkDerivation {
  name = "bedtools-2.11.2";
  src = fetchurl {
    url = http://bedtools.googlecode.com/files/BEDTools.v2.11.2.tar.gz;
    sha256 = "0fnw4cq0gcma90ac9imq92gn48acpr0wvhqzh6c1a0z555ajkvvb";
  };

  buildInputs = [zlib];

  installPhase = ''
    mkdir -p $out/bin
    cp bin/* $out/bin # */
  '';

  meta = {
    description     = "Fast, flexible toolset for genome arithmetic";
    longDescription = ''The bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks. The most widely-used tools enable genome arithmetic: that is, set theory on the genome. For example, bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats such as BAM, BED, GFF/GTF, VCF. While each individual tool is designed to do a relatively simple task (e.g., intersect two interval files), quite sophisticated analyses can be conducted by combining multiple bedtools operations on the UNIX command line.''; 
    license     = stdenv.lib.licenses.gpl2;
    homepage    = http://bedtools.readthedocs.org/en/latest/;
  };
}
