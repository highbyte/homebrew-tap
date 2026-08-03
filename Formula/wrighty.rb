class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.10.4-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.10.4-alpha/wrighty-0.10.4-alpha-osx-arm64.zip"
      sha256 "b45ac541b178723bb98271e3291bc70953c51bc86c3359711f65e9699fef171a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.10.4-alpha/wrighty-0.10.4-alpha-linux-x64.zip"
      sha256 "603764e9995dcc4680d561c7245dfae9baeffe2563504966a70d848d19527efe"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.10.4-alpha/wrighty-0.10.4-alpha-linux-arm64.zip"
      sha256 "dc1851c953a9aab29ea972ecbc55e1bc5bf67334516df5bf2aca9daccb494188"
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
