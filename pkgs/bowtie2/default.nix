{stdenv, fetchurl, inetutils}:

stdenv.mkDerivation {
  name = "bowtie-2.2.8";
  src = fetchurl {
    url = https://github.com/BenLangmead/bowtie2/archive/v2.2.8.tar.gz;
    sha256 = "1hbsx30ab065v6a6132j2n7dgxxn3yf26hf3r7ygzpnzg5bmyyg4";
  };

  buildInputs = [inetutils];

  preConfigure = ''
    sed -i "s|/usr/local|$out|g" Makefile
  '';

  meta = {
    description     = "A fast and sensitive gapped read aligner";
    longDescription = ''Bowtie 2 is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences. It is particularly good at aligning reads of about 50 up to 100s or 1,000s of characters, and particularly good at aligning to relatively long (e.g. mammalian) genomes. Bowtie 2 indexes the genome with an FM Index to keep its memory footprint small: for the human genome, its memory footprint is typically around 3.2 GB. Bowtie 2 supports gapped, local, and paired-end alignment modes.''; 
    license     = stdenv.lib.licenses.gpl3;
    homepage    = http://bowtie-bio.sourceforge.net/bowtie2/index.shtml;
  };
}
