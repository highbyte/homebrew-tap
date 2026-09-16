class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.19.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.19.0-alpha/wrighty-0.19.0-alpha-osx-arm64.zip"
      sha256 "70dc07ce6072e2e141e1896ca98171539e94b32ab654d3aa49e542e025bcc6f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.19.0-alpha/wrighty-0.19.0-alpha-linux-x64.zip"
      sha256 "b7dd5136a6c02c3d43cf7baa8be42172fb2609beedb958ba47e614f8e1302b83"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.19.0-alpha/wrighty-0.19.0-alpha-linux-arm64.zip"
      sha256 "98e6da795396c25ae7d6c77e217513abab6d33902dabeaa7e417ccd381b25d3e"
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
