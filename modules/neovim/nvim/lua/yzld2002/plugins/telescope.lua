-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.smart_add_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				["<C-d>"] = actions.delete_buffer, -- delete buffer
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

if jit.os == "OSX" then
	telescope.load_extension("fzf")
end
telescope.load_extension("aerial")
telescope.load_extension("live_grep_args")
