{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "quast-3.2";
  src = fetchurl {
    url = http://netcologne.dl.sourceforge.net/project/quast/quast-3.2.tar.gz;
    sha256 = "00hc73318kzp1h8w0vka8qh6ljzkpipq80wwzbq7jmhqzhj4hlz1";
  };

  buildInputs = [];
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp -r * $out/bin
    cd $out/bin
    echo "#!/bin/sh" > quast
    echo "python $out/bin/quast.py" >> quast
    chmod u+x quast
  '';

  meta = {
    description     = "QUAST: Quality Assessment Tool for Genome Assemblies";
    longDescription = ''QUAST evaluates genome assemblies. It can works both with and without a given reference genome. The tool accepts multiple assemblies, thus is suitable for comparison.''; 
    license     = stdenv.lib.licenses.gpl2;
    homepage    = http://bioinf.spbau.ru/quast;
  };
}
