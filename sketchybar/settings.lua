local colors = require("colors")

return {
	paddings = 3,
	group_paddings = 5,

	icons = "NerdFont", -- alternatively available: sf-symbols

	font = require("helpers.default_font"),

	widget_bracket_bg = {
		color = colors.transparent,
		border_width = 0,
		corner_radius = 32,
		height = 32,
	},
}
