{stdenv, fetchurl, cmake, bzip2, zlib}:

stdenv.mkDerivation {
  name = "spades-3.6.2";
  src = fetchurl {
    url = http://spades.bioinf.spbau.ru/release3.6.2/SPAdes-3.6.2.tar.gz;
    sha256 = "0pzbc6rq67cr89bgkw7smaxs87vp8bygx21w7l1y2gk20wkpx290";
  };

  buildInputs = [cmake bzip2 zlib];

  dontUseCmakeConfigure = true;

  buildPhase = ''
    sed -i 's/make -j 8/make/g' spades_compile.sh
    ./spades_compile.sh
  '';  

  installPhase = ''
    mkdir -p $out
    cp -r bin $out
    cp -r share $out
  '';

  meta = {
    description     = "St. Petersburg genome assembler";
    longDescription = ''SPAdes – St. Petersburg genome assembler – is intended for both standard isolates and single-cell MDA bacteria assemblies.''; 
    license     = stdenv.lib.licenses.gpl2;
    homepage    = http://bioinf.spbau.ru/spades;
  };
}
