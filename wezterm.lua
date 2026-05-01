-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
config.color_scheme = "Solarized Dark (Gogh)"
config.window_background_opacity = 0.95

-- Set TERM to enable undercurl and other advanced features
config.term = "wezterm"

-- Remove window decorations for zen mode
config.window_decorations = "NONE"

-- Remove padding for immersive feel
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- keybindings
config.keys = {}

-- Bind a key to toggle fullscreen
config.keys = {
	{ key = "F11", action = wezterm.action.ToggleFullScreen },
}

-- Bind Alt+1 through Alt+9 to switch to tabs 1-9
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

-- Scroll by lines instead of OS-reported delta (which can be page-sized)
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(-3),
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByLine(3),
	},
}

-- https://github.com/can1357/oh-my-pi#terminal-setup
config.enable_kitty_keyboard = true

return config
