cask "anf" do
  version "1.5.28"
  sha256 "901c3cf3c7ae95dab5a9b2c88edd05f7338b76d157e6fcc215d7c808f521ae63"

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
