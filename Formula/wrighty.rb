class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.5.1-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.5.1-alpha/wrighty-0.5.1-alpha-osx-arm64.zip"
      sha256 "8c6f13f17697103fe1d136ba4d33bda1656b6eb738077fb283d90793f43add3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.5.1-alpha/wrighty-0.5.1-alpha-linux-x64.zip"
      sha256 "a188dc3756b3dfc842ccac38f857444c577e9432da8e2121c81fafe009d31ea7"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.5.1-alpha/wrighty-0.5.1-alpha-linux-arm64.zip"
      sha256 "a129ae21d449c162fa7b53ea2b9cabf1ed8814020f724a7beb2292db5c944e08"
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
