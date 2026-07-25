class Gq < Formula
  desc "Export graphdb query results as graph-row JSONL for gfig map"
  homepage "https://github.com/pmuston/homebrew-gq"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.6.0/gq-v0.6.0-darwin-arm64.tar.gz"
      sha256 "6c672eb9b761b040bc8c9d8a48a1473fbe1c8fd0f8aecc5a3372e7d07c5fecc1"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.6.0/gq-v0.6.0-darwin-amd64.tar.gz"
      sha256 "1d1eebc2e526573ad9cc0ecb6c5ab85f3bef292b815cd099ae71dcf47db49488"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.6.0/gq-v0.6.0-linux-arm64.tar.gz"
      sha256 "46e19cb6d91cdb9b6dd4c50447b19c4857a638b27490967d071f766fdd08baed"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.6.0/gq-v0.6.0-linux-amd64.tar.gz"
      sha256 "a6370f50872343b88efaa88944248e07e7933c3ba34f2d5b1c724394383c57c6"
    end
  end

  def install
    bin.install "gq"
    man1.install "gq.1"
  end

  test do
    assert_match "gq 0.6.0", shell_output("#{bin}/gq --version 2>&1")

    # A usage error is exit 1, and must say so on stderr rather than stdout.
    output = shell_output("#{bin}/gq --format table --query 'RETURN 1' 2>&1", 1)
    assert_match "must be csv or jsonl", output
  end
end
