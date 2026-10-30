local colors = require("colors")

-- LAYOUT_FULL = true draws one opaque bar canvas spanning the screen.
-- false leaves the canvas transparent so only the item pills (bracket.left/
-- media/right, colored via colors.lua) are visible, floating over the
-- desktop — that's the pill look this config is going for.
LAYOUT_FULL = true

sbar.bar({
	topmost = "window",
	height = 32,
	color = LAYOUT_FULL and colors.bar.bg or colors.transparent,
	border_color = colors.bar.border,
	border_width = 0,
	shadow = LAYOUT_FULL,
	position = "top",
	sticky = true,
	padding_right = 0,
	padding_left = 0,
	y_offset = LAYOUT_FULL and 8 or 6,
	margin = 128,
	blur_radius = 0,
	corner_radius = LAYOUT_FULL and 8 or 0,
	notch_width = 200,
})
