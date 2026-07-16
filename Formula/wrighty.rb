class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.1.1-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.1.1-alpha/wrighty-0.1.1-alpha-osx-arm64.zip"
      sha256 "8dbddb45325c425fb50a6ac3861e3a227faa0a1fe8c62f4b5f62011cfc385703"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.1.1-alpha/wrighty-0.1.1-alpha-linux-x64.zip"
      sha256 "db2590a3273890000cfad49b84afd1fab957e7fa6cf79be71b7d4490a1c4f19a"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.1.1-alpha/wrighty-0.1.1-alpha-linux-arm64.zip"
      sha256 "728745b59963ddec5d3eb180efc6b4938998100032ab0bfb144afee35dc94e83"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"wrighty").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/wrighty" "$@"
    EOS
  end

  test do
    assert_match "Wrighty", shell_output("#{bin}/wrighty --help")
  end
end
