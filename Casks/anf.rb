cask "anf" do
  version "1.5.25"
  sha256 "ca5114dbb8f3d01701da7944162ae56b8c326ba8055c22c32f86b16a7ed25111"

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
