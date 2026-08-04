cask "anf" do
  version "1.5.44"
  sha256 "fb774a02d00dec1258be2350591499b4733e6d4d600b39574b7310670a7c2c2b"

  url "https://github.com/rescenedev/anf/releases/download/v#{version}/anf.dmg"
  name "anf"
  desc "Fast native macOS file browser — all new finder"
  homepage "https://github.com/rescenedev/anf"

  depends_on :macos

  app "anf.app"

  zap trash: [
    "~/.anf",
    "~/Library/Caches/anf",
  ]

  # anf is signed with a Developer ID and notarized by Apple — Gatekeeper opens
  # it cleanly, so no quarantine workaround is needed.

  caveats <<~EOS
    Optional tools for richer search:
      brew install fd ripgrep
  EOS
end
