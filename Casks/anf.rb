cask "anf" do
  version "1.5.11"
  sha256 "e458df005972c26fc933459c09842b6e825db00add00aeb4181135751696985b"

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
