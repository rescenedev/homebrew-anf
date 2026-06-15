cask "anf" do
  version "1.5.10"
  sha256 "87817fc45f4658804033f4c5773e59d3b3b5c86321e18535857aba903d06db78"

  url "https://github.com/rescenedev/anf/releases/download/v#{version}/anf.zip"
  name "anf"
  desc "Fast native macOS file browser — all new finder"
  homepage "https://github.com/rescenedev/anf"

  app "anf.app"

  # anf is signed with a Developer ID and notarized by Apple — Gatekeeper opens
  # it cleanly, so no quarantine workaround is needed.

  caveats <<~EOS
    Optional tools for richer search:
      brew install fd ripgrep
  EOS

  zap trash: [
    "~/Library/Caches/anf",
    "~/.anf",
  ]
end
