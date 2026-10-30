-- Add the SbarLua module to the package cpath
package.cpath = package.cpath .. ";/Users/" .. os.getenv("USER") .. "/.local/share/sketchybar_lua/?.so"

-- Builds helpers/menus (native Apple-menu popup, used by items/apple.lua) and
-- helpers/event_providers/network_load (unused by any widget currently, kept
-- for parity with upstream). Requires Xcode Command Line Tools (clang).
os.execute("(cd helpers && make)")
