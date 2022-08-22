--DEPENDENCIES
	--pamixer
  --lm_sensors
  --free
  --upower

local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local colors = require('themes').colors
local dpi = require('beautiful').xresources.apply_dpi
local screen_geometry = require('awful').screen.focused().geometry
local format_item = require('library.format_item')
local ram_meter = require('widget.control-center.ram-meter')
local cpu_meter = require('widget.control-center.cpu-meter')
local hdd_meter = require('widget.control-center.hdd-meter')
local batt_meter = require('widget.control-center.battery-meter')
local volume_slider = require('widget.control-center.volume-slider')
local brightness_slider = require('widget.control-center.brightness-slider')
local bar_button = require('widget.control-center.bar-button')
local dnd = require('widget.control-center.do-not-disturb')
local vpn_button = require('widget.control-center.vpn-button')
local screen_capture = require('widget.control-center.screen-capture')
local mute_button = require('widget.control-center.mute-button')
local restart_awesome = require('widget.control-center.restart-awesome')
local dracula_icon = require('widget.dracula-icon')
local title_text = require('widget.control-center.title-text')


local dials = wibox.widget {
  {
      {
      spacing = dpi(0),
    	layout = wibox.layout.flex.horizontal,
    	format_item(
    		{
    			layout = wibox.layout.fixed.vertical,
    			spacing = dpi(10),
          ram_meter,
          cpu_meter,
    		}
    	),
      format_item(
    		{
    			layout = wibox.layout.fixed.vertical,
    			spacing = dpi(10),
          hdd_meter,
          batt_meter,
    		}
    	),
    },
    margins = dpi(5),
    widget = wibox.container.margin
  },
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius)
  end,
  bg = colors.alpha(colors.colorB, 'F2'),
  forced_width = 400,
  forced_height = 400,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

local sliders = wibox.widget {
  {
      {
      spacing = dpi(0),
    	layout = wibox.layout.flex.horizontal,
    	format_item(
    		{
    			layout = wibox.layout.fixed.vertical,
    			spacing = dpi(10),
          volume_slider,
          brightness_slider,
    		}
    	),
    },
    margins = dpi(5),
    widget = wibox.container.margin
  },
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius)
  end,
  bg = colors.alpha(colors.colorB, 'F2'),
  forced_width = 400,
  forced_height = 190,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

local buttons = wibox.widget {
  {
      {
      spacing = dpi(0),
    	layout = wibox.layout.flex.vertical,
    	format_item(
    		{
    			layout = wibox.layout.fixed.horizontal,
    			spacing = dpi(16),
          bar_button,
          dnd,
          vpn_button,
          screen_capture,
          mute_button,
          restart_awesome
    		}
    	),
    },
    margins = dpi(5),
    widget = wibox.container.margin
  },
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius)
  end,
  bg = colors.alpha(colors.colorB, 'F2'),
  forced_width = 400,
  forced_height = 70,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

local title = wibox.widget {
  {
      {
      spacing = dpi(0),
    	layout = wibox.layout.flex.vertical,
    	format_item(
    		{
    			layout = wibox.layout.fixed.horizontal,
    			spacing = dpi(16),
          dracula_icon,
          title_text,
    		}
    	),
    },
    margins = dpi(5),
    widget = wibox.container.margin
  },
  shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, beautiful.groups_radius)
  end,
  bg = colors.alpha(colors.colorB, 'F2'),
  forced_width = 400,
  forced_height = 70,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

awesome.connect_signal(
  "cc:toggle",
  function()
    cc_toggle()
  end
)

awesome.connect_signal(
  "cal:resize",
  function()
    cc_resize()
  end
)

local controlCenter = function(s)
  s.controlCenter = wibox(
    {
      x = s.geometry.x+dpi(8),
      y = s.geometry.y+dpi(35),
      visible = false,
      ontop = true,
      type = 'splash',
      height = s.geometry.height-dpi(35),
      width = dpi(400),
      bg = 'transparent',
      fg = '#FEFEFE',
    }
  )

  function cc_resize()
    cc_height = s.geometry.height
    if s.controlCenter.height == s.geometry.height-dpi(35) then
      s.controlCenter:geometry{height = s.geometry.height, y = s.geometry.y+dpi(8)}
    elseif s.controlCenter.height == s.geometry.height then
      s.controlCenter:geometry{height = s.geometry.height-dpi(35), y = s.geometry.y+dpi(35)}
    end
  end


  function cc_toggle()
    if awful.screen.focused().controlCenter.visible == false then
      awful.screen.focused().controlCenter.visible = true
    elseif awful.screen.focused().controlCenter.visible == true then
      awful.screen.focused().controlCenter.visible = false
    end
  end

  s.controlCenter:setup {
    {
      spacing = dpi(15),
      title,
      buttons,
      dials,
      sliders,
      layout = wibox.layout.fixed.vertical,
    },
    layout = wibox.layout.fixed.horizontal,
  }
  end

return controlCenter