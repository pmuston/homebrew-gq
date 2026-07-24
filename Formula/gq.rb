class Gq < Formula
  desc "Export graphdb query results as graph-row JSONL for gfig map"
  homepage "https://github.com/pmuston/homebrew-gq"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.2.0/gq-v0.2.0-darwin-arm64.tar.gz"
      sha256 "363c5ca7b08ba8d95e726271e9c4f78d08d0f99890db4140497be1a4de3482ef"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.2.0/gq-v0.2.0-darwin-amd64.tar.gz"
      sha256 "d0946ff757821be1853a4406578fe6fba3893fb7b12aff1869e8c15f7143fe79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.2.0/gq-v0.2.0-linux-arm64.tar.gz"
      sha256 "bb202173f89d6310a856040b15efecff031aaf3c12401174920bd743320923d9"
    end
    on_intel do
      url "https://github.com/pmuston/homebrew-gq/releases/download/v0.2.0/gq-v0.2.0-linux-amd64.tar.gz"
      sha256 "232c439ab469ec3666b3a72ef9f32fa672866895468f6aec8c07b83d675faa5c"
    end
  end

  def install
    bin.install "gq"
  end

  test do
    assert_match "gq 0.2.0", shell_output("#{bin}/gq --version 2>&1")

    # A usage error is exit 3, and must say so on stderr rather than stdout.
    output = shell_output("#{bin}/gq --format table --query 'RETURN 1' 2>&1", 3)
    assert_match "must be jsonl", output
  end
end
