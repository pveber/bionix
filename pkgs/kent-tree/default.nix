{stdenv, fetchurl, libpng, mysql, openssl, zlib}:

stdenv.mkDerivation {
  name = "kent-tree.330";
  src = fetchurl {
    url = https://github.com/ucscGenomeBrowser/kent/archive/v330_base.tar.gz;
    sha256 = "1ri353d0ipfklq22dac31l64dsqcgrhppdz77l1qbj1nlj0i9x0y";
  };

  buildInputs = [libpng mysql openssl zlib];

  buildPhase = ''
    MACHTYPE=`echo ${builtins.currentSystem} | cut -d '-' -f 1`
    MYSQLLIBS=`mysql_config --libs`
    MYSQLINC=`mysql_config --include  | cut -d ' ' -f 1 | sed -e 's/-I//g'`/mysql
    BINDIR=`pwd`/bin

    make -C src userApps \
        BINDIR="$BINDIR" \
        SCRIPTS="$BINDIR" \
        MACHTYPE="$MACHTYPE" \
        MYSQLLIBS="$MYSQLLIBS -lz" \
        MYSQLINC="$MYSQLINC"
    make -C src/hg/gpToGtf \
        BINDIR="$BINDIR" \
        SCRIPTS="$BINDIR" \
        MACHTYPE="$MACHTYPE" \
        MYSQLLIBS="$MYSQLLIBS -lz" \
        MYSQLINC="$MYSQLINC"
  '';

  installPhase = ''
    mkdir -p $out
    cp -r bin $out
  '';

  meta = {
    description     = "An ultrafast memory-efficient short read aligner";
    longDescription = ''Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small.''; 
    license     = stdenv.lib.licenses.artistic1;
    homepage    = http://bowtie-bio.sourceforge.net/index.shtml;
  };
}
