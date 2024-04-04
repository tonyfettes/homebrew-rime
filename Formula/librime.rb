class Librime < Formula
  desc "Rime Input Method Engine"
  homepage "https://rime.im"
  url "https://github.com/rime/librime.git",
    using: :git,
    tag: "1.11.0",
    revision: "76a0a16c5ca0c7efc80fa918c8e0c88754699fd7"
  license "BSD-3-Clause"

  depends_on "boost" => :build
  depends_on "cmake" => :build
  depends_on "icu4c" => :build

  def install
    ENV["PATH"] = "/usr/bin:/bin:/usr/sbin:/sbin:#{ENV["PATH"]}"
    ENV["prefix"] = prefix
    system "echo", "prefix=#{prefix}"
    system "make", "deps"
    system "make"
    system "make", "install"
  end
end
