local awful = require('awful')
local gears = require('gears')
local icons = require('theme.icons')

local tags = {
  {
    icon = icons.chrome,
    type = 'chrome',
    defaultApp = 'google-chrome-beta',
    screen = 1
  },
  {
    icon = icons.code,
    type = 'code',
    defaultApp = 'code',
    screen = 1
  },
  {
    icon = icons.social,
    type = 'social',
    defaultApp = 'station',
    screen = 1
  },
  {
    icon = icons.folder,
    type = 'files',
    defaultApp = 'nautilus',
    screen = 1
  },
  {
    icon = icons.music,
    type = 'music',
    defaultApp = 'youtube-music',
    screen = 1
  },
  {
    icon = icons.game,
    type = 'game',
    defaultApp = '',
    screen = 1
  },
  {
    icon = icons.lab,
    type = 'any',
    defaultApp = '',
    screen = 1
  }
}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating,
  awful.layout.suit.max
}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i,
        {
          icon = tag.icon,
          icon_only = true,
          layout = awful.layout.suit.tile,
          gap_single_client = false,
          gap = 4,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1
        }
      )
    end
  end
)

_G.tag.connect_signal(
  'property::layout',
  function(t)
    local currentLayout = awful.tag.getproperty(t, 'layout')
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
