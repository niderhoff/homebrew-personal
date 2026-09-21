cask "discordo" do
  arch arm: "ARM64", intel: "X64"

  version :latest
  sha256 :no_check

  url "https://nightly.link/ayn2op/discordo/workflows/ci/main/discordo_macOS_#{arch}.zip",
      verified: "nightly.link/ayn2op/discordo/"
  name "Discordo"
  desc "Lightweight, secure, and feature-rich Discord terminal (TUI) client"
  homepage "https://github.com/ayn2op/discordo"

  binary "discordo"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}"]
  end
end
