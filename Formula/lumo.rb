class Lumo < Formula
  desc "Fast, cross-platform, standalone ClojureScript REPL"
  homepage "https://github.com/anmonteiro/lumo"
  url "https://github.com/anmonteiro/lumo/archive/1.6.0.tar.gz"
  sha256 "d5ab1d926ecef8624117250f6bd0cff1f78aba763ddc3221b676d3610eee69e3"
  head "https://github.com/anmonteiro/lumo.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "47df98a319bea71d0dcd19ffd7bcdfa41e2f09b2ed38cd708abba7c1542599f9" => :sierra
    sha256 "0c23395c535313159193833891b59404878ebfd6dea0306922931f9c7d38c91b" => :el_capitan
    sha256 "fe2888840a457bf72d9c6af15d1c8f903cd33629696b999caa171851e8b2f7e7" => :yosemite
  end

  depends_on "boot-clj" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build

  def install
    ENV["BOOT_HOME"] = "#{buildpath}/.boot"
    ENV["BOOT_LOCAL_REPO"] = "#{buildpath}/.m2/repository"
    system "boot", "release-ci"
    bin.install "build/lumo"
  end

  test do
    assert_equal "0", shell_output("#{bin}/lumo -e '(- 1 1)'").chomp
  end
end
