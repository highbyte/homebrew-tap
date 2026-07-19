class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.3.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.3.0-alpha/wrighty-0.3.0-alpha-osx-arm64.zip"
      sha256 "96abb909d8f7ba060a9bbddcc10f2c7677af89ab5740d99ba797f78bfb2882d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.3.0-alpha/wrighty-0.3.0-alpha-linux-x64.zip"
      sha256 "df5707b8c52157731ef09355672d695ef83636032a7fe12852df624169f3a9c8"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.3.0-alpha/wrighty-0.3.0-alpha-linux-arm64.zip"
      sha256 "54ad67de08d6200ea098563a385fd6536fb2be2eb4e8269ec9bb883694b4489e"
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
