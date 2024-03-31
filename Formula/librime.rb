class Librime < Formula
  desc "Rime Input Method Engine"
  homepage "https://rime.im"
  url "https://github.com/rime/librime.git", using: :git, tag: "1.11.0"
  version "1.11.0"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "boost" => :build
  depends_on "icu4c" => :build

  def install
    ENV["PATH"] = "/usr/bin:/bin:/usr/sbin:/sbin:#{ENV["PATH"]}"
    system "make", "deps"
    system "make"
    system "make", "install"
    bin.install "dist/bin/rime_deployer"
    bin.install "dist/bin/rime_dict_manager"
    bin.install "dist/bin/rime_patch"
    bin.install "dist/bin/rime_table_decompiler"
    include.install "dist/include/rime_levers_api.h"
    include.install "dist/include/rime_api.h"
    lib.install "dist/lib/librime.1.11.0.dylib"
    lib.install "dist/lib/librime.1.dylib"
    lib.install "dist/lib/librime.dylib"
    lib.install "dist/lib/pkgconfig"
    share.install "dist/share/cmake"
  end
end
