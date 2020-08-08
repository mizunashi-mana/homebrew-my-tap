class Ghcup < Formula
  desc "An installer for the general purpose language Haskell"
  homepage "https://www.haskell.org/ghcup/"
  url "https://gitlab.haskell.org/haskell/ghcup-hs/-/archive/v0.1.8/ghcup-hs-v0.1.8.tar.gz"
  sha256 "88f9d033ece7fd51eca3abb4f02e13b63c924b97f9705a997d5a711c0cf42ab1"
  license "LGPL-3.0-only"
  head "https://gitlab.haskell.org/haskell/ghcup-hs.git", branch: "devel"

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
  end
end
