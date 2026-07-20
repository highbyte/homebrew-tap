class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.4.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.4.0-alpha/wrighty-0.4.0-alpha-osx-arm64.zip"
      sha256 "eca2ebc32a33581690f524cbdb67988f2e84cc543b2282904994de66f6951766"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.4.0-alpha/wrighty-0.4.0-alpha-linux-x64.zip"
      sha256 "4f9c0e303c499d312e4efcb90cc4c13ee574a5fbe547b8ca42b52ca964473a40"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.4.0-alpha/wrighty-0.4.0-alpha-linux-arm64.zip"
      sha256 "d267d363ef4e9aa9eca8553141083023f242ed434830675b5cdc9ad007176792"
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
