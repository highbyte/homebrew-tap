class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.15.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.15.0-alpha/wrighty-0.15.0-alpha-osx-arm64.zip"
      sha256 "09e148c6410552b9ae0bc5e4a6f4a1b8faef9f11d31bc34f14168b1128cb4037"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.15.0-alpha/wrighty-0.15.0-alpha-linux-x64.zip"
      sha256 "3d2e8763cee01b396a173b6a092ff54fb3bc58237870420b07a5a8cf70bfd23b"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.15.0-alpha/wrighty-0.15.0-alpha-linux-arm64.zip"
      sha256 "2057bd89ecb7dbfd44a67862bc9860d074bae61ef56630d0d332277cc1f8ec01"
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
