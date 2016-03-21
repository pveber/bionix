{stdenv, fetchurl, gsl}:

stdenv.mkDerivation {
  name = "art-03.19.15";
  src = fetchurl {
    url = http://www.niehs.nih.gov/research/resources/assets/docs/artsrcchocolatecherrycake031915linuxtgz.tgz;
    sha256 = "0ra9b1h1p4rqfnrzfrsjqqni86q9z9912b3vq1grxr87ybcisvrh";
  };

  buildInputs = [gsl];

  dontStrip = true;

  meta = {
    description     = "A set of simulation tools to generate synthetic next-generation sequencing reads";
    longDescription = ''ART simulates sequencing reads by mimicking real sequencing process with empirical error models or quality profiles summarized from large recalibrated sequencing data. ART can also simulate reads using user own read error model or quality profiles. ART supports simulation of single-end, paired-end/mate-pair reads of three major commercial next-generation sequencing platforms: Illumina's Solexa, Roche's 454 and Applied Biosystems' SOLiD. ART can be used to test or benchmark a variety of method or tools for next-generation sequencing data analysis, including read alignment, de novo assembly, SNP and structure variation discovery.''; 
    license     = stdenv.lib.licenses.gpl3;
    homepage    = http://www.niehs.nih.gov/research/resources/software/biostatistics/art/;
  };
}
