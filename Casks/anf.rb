cask "anf" do
  version "1.0.5"
  sha256 "865d54f27d1b76ae372b786c2356602fe4249ec188ce6528814ba40c099c3b86"

  url "https://github.com/rescenedev/anf/releases/download/v#{version}/anf.zip"
  name "anf"
  desc "Fast native macOS file browser — all new finder"
  homepage "https://github.com/rescenedev/anf"

  app "anf.app"

  # Self-signed (not notarized): strip the quarantine flag so Gatekeeper doesn't
  # block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/anf.app"]
  end

  caveats <<~EOS
    anf is a self-signed build (not notarized). The cask strips the quarantine
    flag automatically, but if macOS still blocks it on first launch:
      • Right-click anf.app → Open, then confirm, or
      • Run: xattr -dr com.apple.quarantine /Applications/anf.app

    Optional tools for richer search:
      brew install fd ripgrep
  EOS

  zap trash: [
    "~/Library/Caches/anf",
    "~/.anf",
  ]
end
