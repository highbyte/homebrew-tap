class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.1.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.1.0-alpha/wrighty-0.1.0-alpha-osx-arm64.zip"
      sha256 "75c24fd4654eb016d44ed4d978e799c9adbce576622b0a15ec1d45f34631d510"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.1.0-alpha/wrighty-0.1.0-alpha-linux-x64.zip"
      sha256 "a4b4490c018d434122d0f3b6e2b45e4b37535da7903cc1faf59d13679826874c"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.1.0-alpha/wrighty-0.1.0-alpha-linux-arm64.zip"
      sha256 "364faec86fa1560058f17230913aa3969a227ca80730e85808b8727c28b1c110"
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
