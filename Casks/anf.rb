cask "anf" do
  version "1.0.0"
  sha256 "e377309f9e64f707da9a5359be343ad61403d6c4b651b1827f6542ec5b9b4628"

  url "https://github.com/rescenedev/anf/releases/download/v#{version}/anf.zip"
  name "anf"
  desc "Fast native macOS file browser — all new finder"
  homepage "https://github.com/rescenedev/anf"

  app "anf.app"

  caveats <<~EOS
    anf is a self-signed build (not notarized). On first launch macOS Gatekeeper
    may block it. To allow it:
      • Right-click anf.app → Open, then confirm, or
      • System Settings → Privacy & Security → "Open Anyway".

    Optional tools for richer search:
      brew install fd ripgrep
  EOS

  zap trash: [
    "~/Library/Caches/anf",
    "~/.anf",
  ]
end
