class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.6.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.6.0-alpha/wrighty-0.6.0-alpha-osx-arm64.zip"
      sha256 "fefdeffc966a05a04418af95f5bf0c8b5b9afb51575f993fdf2a53b6988d7984"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.6.0-alpha/wrighty-0.6.0-alpha-linux-x64.zip"
      sha256 "840fbe5347383f03b9bd6af23d8ec853f065c9ec489f7eb12d760e2750d895bf"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.6.0-alpha/wrighty-0.6.0-alpha-linux-arm64.zip"
      sha256 "97ee6a129873f4202058b41289cfef67f509133b700913b43500cf56dd1f295f"
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
