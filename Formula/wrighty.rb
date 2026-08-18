class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.13.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.13.0-alpha/wrighty-0.13.0-alpha-osx-arm64.zip"
      sha256 "7a6565501e3c45f729e8538d0c9e2465434f54fe27da3950738df7bce82663f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.13.0-alpha/wrighty-0.13.0-alpha-linux-x64.zip"
      sha256 "82ee28c6fc034e7b1854628a37a69a4a7e3d283a2f915c9a7150a8cd5f32f778"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.13.0-alpha/wrighty-0.13.0-alpha-linux-arm64.zip"
      sha256 "91d4d19806c6d81a9d531e9d3618f98d34e13d646cca53242d634293a7b1f665"
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
