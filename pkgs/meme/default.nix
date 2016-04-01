{stdenv, fetchurl, perl, zlib}:

stdenv.mkDerivation {
  name = "meme-4.11.1";
  src = fetchurl {
    url = http://meme-suite.org/meme-software/4.11.1/meme_4.11.1.tar.gz;
    sha256 = "120ha97nbdgazvziixibc2xjz73222vja424kz2j512wn92j0q32";
  };

  buildInputs = [perl zlib];

  configureFlags = ''--with-url="http://meme-suite.org" --enable-build-libxml2 --enable-build-libxslt'';

  meta = {
    description = "Motif-based sequence analysis tools";
    license     = stdenv.lib.licenses.free;
    homepage    = http://meme-suite.org/index.html;
  };
}
