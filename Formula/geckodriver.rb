class Geckodriver < Formula
  desc "WebDriver <-> Marionette proxy"
  homepage "https://github.com/mozilla/geckodriver"
  url "https://github.com/mozilla/geckodriver/archive/v0.17.0.tar.gz"
  sha256 "abf990c43c8794f1285bb7440806c98ccb3c8c63173a11d18368502894bbc1ff"

  bottle do
    sha256 "be3e81fa942724da7da3e95bb79e30196cf65370548344e5b23a06ac54f0f2c9" => :sierra
    sha256 "7fd6e999450b1928a1d0e2a41e511260784bef90cc9aac9d69de961da37f6dc6" => :el_capitan
    sha256 "6a3726714d11256bc4f60fb55e6f6b24724bfdc5f03a82f889137a6607ddeea4" => :yosemite
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build"
    bin.install "target/debug/geckodriver"
    bin.install_symlink bin/"geckodriver" => "wires"
  end

  test do
    system bin/"geckodriver", "--help"
  end
end
