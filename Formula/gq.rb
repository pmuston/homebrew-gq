class Gq < Formula
  desc "Export graphdb query results as graph-row JSONL for gfig map"
  homepage "https://github.com/pmuston/homebrew-gq"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.4.0/gq-v0.4.0-darwin-arm64.tar.gz"
      sha256 "51c064edab892d972bcf59007a1206048261f177d106de5662bcbbbbd958f5fa"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.4.0/gq-v0.4.0-darwin-amd64.tar.gz"
      sha256 "cbff673984cc544eb19839da149f50f39f887e085f01aae3cf039967c3f1d162"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.4.0/gq-v0.4.0-linux-arm64.tar.gz"
      sha256 "10282e412e19dcb39ce82606926e64c62e15a14f8cfd33d42725307ae4f1ead6"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.4.0/gq-v0.4.0-linux-amd64.tar.gz"
      sha256 "be09b5799e84019d76b292ed3ed37bf216caded43e1c7eaad5d29fe1f70d9ae8"
    end
  end

  def install
    bin.install "gq"
  end

  test do
    assert_match "gq 0.4.0", shell_output("#{bin}/gq --version 2>&1")

    # A usage error is exit 1, and must say so on stderr rather than stdout.
    output = shell_output("#{bin}/gq --format table --query 'RETURN 1' 2>&1", 1)
    assert_match "must be csv or jsonl", output
  end
end
