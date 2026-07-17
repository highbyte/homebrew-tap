class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.2.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.2.0-alpha/wrighty-0.2.0-alpha-osx-arm64.zip"
      sha256 "7ce51f64a8c218dda505569b4d53a98a28ea0a28b4caab5b5ea9d844af6be448"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.2.0-alpha/wrighty-0.2.0-alpha-linux-x64.zip"
      sha256 "fcfb8e5f9f96e9eb46d3accbc6da2b701c31961fdd2d5aa39da166072b42ec3f"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.2.0-alpha/wrighty-0.2.0-alpha-linux-arm64.zip"
      sha256 "d9a0ec94572c14a1ef801b5af40732e1e9604977fa4b4b4ee16be690f60c0418"
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
