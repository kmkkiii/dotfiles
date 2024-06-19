require 'format'
require 'status'

local wezterm = require 'wezterm';

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Mocha'

config.window_background_opacity = 0.75
config.macos_window_background_blur = 10

config.keys = require('keybinds').keys
config.key_tables = require('keybinds').key_tables
config.disable_default_key_bindings = true

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }

config.font = wezterm.font_with_fallback({
  { family = 'PlemolJP Console NF', weight = 'Medium' },
})
config.font_size = 15.0

config.status_update_interval = 1000

return config
