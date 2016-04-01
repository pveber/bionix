{stdenv, fetchurl, buildPythonPackage, pythonPackages}:

buildPythonPackage {
  name = "macs-2.1.0";

  src = fetchurl {
    url = https://pypi.python.org/packages/source/M/MACS2/MACS2-2.1.0.20150420.1.tar.gz;
    sha256 = "1zpxn9nxmfwj8zr8b4gjrx8j81mijgjmagl4prpkghphfbziwraw";
  };

  propagatedBuildInputs = [pythonPackages.numpy];

  meta = {
    homepage = https://github.com/taoliu/MACS;
    description = "Model-based Analysis of ChIP-Seq";
    longDescription = ''We present a novel algorithm, named Model-based Analysis of ChIP-Seq (MACS), for identifying transcript factor binding sites. MACS captures the influence of genome complexity to evaluate the significance of enriched ChIP regions, and MACS improves the spatial resolution of binding sites through combining the information of both sequencing tag position and orientation. MACS can be easily used for ChIP-Seq data alone, or with control sample with the increase of specificity.'';
    license = stdenv.lib.licenses.gpl3;
  };
}
