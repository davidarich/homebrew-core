class Spiped < Formula
  desc "Secure pipe daemon"
  homepage "https://www.tarsnap.com/spiped.html"
  url "https://www.tarsnap.com/spiped/spiped-1.6.0.tgz"
  sha256 "e6f7f8f912172c3ad55638af8346ae7c4ecaa92aed6d3fb60f2bda4359cba1e4"

  bottle do
    cellar :any
    sha256 "4c93fb4b8d99a6dc4403f03c17ed11dc472942fbcf435ec47b19ab4078c80b38" => :sierra
    sha256 "7ca00ff605a54d6d2ed7b318d9ddaa6544ae7674038f6c71e5d361a271aa2c1c" => :el_capitan
    sha256 "0fa3dad7bbbc0503aecc38921f83e96bc463ce11cdc4e89c2c7a71a4e99d5063" => :yosemite
    sha256 "86fa5b0f80d693a111d20237c19123448883200c41cb4af8e66fb719cf79ea5e" => :mavericks
    sha256 "2c1ef2cb9518b416626802832bf7df2a3b736b83d2bbc767be7fb81b1be2a4de" => :mountain_lion
  end

  depends_on "bsdmake" => :build
  depends_on "openssl"

  def install
    man1.mkpath
    system "bsdmake", "BINDIR_DEFAULT=#{bin}", "MAN1DIR=#{man1}", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spipe -v 2>&1")
  end
end
