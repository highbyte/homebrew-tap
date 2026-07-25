class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.9.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.9.0-alpha/wrighty-0.9.0-alpha-osx-arm64.zip"
      sha256 "41884763a2c191c0a0eb30185afb029eea71d0fbf84901a040c5164eccebe6b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.9.0-alpha/wrighty-0.9.0-alpha-linux-x64.zip"
      sha256 "bbd0a00741175b03a51f0fe3da54487c57dfa1f5913923487ed42d1e1d67c9ee"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.9.0-alpha/wrighty-0.9.0-alpha-linux-arm64.zip"
      sha256 "4a2f89f6899e8b0389060dc0e96518560c52e17b31112c334ef178a6dc7c25b7"
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
