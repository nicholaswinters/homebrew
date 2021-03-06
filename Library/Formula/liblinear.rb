require 'formula'

class Liblinear < Formula
  homepage 'http://www.csie.ntu.edu.tw/~cjlin/liblinear/'
  url 'http://www.csie.ntu.edu.tw/~cjlin/liblinear/liblinear-1.92.tar.gz'
  sha1 '0f806dd7cca337eabe4bf47db1a4b92b21223a3d'

  # Fix sonames
  def patches
    { :p0 => [
      "https://trac.macports.org/export/94156/trunk/dports/math/liblinear/files/patch-Makefile.diff"
    ]}
  end

  def install
    system "make all"
    ln_s 'liblinear.dylib', 'liblinear.1.dylib'

    bin.install 'predict', 'train'
    lib.install 'liblinear.1.dylib', 'liblinear.dylib'
    include.install 'linear.h'
  end
end
