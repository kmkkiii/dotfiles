local wezterm = require 'wezterm';
local act = wezterm.action;
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
  { family = 'PlemolJP Console NF', weight = 'Medium' },
})
config.font_size = 16.0

config.color_scheme = 'Catppuccin Mocha'

config.use_ime = true

config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}

config.window_background_opacity = 0.75
config.macos_window_background_blur = 10

config.keys = {
  -- Screen
  {
    key = 'f',
    mods = 'CMD|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Close Pane
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Select Pane
  {
    key = '[',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Prev'
  },
  {
    key = ']',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Next'
  },
  -- Split Window
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'D',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'ALT',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
}

return config
