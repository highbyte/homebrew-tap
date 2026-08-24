class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.16.0-alpha.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.16.0-alpha.2/wrighty-0.16.0-alpha.2-osx-arm64.zip"
      sha256 "3443c9e06cb30845f042e8cdd922d06ebbb9ccd76b41a1834d20622796543d00"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.16.0-alpha.2/wrighty-0.16.0-alpha.2-linux-x64.zip"
      sha256 "7c9fbe69413d4e1c21bd376db2ea3dab88c405a29c7659ac89b9bd8fd10fd4e3"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.16.0-alpha.2/wrighty-0.16.0-alpha.2-linux-arm64.zip"
      sha256 "0e80c008386d80a020dd35c097ea12ff593fd837b56549240ae97fd27e6a1bcf"
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
