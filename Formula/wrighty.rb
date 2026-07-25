class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.8.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.8.0-alpha/wrighty-0.8.0-alpha-osx-arm64.zip"
      sha256 "59368c2bf09151177412e59f7d7680ab53a1eb3ef8b4075a0ce220d5283c7d66"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.8.0-alpha/wrighty-0.8.0-alpha-linux-x64.zip"
      sha256 "5e786e9937c31d750905059d01b7a2b1956e3229b04d76ff0a50bd173f552c6c"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.8.0-alpha/wrighty-0.8.0-alpha-linux-arm64.zip"
      sha256 "d9f945d30bebb0ab7896264a29ea9f1abec9499670f50cf891b438248007fd31"
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
