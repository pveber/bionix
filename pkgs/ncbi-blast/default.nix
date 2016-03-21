{stdenv, fetchurl, cpio}:

stdenv.mkDerivation {
  name = "ncbi-blast-2.3.0";
  src = fetchurl {
    url = ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.3.0/ncbi-blast-2.3.0+-src.tar.gz;
    sha256 = "1sclbs199vz64pbxymk25rkpmskvq6imxdanrp6vchc1ymidrs3w";
  };

  buildInputs = [cpio];

  sourceRoot = "ncbi-blast-2.3.0+-src/c++";

  configureFlags = "--without-vdb";
    
  meta = {
    description     = "Basic Local Alignment Search Tool";
    longDescription = ''The BLAST+ package offers three categories of applications: 1.) search tools, 2.) BLAST database tools, and 3.) sequence filtering tools. The blastn, blastp, blastx, tblastx, tblastn, psiblast, rpsblast, and rpstblastn are considered search applications, as they execute a BLAST search, whereas makeblastdb, blastdb_aliastool, makeprofiledb, and blastdbcmd are considered BLAST database applications, as they either create or examine BLAST databases.''; 
    license     = stdenv.lib.licenses.publicDomain;
    homepage    = http://www.ncbi.nlm.nih.gov/books/NBK279690/;
  };
}
