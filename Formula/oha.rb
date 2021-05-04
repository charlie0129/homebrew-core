class Oha < Formula
  desc "HTTP load generator, inspired by rakyll/hey with tui animation"
  homepage "https://github.com/hatoo/oha/"
  url "https://github.com/hatoo/oha/archive/v0.4.5.tar.gz"
  sha256 "13ade6a14efefb266907575512ca88b6ea1a37ab8d4060d638f26c3bcee17d5f"
  license "MIT"
  head "https://github.com/hatoo/oha.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "b6fc6998a4ee6c6042fe89fa971b82ed8cd953f87646efc063d3ae149ceab2b2"
    sha256 cellar: :any_skip_relocation, big_sur:       "948fb9ba126aab229a17dd9c273f01eb62488abf0282f1cbc8e22d4402a6ec2c"
    sha256 cellar: :any_skip_relocation, catalina:      "3c542d6da4bcaf5acf993f6e775019ca5c9299a8a772c67386f4b988731cbee1"
    sha256 cellar: :any_skip_relocation, mojave:        "5ad840b9b8d11da27f29a54c7587d4baeb6bffbd36ce86cd17327c8d2b5dfa28"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = "[200] 200 responses"
    assert_match output.to_s, shell_output("#{bin}/oha --no-tui https://www.google.com")
  end
end
