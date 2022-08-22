local beautiful = require("beautiful")
local settings = require("settings")

beautiful.init("/home/gaby/.config/awesome/themes/theme.lua")

return {
	colors = require("themes.schemes." .. settings.theme),
}
