local settings = require("settings")

local icons = {
	sf_symbols = {
		plus = "􀅼",
		loading = "􀖇",
		apple = "􀣺",
		gear = "􀍟",
		cpu = "􀫥",
		memory = "􀫦",
		disk = "􀤂",
		clipboard = "􀉄",

		switch = {
			on = "􁏮",
			off = "􁏯",
		},
		volume = {
			_100 = "􀊩",
			_66 = "􀊧",
			_33 = "􀊥",
			_10 = "􀊡",
			_0 = "􀊣",
		},
		battery = {
			_100 = "􀛨",
			_75 = "􀺸",
			_50 = "􀺶",
			_25 = "􀛩",
			_0 = "􀛪",
			charging = "􀢋",
		},
		wifi = {
			connected = "􀙇",
			disconnected = "􀙈",
		},
	},

	nerdfont = {
		plus = "\u{f067}",
		loading = "\u{f110}",
		apple = "\u{f179}",
		gear = "\u{f013}",
		cpu = "\u{f2db}",
		memory = "\u{f2db}",
		disk = "󰋊",
		clipboard = "Missing Icon",

		switch = {
			on = "󱨥",
			off = "󱨦",
		},
		volume = {
			_100 = "\u{f028}",
			_66 = "\u{f028}",
			_33 = "\u{f027}",
			_10 = "\u{f026}",
			_0 = "\u{f026}",
		},
		battery = {
			_100 = "\u{f240}",
			_75 = "\u{f241}",
			_50 = "\u{f242}",
			_25 = "\u{f243}",
			_0 = "\u{f244}",
			charging = "\u{f0e7}",
		},
		wifi = {
			connected = "󰖩",
			disconnected = "󰖪",
		},
		calendar = "󰸗",
		media = {
			back = "\u{f048}",
			forward = "\u{f051}",
			play_pause = "\u{f04b}",
			play = "\u{f04b}",
			pause = "\u{f04c}",
		},
	},
}

if not (settings.icons == "NerdFont") then
	return icons.sf_symbols
else
	return icons.nerdfont
end
