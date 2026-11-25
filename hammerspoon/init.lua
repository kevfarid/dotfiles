-- Hammerspoon config (linked to ~/.hammerspoon by setup/symlinks.sh)

hs.autoLaunch(true)
hs.automaticallyCheckForUpdates(true)

-- ─────────────────────────────────────────────────────────────────────────────
-- Ghostty: Warp-style Cmd+V
--   clipboard has text  -> normal paste (Cmd+V)
--   clipboard has image -> send Ctrl+V so TUIs like Claude Code / Codex attach it
-- The hotkey is only active while Ghostty is frontmost.
-- ─────────────────────────────────────────────────────────────────────────────

local GHOSTTY = "com.mitchellh.ghostty"

local pasteHotkey
pasteHotkey = hs.hotkey.new({ "cmd" }, "v", function()
  local hasText = hs.pasteboard.readString() ~= nil
  local hasImage = hs.pasteboard.readImage() ~= nil

  pasteHotkey:disable()
  if hasImage and not hasText then
    hs.eventtap.keyStroke({ "ctrl" }, "v", 0)
  else
    hs.eventtap.keyStroke({ "cmd" }, "v", 0)
  end
  pasteHotkey:enable()
end)

local function syncHotkey(app)
  if app and app:bundleID() == GHOSTTY then
    pasteHotkey:enable()
  else
    pasteHotkey:disable()
  end
end

GhosttyWatcher = hs.application.watcher.new(function(_, event, app)
  if event == hs.application.watcher.activated then
    syncHotkey(app)
  end
end)
GhosttyWatcher:start()
syncHotkey(hs.application.frontmostApplication())

hs.alert.show("Hammerspoon loaded")
