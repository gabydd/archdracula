local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local clickable_container = require("widget.clickable-container")
local dpi = require("beautiful").xresources.apply_dpi
local icons = require("themes.icons")
local colors = require("themes").colors
local watch = require("awful.widget.watch")
local beautiful = require("beautiful")
local naughty = require("naughty")

local emptyCenter = require("widget.notification-center.empty")
local width = dpi(410)

local panelLayout = wibox.layout.fixed.vertical()

panelLayout.spacing = dpi(7)
panelLayout.forced_width = width

local resetDevicePanelLayout = function()
	panelLayout:reset(panelLayout)
end

local volumeDevicesAdded = function(n)
	local box = require("widget.volume-center.elements")
	panelLayout:insert(1, box.create(n.title, n.sinkNumText, n.sinkNum, n.isDefault))
end

awesome.connect_signal("volume::devices:refreshPanel", function()
	resetDevicePanelLayout()
	awful.spawn.with_line_callback([[bash -c "pactl list sinks short | egrep -o '^[0-9]+'"]], {
		stdout = function(line)
			awful.spawn.easy_async_with_shell(
				[[ bash -c "pactl list sinks | egrep '^Sink|Description' | grep -A 1 ]]
					.. line
					.. [[ | grep Description | sed -E 's/(^\\s+Description: )(.+)/\2/'"]],
				function(title)
					awful.spawn.easy_async_with_shell(
						[[bash -c "pactl list sinks short | grep " .. line .. " | rg -o '(^[0-9]+\\s+)([^\\s]+)(.+)' -r '$2'"]],
						function(name)
							awful.spawn.easy_async_with_shell([[bash -c "pactl get-default-sink"]], function(stdout)
								if name == stdout:gsub("\n", "") then
									volumeDevicesAdded({
										title = title,
										sinkNumText = "Sink " .. line,
										sinkNum = line,
										isDefault = true,
									})
								else
									volumeDevicesAdded({
										title = title,
										sinkNumText = "Sink " .. line,
										sinkNum = line,
										isDefault = false,
									})
								end
							end)
						end
					)
				end
			)
		end,
	})
end)

return panelLayout
