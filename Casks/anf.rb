cask "anf" do
  version "1.5.39"
  sha256 "d2e1589b7c0db25e9489438d49ee684517344acab65c8ec2d3e73be87c7efc2b"

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
