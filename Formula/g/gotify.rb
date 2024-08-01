class Gotify < Formula
  desc "Command-line interface for pushing messages to gotify/server"
  homepage "https://github.com/gotify/cli"
  url "https://github.com/gotify/cli/archive/refs/tags/v2.3.2.tar.gz"
  sha256 "e3b798d89138fdbc355a66d0fc2ca96676591366460f72c8f38b81365bebe5ba"
  license "MIT"
  head "https://github.com/gotify/cli.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "1377bb103cdc435951868b928ab8f1c940d08d8d187e5aa18ce06f8e122ec752"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "c9298e8a450bfe79af36395869f09ac5dc6da0656e735bf2465527c2924a75e7"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c8d689fcd5e4f449a526a8e2c9a2a4cb0609d19fb0e2bd568a0889a7fece78fd"
    sha256 cellar: :any_skip_relocation, sonoma:         "2677559d48fef384b532e425a2b00e2d6323dbbda9566183c258db300a0b3a8f"
    sha256 cellar: :any_skip_relocation, ventura:        "10d48a803787baadf6fe9f8bfb5bb55b8377cd325080e4f411cc4b60ba4bd608"
    sha256 cellar: :any_skip_relocation, monterey:       "bd6ee3e04f73e62ac0474ebc67cd385cc2e233753589c83f5810dbd56536aae1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9f60b21853ee118f5532cfa5f7fe36b99308c2b1127ca4bee142ca6a01a8cdab"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.Version=#{version}
                                       -X main.BuildDate=#{time.iso8601}
                                       -X main.Commit=N/A")
  end

  test do
    assert_match "token is not configured, run 'gotify init'",
      shell_output("#{bin}/gotify p test", 1)
  end
end
