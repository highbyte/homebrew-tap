class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.14.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.14.0-alpha/wrighty-0.14.0-alpha-osx-arm64.zip"
      sha256 "45e95327ec46c8a8c7b21a2261e854b32608a07832281b2100af4e6726d0a118"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.14.0-alpha/wrighty-0.14.0-alpha-linux-x64.zip"
      sha256 "aa9ed08b2b6cf14398f99f647eafe1b235a2907c5677563af3d020e402350702"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.14.0-alpha/wrighty-0.14.0-alpha-linux-arm64.zip"
      sha256 "cf1ffa80b5406b7a88d12fb88b883d086b236cbc7e84fa5728e1b5d042e2ecfd"
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
