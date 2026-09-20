cask "notesoverlay" do
  version "1.2.1"
  sha256 "3fecd98a453d1ce336567bfc48918ae3834db162d98cbd2bb0a6255ce8ea7512"

  url "https://github.com/niderhoff/notesoverlay/releases/download/v#{version}/NotesOverlay-#{version}.zip"
  name "NotesOverlay"
  desc "Floating Markdown scratchpad with a global hotkey"
  homepage "https://github.com/niderhoff/notesoverlay"

  depends_on macos: :sonoma

  app "NotesOverlay.app"

  # Ad-hoc signed (no Developer ID): drop the quarantine flag so Gatekeeper lets it run.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/NotesOverlay.app"]
  end

  uninstall quit: "com.niid.NotesOverlay"

  zap trash: "~/Library/Preferences/com.niid.NotesOverlay.plist"
end
