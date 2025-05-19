local wezterm = require("wezterm")
local config = wezterm.config_builder()
local is_mac = wezterm.target_triple:find("darwin") ~= nil
-- local color_scheme = "OneHalfDark"
local color_scheme = "tokyonight_storm"
-- local color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = (is_mac and 15.0 or 13.0)

config.colors = wezterm.color.get_builtin_schemes()[color_scheme]

config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_padding = {
    left = 8,
    right = 8,
    top = 10,
    bottom = 8,
}

config.window_frame = {
  border_top_height = '0.25cell',
}

config.initial_rows = 30
config.initial_cols = 100

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.integrated_title_button_alignment = "Left"
config.integrated_title_buttons = { "Close", "Hide", "Maximize" }

config.tab_bar_style = {
  new_tab = " " .. wezterm.nerdfonts.fa_plus_square_o .. " ",
  new_tab_hover = " " .. wezterm.nerdfonts.fa_plus_square .. " ",
  window_maximize = wezterm.format {
    { Foreground = { Color = "#a6da95" } },
    { Text = " " .. wezterm.nerdfonts.fa_circle }
  },
  window_maximize_hover = wezterm.format {
    { Foreground = { Color = "#c3e88d" } },
    { Text = " " .. wezterm.nerdfonts.fa_plus_circle }
  },
  window_hide = wezterm.format {
    { Foreground = { Color = "#f5a97f" } },
    { Text = " " .. wezterm.nerdfonts.fa_circle }
  },
  window_hide_hover = wezterm.format {
    { Foreground = { Color = "#ffc777" } },
    { Text = " " .. wezterm.nerdfonts.fa_minus_circle }
  },
  window_close = wezterm.format {
    { Foreground = { Color = "#f38ba8" } },
    { Text = " " .. wezterm.nerdfonts.fa_circle }
    -- { Text = " " .. wezterm.nerdfonts.ple_left_half_circle_thick .. wezterm.nerdfonts.ple_right_half_circle_thick}
  },
  window_close_hover = wezterm.format {
    { Foreground = { Color = "#eba0ac" } },
    { Text = " " .. wezterm.nerdfonts.md_stop_circle }
  }
}

config.enable_kitty_keyboard = true

if is_mac then
  config.ui_key_cap_rendering = "AppleSymbols"
  config.window_background_opacity = 0.95
  config.macos_window_background_blur = 30
end

config.keys = {
  {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = '/',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"},
  },
  {
    key = '"',
    mods = 'CMD',
    action = wezterm.action.SplitVertical{domain="CurrentPaneDomain"},
  },
}

local tab_title = function(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
  local tab_bar_background = config.colors.tab_bar.background
  local edge_background = config.colors.tab_bar.active_tab.bg_color
  local edge_foreground = config.colors.tab_bar.inactive_tab.bg_color
  local background = config.colors.tab_bar.inactive_tab_edge
  local foreground = config.colors.foreground

  if tab.is_active then
    edge_background = config.colors.compose_cursor
    edge_foreground = config.colors.tab_bar.active_tab.fg_color
  end

  local title = tab_title(tab)
  title = wezterm.truncate_right(title, max_width - 6)

  return {
    { Background = { Color = tab_bar_background } },
    { Foreground = { Color = background } },
    { Text = not is_mac and tab.tab_index == 0 and " " or "" },
    -- { Text = wezterm.nerdfonts.ple_lower_right_triangle },
    { Text = wezterm.nerdfonts.ple_left_half_circle_thick },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title .. " " },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = " " .. tostring(tab.tab_index) },
    { Background = { Color = tab_bar_background } },
    { Foreground = { Color = edge_background } },
    { Text = wezterm.nerdfonts.ple_right_half_circle_thick },
    -- { Text = wezterm.nerdfonts.ple_upper_left_triangle },
    { Text = " " },
  }
end)

return config
