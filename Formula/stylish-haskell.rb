class StylishHaskell < Formula
  desc "A Haskell code prettifier."
  homepage "https://github.com/jaspervdj/stylish-haskell"
  url "https://github.com/jaspervdj/stylish-haskell/archive/v0.11.0.3.tar.gz"
  sha256 "661791f67681268ea20243a2b771d40f59122ee7a88bd7ff4a34231bc3206ca5"
  license "BSD3"
  head "https://github.com/jaspervdj/stylish-haskell.git"

  bottle do
    cellar :any
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  uses_from_macos "unzip" => :build # for cabal install
  uses_from_macos "zlib"

  def install
    system "cabal", "update"
    system "cabal", "install", *std_cabal_v2_args
  end

  test do
    system "#{bin}/stylish-haskell", "--version"
  end
end
