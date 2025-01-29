-- It need to be named ".weztern.lua" to be detected as the config file
-- of wezterm.

local wezterm = require "wezterm"
local config = wezterm.config_builder()

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })

return {
	macos_window_background_blur = 20,
	window_background_opacity = 0.8,
	use_fancy_tab_bar = false,
	font_size = 16.0,
	tab_bar_at_bottom = true,
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
}
