-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
--
-- For example, changing color scheme
config.color_scheme = "OneHalfDark"
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 16.0
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Navigator.nvim
local act = wezterm.action

local function isViProcess(pane)
	-- get_foreground_process_name On Linux, macOS and Windows,
	-- the process can be queried to determine this path. Other operating systems
	-- (notably, FreeBSD and other unix systems) are not currently supported
	-- return pane:get_foreground_process_name():find("n?vim") ~= nil
	-- return pane:get_title():find("n?vim") ~= nil
	local tty = pane:get_tty_name()
	if tty == nil then
		return false
	end

	local success, stdout, stderr = wezterm.run_child_process({
		"sh",
		"-c",
		"ps -o state= -o comm= -t"
			.. wezterm.shell_quote_arg(tty)
			.. " | "
			.. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'",
	})

	return success
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
	if isViProcess(pane) then
		window:perform_action(
			-- This should match the keybinds you set in Neovim.
			act.SendKey({ key = vim_direction, mods = "CTRL" }),
			pane
		)
	else
		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
	conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
	conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
	conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
	conditionalActivatePane(window, pane, "Down", "j")
end)

-- and finally, return the configuration to wezterm
config.keys = {
	{ key = "h", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-left") },
	{ key = "j", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-down") },
	{ key = "k", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-up") },
	{ key = "l", mods = "CTRL", action = act.EmitEvent("ActivatePaneDirection-right") },
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
