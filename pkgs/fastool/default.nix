{stdenv, fetchurl}:

stdenv.mkDerivation {
  name = "fastool.0.1.4";
  src = fetchurl {
    url = https://github.com/fstrozzi/Fastool/archive/0.1.4.tar.gz;
    sha256 = "0h2509bxwlm7j7fjvbfm81fwbw36dsv45917dmyvfyclxpy04vzq";
  };

  buildInputs = [];

  installPhase = ''
    mkdir -p $out/bin
    cp fastool $out/bin
  '';
  
  meta = {
    description     = "Simple and quick FastQ and FastA tool for file reading and conversion";
    longDescription = ''A simple and quick tool to read huge FastQ and FastA files (both normal and gzipped) and manipulate them.''; 
    license     = stdenv.lib.licenses.mit;
    homepage    = https://github.com/fstrozzi/Fastool;
  };
}
