class StylishHaskell < Formula
  desc "A Haskell code prettifier."
  homepage "https://github.com/jaspervdj/stylish-haskell"
  url "https://github.com/jaspervdj/stylish-haskell/archive/v0.11.0.3.tar.gz"
  sha256 "9581e4146490dff7594d2c31bf4610b302dacf617b8b83b063422206a68b9f2c"
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
