local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

local mason_nvim_dap_status, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not mason_nvim_dap_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"lua_ls",
		"rnix",
		"yamlls",
		"pyright",
		"rust_analyzer",
		"terraformls",
		"gopls",
		"kotlin_language_server",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint",
		"black",
		"isort",
		"tflint",
		"golangci-lint",
		"goimports",
		"ktlint",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

mason_nvim_dap.setup({
	ensure_installed = {
		"codelldb",
	},
})
