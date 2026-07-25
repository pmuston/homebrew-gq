class Gq < Formula
  desc "Export graphdb query results as graph-row JSONL for gfig map"
  homepage "https://github.com/pmuston/homebrew-gq"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.5.0/gq-v0.5.0-darwin-arm64.tar.gz"
      sha256 "b563212331cb1bbdd769a1a4aac094982c0ccbb335fa90a6120b03e299f6e247"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.5.0/gq-v0.5.0-darwin-amd64.tar.gz"
      sha256 "6059898169fb70bd4006006371e73f5b1e9b390de4cb48f698a670056067b98a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.5.0/gq-v0.5.0-linux-arm64.tar.gz"
      sha256 "15ea8e69ac8be9939b67d63d358553b102f303b3dd927ea06dde127b1c0000f4"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.5.0/gq-v0.5.0-linux-amd64.tar.gz"
      sha256 "a066ceff42ee334fa908682ac94a0a870db34b159115d69408f1bd934d9bfa14"
    end
  end

  def install
    bin.install "gq"
    man1.install "gq.1"
  end

  test do
    assert_match "gq 0.5.0", shell_output("#{bin}/gq --version 2>&1")

    # A usage error is exit 1, and must say so on stderr rather than stdout.
    output = shell_output("#{bin}/gq --format table --query 'RETURN 1' 2>&1", 1)
    assert_match "must be csv or jsonl", output
  end
end
