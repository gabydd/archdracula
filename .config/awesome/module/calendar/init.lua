local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
local colors = require('themes').colors
local dpi = require('beautiful').xresources.apply_dpi
local screen_geometry = require('awful').screen.focused().geometry
local format_item = require('library.format_item')
local dracula_icon = require('widget.dracula-icon')
local title_text = require('widget.calendar.calendar.title-text')
local cal_backward = require('widget.calendar.calendar.backward')
local cal_reset = require('widget.calendar.calendar.reset')
local cal_forward = require('widget.calendar.calendar.forward')
local to_do_title_text = require('widget.calendar.to-do.to-do-title-text')
local add_icon = require('widget.calendar.to-do.add-icon')
local calendar_widget = require('widget.calendar.calendar.calendar-widget')
local cal_to_do_panel = require('widget.calendar.to-do.to-do-panel')


--- Build and combine all widgets that go into right side panel
  -- Calendar title
  -- Calendar
  -- To do title
  -- To do

-- Variable for consistent width of panel
local width = dpi(410)

-- Build calendar title bar widget
local title = wibox.widget {
  {
    {
      spacing = dpi(0),
    	layout = wibox.layout.fixed.horizontal,
    	format_item(
    		{
    			layout = wibox.layout.fixed.horizontal,
    			spacing = dpi(16),
          dracula_icon,
          title_text,
    		}
      ),
      format_item(
    		{
    			layout = wibox.layout.fixed.horizontal,
    			spacing = dpi(3),
          cal_backward,
          cal_reset,
          cal_forward,
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
  forced_width = width,
  forced_height = 70,
  ontop = true,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

-- Buld to do title bar widget
local to_do_title = wibox.widget {
  {
    {
      spacing = dpi(75),
    	layout = wibox.layout.fixed.horizontal,
    	format_item(
        {
          layout = wibox.layout.fixed.horizontal,
          spacing = dpi(16),
          dracula_icon,
          to_do_title_text,
        }
      ),
      format_item(
        {
          layout = wibox.layout.fixed.horizontal,
          add_icon,
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
  forced_width = width,
  forced_height = 70,
  ontop = true,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

-- Build calendar widget
local calendar_panel = wibox.widget {
  {
      {
      spacing = dpi(0),
      layout = wibox.layout.flex.vertical,
      format_item(
    		{
    			layout = wibox.layout.fixed.vertical,
    			spacing = dpi(16),
          calendar_widget,
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
  forced_width = width,
  ontop = true,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

-- Build to do widget
local to_do_panel = wibox.widget {
  {
      {
      spacing = dpi(0),
    	layout = wibox.layout.flex.vertical,
    	format_item(
    		{
    			layout = wibox.layout.fixed.horizontal,
    			spacing = dpi(16),
          cal_to_do_panel,

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
  forced_width = width,
  ontop = true,
  border_width = dpi(2),
  border_color = colors.colorA,
  widget = wibox.container.background,
  layout,
}

-- Intialize panel wibox with dimensions
calendarPanel = wibox(
  {
    x = screen_geometry.width-width-dpi(8),
    y = screen_geometry.y+dpi(35),
    visible = false,
    ontop = true,
    screen = screen.primary,
    type = 'splash',
    height = screen_geometry.height-dpi(35),
    width = width,
    bg = 'transparent',
    fg = '#FEFEFE',
  }
)

-- Function to resize calendar when menu bar is hidden
awesome.connect_signal(
  "cal:resize",
  function()
    cc_height = screen_geometry.height
    if calendarPanel.height == screen_geometry.height-dpi(35) then
      calendarPanel:geometry{height = screen_geometry.height, y = screen_geometry.y+dpi(8)}
    elseif calendarPanel.height == screen_geometry.height then
      calendarPanel:geometry{height = screen_geometry.height-dpi(35), y = screen_geometry.y+dpi(35)}
    end
  end
)

-- Panel visibility status variable (necessary?)
_G.cal_status = false

-- Toggle panel visibility
awesome.connect_signal(
  "cal::center:toggle",
  function()
    if calendarPanel.visible == false then
      cal_status = true
      calendarPanel.visible = true
      reset_date()
    elseif calendarPanel.visible == true then
      cal_status = false
      calendarPanel.visible = false
    end
  end
)

awesome.connect_signal(
  "cal::center:toggle:off",
  function()
    calendarPanel.visible = false
  end
)

-- Build panel wibox
calendarPanel:setup {
  spacing = dpi(15),
  title,
  calendar_panel,
  to_do_title,
  to_do_panel,
  layout = wibox.layout.fixed.vertical,
}
