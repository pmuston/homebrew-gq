class Gq < Formula
  desc "Export graphdb query results as graph-row JSONL for gfig map"
  homepage "https://github.com/pmuston/homebrew-gq"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.3.0/gq-v0.3.0-darwin-arm64.tar.gz"
      sha256 "6114a0faee3669d64e17b45856027fe22366e65cd78ea03b33f1c85e81bd00f3"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.3.0/gq-v0.3.0-darwin-amd64.tar.gz"
      sha256 "4694d6fa566d8e5f5fb14f5e1f1c2d3ec7c843c5aeec16bc1a93c4d0462f0223"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.3.0/gq-v0.3.0-linux-arm64.tar.gz"
      sha256 "70050978ae10fed591944da69acf625c758f574d2554e44da4faa248a20fe2c7"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.3.0/gq-v0.3.0-linux-amd64.tar.gz"
      sha256 "f8b260bbec632375e6f7da0efa86f4a555c97da37b6ab08df0b72351778c6220"
    end
  end

  def install
    bin.install "gq"
  end

  test do
    assert_match "gq 0.3.0", shell_output("#{bin}/gq --version 2>&1")

    # A usage error is exit 3, and must say so on stderr rather than stdout.
    output = shell_output("#{bin}/gq --format table --query 'RETURN 1' 2>&1", 3)
    assert_match "must be jsonl", output
  end
end
