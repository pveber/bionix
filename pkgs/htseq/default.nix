{stdenv, fetchurl, buildPythonPackage, pythonPackages}:

buildPythonPackage {
  name = "htseq-0.6.1";

  src = fetchurl {
    url = https://pypi.python.org/packages/source/H/HTSeq/HTSeq-0.6.1p1.tar.gz;
    sha256 = "1b23cyg0zk2kj1p3mpqpbl5qi8fbqm5js3b6n8nmlvkpl7jn8r4x";
  };

  propagatedBuildInputs = [pythonPackages.numpy];

  meta = {
    homepage = http://www-huber.embl.de/HTSeq/doc/overview.html;
    description = "HTSeq is a Python package that provides infrastructure to process data from high-throughput sequencing assays.";
    license = stdenv.lib.licenses.gpl3;
  };
}
