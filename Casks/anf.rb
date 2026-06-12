cask "anf" do
  version "0.6.0"
  sha256 "e89281fc318539d98e182e95c299184b6114813e452b33853a6c208b62c5cd6f"

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
