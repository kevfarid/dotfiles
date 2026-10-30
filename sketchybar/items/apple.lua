local colors = require("colors")
local icons = require("icons")

-- Ported from the upstream apple.lua: it defaults to an image asset
-- (assets/diamondRed.png) tuned for the gojo theme. We use the icon glyph
-- variant instead (present but commented out upstream) so it follows
-- colors.accent for whichever theme is active.
sbar.add("item", "apple.logo", {
	position = "left",
	icon = {
		y_offset = 1,
		font = { size = 18.0 },
		color = colors.accent,
		string = icons.apple,
	},
	label = { drawing = false },
	padding_left = 10,
	padding_right = 5,
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
})

sbar.add("item", {
	position = "left",
	width = 10,
	icon = {
		string = "|",
		font = { size = 16.0 },
		y_offset = 1,
		color = colors.with_alpha(colors.white, 0.3),
	},
})
