class Wrighty < Formula
  desc "Local-first work coordination for developers and coding agents"
  homepage "https://github.com/highbyte/wrighty"
  version "0.7.0-alpha"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.7.0-alpha/wrighty-0.7.0-alpha-osx-arm64.zip"
      sha256 "644022903f2d11d513abf156198faa6519c6b3bb01c349b6dcdbeb2435ab9747"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/highbyte/wrighty/releases/download/v0.7.0-alpha/wrighty-0.7.0-alpha-linux-x64.zip"
      sha256 "3b39da8ed1233534874b79732cc071a80a3b193b99855e7eae8155b02ace3a18"
    end
    on_arm do
      url "https://github.com/highbyte/wrighty/releases/download/v0.7.0-alpha/wrighty-0.7.0-alpha-linux-arm64.zip"
      sha256 "fc99fca5d689309486a711f5710fb7cf585731ef12f43ac8b132f4f2fb17f7cc"
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
