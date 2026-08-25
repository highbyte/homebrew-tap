class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.17.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.17.0-alpha/wrighty-0.17.0-alpha-osx-arm64.zip"
      sha256 "c83b33b4d34f476067b0a120eac88908449409eebf23c808dae440f97e5f26d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.17.0-alpha/wrighty-0.17.0-alpha-linux-x64.zip"
      sha256 "1e2ded0c30658ae314e1633525b8c226fbb378a2d3fa8810d3bc505c1d793562"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.17.0-alpha/wrighty-0.17.0-alpha-linux-arm64.zip"
      sha256 "2c18e64658d55496375b9cedb87b3d7529d2fba96da3b30e3a2b866b8534d7aa"
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
