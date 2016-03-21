{stdenv, fetchurl, zlib}:

stdenv.mkDerivation {
  name = "velvet-1.2.10";
  src = fetchurl {
    url = https://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz;
    sha256 = "0h3njwy66p6bx14r3ar1byb0ccaxmxka4c65rn4iybyiqa4d8kc8";
  };

  buildInputs = [zlib];

  installPhase = ''
    mkdir -p $out/bin
    cp velveth velvetg $out/bin
  '';

  meta = {
    description     = "Sequence assembler for very short reads";
    longDescription = ''We have developed a new set of algorithms, collectively called Velvet to manipulate de Bruijn graphs for genomic sequence assembly. A de Bruijn graph is a compact representation based on short words (k-mers) that is ideal for high coverage, very short read (25-50 bp) data sets. Applying Velvet to very short reads and paired-ends information only, one can produce contigs of significant length, up to 50-kb N50 length in simulations of prokaryotic data and 3-kb N50 on simulated mammalian BACs. When applied to real Solexa data sets without read pairs, Velvet generated contigs of approximately 8 kb in a prokaryote and 2 kb in a mammalian BAC, in close agreement with our simulated results without read-pair information.''; 
    license     = stdenv.lib.licenses.gpl2;
    homepage    = https://www.ebi.ac.uk/~zerbino/velvet/;
  };
}
