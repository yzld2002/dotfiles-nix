local aerial_config, aerial = pcall(require, "aerial")
if not aerial_config then
	return
end

aerial.setup({
	backends = { "lsp" },
})
