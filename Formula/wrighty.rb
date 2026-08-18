class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.12.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.12.0-alpha/wrighty-0.12.0-alpha-osx-arm64.zip"
      sha256 "7c3f276bd42f34d4617898925fd34c35325aa0c935f8bb77d34528e1802afbe6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.12.0-alpha/wrighty-0.12.0-alpha-linux-x64.zip"
      sha256 "c2be546a265d92f4910e6c0bb7b26745fc8e47fbcc4203877f611e65cefc86e8"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.12.0-alpha/wrighty-0.12.0-alpha-linux-arm64.zip"
      sha256 "962b3b2af02c7799223b4e90d5854a3abf199b8ddc79d83224bb94a28dbbb78c"
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
