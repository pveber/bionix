{stdenv, fetchurl, ncurses, perl, perlPackages, rsync, zlib}:

stdenv.mkDerivation {
  name = "reapr-1.0.18";
  src = fetchurl {
    url = ftp://ftp.sanger.ac.uk/pub/resources/software/reapr/Reapr_1.0.18.tar.gz;
    sha256 = "0q36idj6vd08d3qxi2y6x6b7cyh96ag367bp5qryz2n595dinsbd";
  };

  buildInputs = [ncurses perl perlPackages.FileCopyLink rsync zlib];

  preConfigure = ''
    substituteInPlace third_party/samtools/Makefile \
      --replace "lcurses" "lncurses"
    substituteInPlace src/Makefile \
      --replace "-rpath,\$(BAMTOOLS_ROOT)/lib" "-rpath,$out/bin/src/bamtools/lib"
  '';
  
  buildPhase = ''
    ./install.sh
  '';

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/bin/third_party
    cp -r reapr src $out/bin
    rsync -Rl \
      reapr \
      src \
      third_party/samtools \
      third_party/samtools-0.1.18/samtools \
      third_party/smalt_x86_64 \
      third_party/tabix \
      third_party/ekg-tabixpp-fbdde77/tabix \
      third_party/ekg-tabixpp-fbdde77/bgzip \
      third_party/bamtools \
      third_party/pezmaster31-bamtools-7f8b301/lib/* \
      $out/bin
  '';

  postFixup = ''
    for f in $out/bin/src/*.pl; do # */
      substituteInPlace $f --replace "${perl}/bin/perl" \
          "${perl}/bin/perl -I${perlPackages.FileCopyLink}/${perl.libPrefix}"
    done 
  '';

  meta = {
    description     = "A universal tool for genome assembly evaluation";
    longDescription = ''REAPR is a tool that evaluates the accuracy of a
    genome assembly using mapped paired end reads, without the use of a
    reference genome for comparison. It can be used in any stage of an
    assembly pipeline to automatically break incorrect scaffolds and
    flag other errors in an assembly for manual inspection. It reports
    mis-assemblies and other warnings, and produces a new broken assembly
    based on the error calls.''; 
    license     = stdenv.lib.licenses.gpl3;
    homepage    = http://www.sanger.ac.uk/science/tools/reapr;
  };
}
