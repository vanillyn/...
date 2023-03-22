local wezterm = require("wezterm")

-- wezterm.on("window-resized", function(window, pane)
--     local window_dims = window:get_dimensions();
--     local overrides = window:get_config_overrides() or {}
--     local new_padding = {
--         left = math.floor((window_dims.pixel_width % 19) / 2),
--         right = 0,
--         top = math.floor((window_dims.pixel_height % 43) / 2),
--         bottom = 0
--     };
--     overrides.window_padding = new_padding
--     window:set_config_overrides(overrides)
-- end);

-- -- custom tab bar {{{
-- ---@diagnostic disable-next-line: unused-local
-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
--     local RIGHT_DIVIDER = utf8.char(0xe0bc)

--     local active_tab_index = 0
--     for _, t in ipairs(tabs) do
--         if t.is_active == true then
--             active_tab_index = t.tab_index
--         end
--     end

--     local active_bg = config.colors.tab_bar.active_tab.bg_color
--     local active_fg = config.colors.tab_bar.active_tab.fg_color
--     local inactive_bg = config.colors.tab_bar.inactive_tab.bg_color
--     local inactive_fg = config.colors.tab_bar.inactive_tab.fg_color
--     local new_tab_bg = config.colors.tab_bar.new_tab.bg_color

--     local s_bg, s_fg, e_bg, e_fg

--     -- the last tab
--     if tab.tab_index == #tabs - 1 then
--         if tab.is_active then
--             s_bg = active_bg
--             s_fg = active_fg
--             e_bg = new_tab_bg
--             e_fg = active_bg
--         else
--             s_bg = inactive_bg
--             s_fg = inactive_fg
--             e_bg = new_tab_bg
--             e_fg = inactive_bg
--         end
--     elseif tab.tab_index == active_tab_index - 1 then
--         s_bg = inactive_bg
--         s_fg = inactive_fg
--         e_bg = active_bg
--         e_fg = inactive_bg
--     elseif tab.is_active then
--         s_bg = active_bg
--         s_fg = active_fg
--         e_bg = inactive_bg
--         e_fg = active_bg
--     else
--         s_bg = inactive_bg
--         s_fg = inactive_fg
--         e_bg = inactive_bg
--         e_fg = inactive_bg
--     end
--     return {
--         { Background = { Color = s_bg } },
--         { Foreground = { Color = s_fg } },
--         { Text = " " .. tab.tab_index + 1 .. ": " .. tab.active_pane.title .. " " },
--         { Background = { Color = e_bg } },
--         { Foreground = { Color = e_fg } },
--         { Text = RIGHT_DIVIDER },
--     }
-- end)
-- -- }}}

local function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
        return "Catppuccin Mocha"
    else
        return "Catppuccin Latte"
    end
end

return {
    --keys
    -- keys = {
    --     {
    --         key = "c",
    --         mods = "CTRL",
    --         action = { CopyTo = "Clipboard" }
    --     },
    --     {
    --         key = "v",
    --         mods = "CTRL",
    --         action = { PasteFrom = "Clipboard" }
    --     }
    -- },
    -- font
    line_height = 1.2,
    font_size = 11,
    font = wezterm.font_with_fallback {
        {
            family = "SauceCodePro NFM",
            weight = "Bold"
        },
        {
            family = "SauceCodePro NFM",
            weight = "Regular",
            scale = 1.5
        },
        {
            family = "Segoe UI Emoji",
            scale = 1
        }
    },
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_max_width = 32,
    -- window
    window_decorations = "RESIZE",
    window_padding = {
        left = 16,
        right = 16,
        top = 0,
        bottom = 0
    },
    -- theme
    color_scheme = "Catppuccin Mocha",
    -- terminal
    default_prog = { "C:/Program Files/Git/usr/bin/zsh.exe", "-i", "-l" },
    default_cursor_style = "BlinkingBar",
    launch_menu = {
        {
            args = { "top" },
        },
        {
            label = "zsh",
            args = { "C:/Program Files/Git/usr/bin/zsh.exe", "-i", "-l" }
        },
        {
            label = "Powershell",
            args = { "powershell" }
        },
        {
            label = "Command",
            args = { "cmd" }
        }
    },
    -- nightly only
    clean_exit_codes = { 130 },
}