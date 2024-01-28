local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		theme = "onedark",
	},
	sections = {
		lualine_c = {
			"lsp_progress",
		},
	},
})
