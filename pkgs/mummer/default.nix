{stdenv, fetchurl, tcsh, perl}:

stdenv.mkDerivation {
  name = "mummer-3.23";
  src = fetchurl {
    url = http://downloads.sourceforge.net/project/mummer/mummer/3.23/MUMmer3.23.tar.gz;
    sha256 = "0bv6mwqg6imgyxga24xm1cb3mfs56zba485kxgmdiq6fv3vx9yhy";
  };

  buildInputs = [tcsh perl];

  dontStrip = true;

  #  This ugly install script is made necessary by the way the package
  #  works. In particular, you can read in the INSTALL file that:
  #
  #  "make install"
  #
  #  This command will build the appropriate scripts and binaries in the
  #  current directory. Refer to the "README" file in this directory for
  #  further assistance, or the "docs" directory for detailed information
  #  on the various utilities.  To make all of the scripts and executables
  #  accessible from different directories, simply add the full MUMmer
  #  directory path to your system PATH, or link the desired MUMmer
  #  programs to your favorite bin directory. Please note that the 'make'
  #  command dynamically generates the MUMmer scripts with the appropriate
  #  paths, therefore if the MUMmer directory is moved after the 'make'
  #  command is issued, the scripts will fail to run. If the MUMmer
  #  executables are needed in a directory other than the install
  #  directory, it is recommended that the install directory be left
  #  untouched and its files linked to the desired destination. An
  #  alternative would be to move the install directory and reissue the
  #  'make' command at the new location.

  installPhase = ''
    mkdir -p $out/bin
    find . -type f -perm /u+x -exec cp {} $out/bin \;
    cp scripts/* $out/bin # */
    cd $out/bin && make
    rm Makefile *.csh *.pl *.awk
  '';

  meta = {
    description     = "Ultra-fast alignment of large-scale DNA and protein sequences";
    longDescription = ''MUMmer is a system for rapidly aligning entire genomes, whether in complete or draft form. For example, MUMmer 3.0 can find all 20-basepair or longer exact matches between a pair of 5-megabase genomes in 13.7 seconds, using 78 MB of memory, on a 2.4 GHz Linux desktop computer. MUMmer can also align incomplete genomes; it can easily handle the 100s or 1000s of contigs from a shotgun sequencing project, and will align them to another set of contigs or a genome using the NUCmer program included with the system. If the species are too divergent for a DNA sequence alignment to detect similarity, then the PROmer program can generate alignments based upon the six-frame translations of both input sequences.''; 
    license     = stdenv.lib.licenses.artistic1;
    homepage    = http://mummer.sourceforge.net/;
  };
}
