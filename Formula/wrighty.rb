class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.5.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.5.0-alpha/wrighty-0.5.0-alpha-osx-arm64.zip"
      sha256 "930f2a13c696daa6b047b1efc1ab893f6679b701ff906864bc80de053e50995c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.5.0-alpha/wrighty-0.5.0-alpha-linux-x64.zip"
      sha256 "9eb9ebc954e171e43765e19190aad8795a41aaed12d9a3f51bb29e25976bbf77"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.5.0-alpha/wrighty-0.5.0-alpha-linux-arm64.zip"
      sha256 "7f4814a18519968003746e89c5b46b59549b57149b12043864074f6a8cbdd41d"
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
