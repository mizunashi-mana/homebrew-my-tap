class Ghcup < Formula
  desc "An installer for the general purpose language Haskell"
  homepage "https://www.haskell.org/ghcup/"
  url "https://gitlab.haskell.org/haskell/ghcup-hs/-/archive/v0.1.8/ghcup-hs-v0.1.8.tar.gz"
  sha256 "661791f67681268ea20243a2b771d40f59122ee7a88bd7ff4a34231bc3206ca5"
  license "LGPL-3.0-only"
  head "https://gitlab.haskell.org/haskell/ghcup-hs.git"

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
    system "#{bin}/ghcup", "--version"
  end
end
