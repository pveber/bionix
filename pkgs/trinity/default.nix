{stdenv, fetchurl, ncurses, zlib}:

stdenv.mkDerivation {
  name = "trinity-2.2.0";
  src = fetchurl {
    url = https://github.com/trinityrnaseq/trinityrnaseq/archive/v2.2.0.tar.gz;
    sha256 = "17kcwizzmwfl0i0jdvz8zv7hx2fm909b6c6jgm282sn7dbjh6ipk";
  };

  buildInputs = [ncurses zlib];

  patches = [
    ./trinity-plugins.Makefile.patch # fix compilation of samtools
  ];

  patchFlags = "-p0";

  buildPhase = ''
    make
    make plugins
  '';
  
  installPhase = ''
    mkdir -p $out/bin
    cp -r Trinity PerlLib Butterfly Chrysalis Inchworm trinity-plugins util $out/bin
  '';

  meta = {
    description     = "RNA-Seq De novo Assembly";
    longDescription = ''Trinity, developed at the Broad Institute and the Hebrew University of Jerusalem, represents a novel method for the efficient and robust de novo reconstruction of transcriptomes from RNA-seq data. Trinity combines three independent software modules: Inchworm, Chrysalis, and Butterfly, applied sequentially to process large volumes of RNA-seq reads. Trinity partitions the sequence data into many individual de Bruijn graphs, each representing the transcriptional complexity at at a given gene or locus, and then processes each graph independently to extract full-length splicing isoforms and to tease apart transcripts derived from paralogous genes.''; 
    license     = stdenv.lib.licenses.bsd3;
    homepage    = https://github.com/trinityrnaseq/trinityrnaseq/wiki;
  };
}
