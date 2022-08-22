-- Icons directory
local colors = require("themes").colors
local dir = "themes.icons.strings."

return {
	add = require(dir .. "add"):gsub("#ffffff", colors.icons),
	awesome = require(dir .. "awesome"):gsub("#ffffff", colors.icons),
	backward = require(dir .. "left-arrow"):gsub("#ffffff", colors.icons),
	batt_charging = require(dir .. "battery-charging"):gsub("#ffffff", colors.icons),
	batt_0 = require(dir .. "battery-0"):gsub("#ffffff", colors.icons),
	batt_1 = require(dir .. "battery-2"):gsub("#ffffff", colors.icons),
	batt_2 = require(dir .. "battery-2"):gsub("#ffffff", colors.icons),
	batt_3 = require(dir .. "battery-3"):gsub("#ffffff", colors.icons),
	batt_4 = require(dir .. "battery-4"):gsub("#ffffff", colors.icons),
	bluetooth_off = require(dir .. "bluetooth-off"):gsub("#ffffff", colors.icons),
	bluetooth_on = require(dir .. "bluetooth-on"):gsub("#ffffff", colors.icons),
	chain = require(dir .. "chain"):gsub("#ffffff", colors.icons),
	chain_broken = require(dir .. "chain-broken"):gsub("#ffffff", colors.icons),
	clearNotifications = require(dir .. "double-check"):gsub("#ffffff", colors.icons),
	clearNotificationIndividual = require(dir .. "check"):gsub("#ffffff", colors.icons),
	devices = require(dir .. "devices"):gsub("#ffffff", colors.icons),
	dot = require(dir .. "dot"):gsub("#ffffff", colors.icons),
	dracula = require(dir .. "dracula"):gsub("#ffffff", colors.icons),
	forward = require(dir .. "right-arrow"):gsub("#ffffff", colors.icons),
	headphones = require(dir .. "headphones"):gsub("#ffffff", colors.icons),
	lock = require(dir .. "lock"):gsub("#ffffff", colors.icons),
	logout = require(dir .. "logout"):gsub("#ffffff", colors.icons),
	moon = require(dir .. "moon"):gsub("#ffffff", colors.icons),
	mute = require(dir .. "volume-mute"):gsub("#ffffff", colors.icons),
	noNotificationsFilled = require(dir .. "no-notifs-fill"):gsub("#ffffff", colors.icons),
	noNotifications = require(dir .. "no-notifs"):gsub("#ffffff", colors.icons),
	notificationsFilled = require(dir .. "notifs-fill"):gsub("#ffffff", colors.icons),
	notifications = require(dir .. "notifs"):gsub("#ffffff", colors.icons),
	power = require(dir .. "power"):gsub("#ffffff", colors.icons),
	reset = require(dir .. "restart"):gsub("#ffffff", colors.icons),
	restart = require(dir .. "restart"):gsub("#ffffff", colors.icons),
	search = require(dir .. "search"):gsub("#ffffff", colors.icons),
	shield = require(dir .. "shield"):gsub("#ffffff", colors.icons),
	shield_off = require(dir .. "shield-off"):gsub("#ffffff", colors.icons),
	ship_wheel = require(dir .. "ship-wheel"):gsub("#ffffff", colors.icons),
	sleep = require(dir .. "power-sleep"):gsub("#ffffff", colors.icons),
	toDo = require(dir .. "circle"):gsub("#ffffff", colors.icons),
	toDoDone = require(dir .. "check-circle"):gsub("#ffffff", colors.icons),
	volume = require(dir .. "volume-high"):gsub("#ffffff", colors.icons),
	wifi_3 = require(dir .. "wifi-3"):gsub("#ffffff", colors.icons),
	wifi_2 = require(dir .. "wifi-2"):gsub("#ffffff", colors.icons),
	wifi_1 = require(dir .. "wifi-1"):gsub("#ffffff", colors.icons),
	wifi_0 = require(dir .. "wifi-0"):gsub("#ffffff", colors.icons),
	wifi_off = require(dir .. "wifi-off"):gsub("#ffffff", colors.icons),
	wifi_problem = require(dir .. "wifi-problem"):gsub("#ffffff", colors.icons),
}
