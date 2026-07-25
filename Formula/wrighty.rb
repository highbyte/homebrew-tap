class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.9.1-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.9.1-alpha/wrighty-0.9.1-alpha-osx-arm64.zip"
      sha256 "76509d080a4931fd0f6203498286b33997c729fa0082de9d2a39b263bc34e625"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.9.1-alpha/wrighty-0.9.1-alpha-linux-x64.zip"
      sha256 "156456442af0125ce9b1ff46aab4fbe8726a3b487a4d82594cca14fceecbcbc8"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.9.1-alpha/wrighty-0.9.1-alpha-linux-arm64.zip"
      sha256 "ed4c27a05ce90c58107d550080d6e0b12ff90559bc49322ba7334f10bac68219"
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
