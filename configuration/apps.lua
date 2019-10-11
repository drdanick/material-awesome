local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'alacritty',
    editor = 'code',
    rofi = 'rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi',
    lock = 'i3lock-fancy-rapid 5 3 -k --timecolor=ffffffff --datecolor=ffffffff',
    quake = 'alacritty --title QuakeTerminal'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    '~/.setkbdmode.sh', -- My keyboard mode needs to be set to unicode (which this script does). This line can be removed by most people.
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'parcellite', -- Needed for an actually functional clipboard
    'xscreensaver -no-splash', -- The bouncing cows screensaver is a good one. 10/10
    'blueberry-tray', -- Bluetooth tray icon
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(keychain --eval)' -- credential manager
  }
}
