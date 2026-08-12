class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.11.1-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.11.1-alpha/wrighty-0.11.1-alpha-osx-arm64.zip"
      sha256 "205942b984d47d2a5752fe47e491a37717ab5ce63efa792dc764d65913b04ee6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.11.1-alpha/wrighty-0.11.1-alpha-linux-x64.zip"
      sha256 "7e222e2803a3ee54f4ad0f81671b074c863a9542524d0e882006f00982d1b309"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.11.1-alpha/wrighty-0.11.1-alpha-linux-arm64.zip"
      sha256 "b069561cf7e66ee571c61f0655a5e6b1181aac58e5c20be05c3ccb7d2a1284e4"
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
