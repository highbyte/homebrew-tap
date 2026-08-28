class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.18.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.18.0-alpha/wrighty-0.18.0-alpha-osx-arm64.zip"
      sha256 "fd04a87f34aa5e21d710638d3e03ec8bcd48f8402634251ff5c9a1f08fc6e8bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.18.0-alpha/wrighty-0.18.0-alpha-linux-x64.zip"
      sha256 "978cafadc48b79f0faab132eaf4f4e912530ca71230aa90edbc5f6de15b37b00"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.18.0-alpha/wrighty-0.18.0-alpha-linux-arm64.zip"
      sha256 "eab9dd477bbad0df56e3d4226a7566ba793459417d68b607bb0a99db710cd4a3"
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
