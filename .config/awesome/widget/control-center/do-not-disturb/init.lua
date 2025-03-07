local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local clickable_container = require("widget.clickable-container")
local dpi = require("beautiful").xresources.apply_dpi
local icons = require("themes.icons")
local colors = require("themes").colors
local watch = require("awful.widget.watch")

local widget_icon = wibox.widget({
	layout = wibox.layout.align.vertical,
	expand = "none",
	nil,
	{
		id = "icon",
		image = icons.moon,
		resize = true,
		widget = wibox.widget.imagebox,
	},
	nil,
})

local widget = wibox.widget({
	{
		{
			{
				widget_icon,
				layout = wibox.layout.fixed.horizontal,
			},
			margins = dpi(15),
			widget = wibox.container.margin,
		},
		forced_height = dpi(50),
		widget = clickable_container,
	},
	shape = gears.shape.circle,
	bg = colors.colorA,
	widget = wibox.container.background,
})

_G.dnd_status = false

widget:buttons(gears.table.join(awful.button({}, 1, nil, function()
	if dnd_status == true then
		dnd_status = false
		widget.bg = colors.colorA
	elseif dnd_status == false then
		dnd_status = true
		widget.bg = colors.color2
	end
end)))

return widget
