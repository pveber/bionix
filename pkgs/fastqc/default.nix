{stdenv, fetchurl, unzip}:

stdenv.mkDerivation {
  name = "fastqc-0.10.1";
  src = fetchurl {
    url = http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.10.1.zip;
    sha256 = "160hl37j1l62k8cig3s0v2k56i6x35rp982d4c490891hwz0xcjh";
  };

  buildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/local/fastqc
    cp -r * $out/local/fastqc
    chmod 755 $out/local/fastqc/fastqc
    mkdir $out/bin
    (cd $out/bin && ln -s ../local/fastqc/fastqc .)
  '';

  meta = {
    description     = "A quality control tool for high throughput sequence data.";
    longDescription = ''FastQC aims to provide a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines. It provides a modular set of analyses which you can use to give a quick impression of whether your data has any problems of which you should be aware before doing any further analysis.''; 
    license     = stdenv.lib.licenses.gpl3;
    homepage    = http://www.bioinformatics.babraham.ac.uk/projects/fastqc/;
  };
}
