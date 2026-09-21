cask "notesoverlay" do
  version "1.2.2"
  sha256 "525de703774db1dd504551322e8b7729c2ab79925e7d8502b1a571bd5af3c2c7"

  url "https://github.com/niderhoff/notesoverlay/releases/download/v#{version}/NotesOverlay-#{version}.zip"
  name "NotesOverlay"
  desc "Floating Markdown scratchpad with a global hotkey"
  homepage "https://github.com/niderhoff/notesoverlay"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "NotesOverlay.app"

  # Ad-hoc signed (no Developer ID): drop the quarantine flag so Gatekeeper lets it run.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/NotesOverlay.app"]
  end

  uninstall quit: "com.niid.NotesOverlay"

  zap trash: "~/Library/Preferences/com.niid.NotesOverlay.plist"
end
