class Gq < Formula
  desc "Export graphdb query results as graph-row JSONL for gfig map"
  homepage "https://github.com/pmuston/homebrew-gq"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.1.0/gq-v0.1.0-darwin-arm64.tar.gz"
      sha256 "3c6300dd131f0e2d29be281d6a21ccd172a9ecf769d93fb8b8d7a894c1c8feff"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.1.0/gq-v0.1.0-darwin-amd64.tar.gz"
      sha256 "0cb405d8546a46cf3766a9b150c9e60a4e2476694ac193a0eec63d0b2c0a5c17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.1.0/gq-v0.1.0-linux-arm64.tar.gz"
      sha256 "6bfb8e50ec6bbda128316d802184add2289ab5873b154037cf9fb26fbab80782"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.1.0/gq-v0.1.0-linux-amd64.tar.gz"
      sha256 "91d39e0e7401fa52239b50996a48690dbc0defb311418307cf6ad49c922c02cb"
    end
  end

  def install
    bin.install "gq"
  end

  test do
    assert_match "gq 0.1.0", shell_output("#{bin}/gq --version 2>&1")

    # A usage error is exit 3, and must say so on stderr rather than stdout.
    output = shell_output("#{bin}/gq --format table --query 'RETURN 1' 2>&1", 3)
    assert_match "must be jsonl", output
  end
end
