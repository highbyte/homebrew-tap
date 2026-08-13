class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.11.2-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.11.2-alpha/wrighty-0.11.2-alpha-osx-arm64.zip"
      sha256 "b9e1cd15ccd6590c7ade6e06dc661ccd80f3d457b6b3b27e1a7302329a489aa1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.11.2-alpha/wrighty-0.11.2-alpha-linux-x64.zip"
      sha256 "e2b202e52a7a05714d5a2fc42d842754c7a7febd1600f0f5c150d41c88c5f05e"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.11.2-alpha/wrighty-0.11.2-alpha-linux-arm64.zip"
      sha256 "600d4569ab9f85877722ba7f419f4543a5df9587f10a23eeb2eabfca3c7a54b7"
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
