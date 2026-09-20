cask "notesoverlay" do
  version "1.2.0"
  sha256 "a8ef07aac258f11c1c71e8f662f5ff20de1d28660ff22c89349b8178235f06a2"

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
