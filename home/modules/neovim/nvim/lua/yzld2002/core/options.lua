vim.loader.enable()
local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- - inside word
opt.iskeyword:append("-")

-- git blame off by default
vim.g.gitblame_enabled = 0

-- fold
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- -- zR to open all folds in a file
-- local vim = vim
-- local api = vim.api
-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
-- 	for group_name, definition in pairs(definitions) do
-- 		api.nvim_command("augroup " .. group_name)
-- 		api.nvim_command("autocmd!")
-- 		for _, def in ipairs(definition) do
-- 			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
-- 			api.nvim_command(command)
-- 		end
-- 		api.nvim_command("augroup END")
-- 	end
-- end
--
-- local autoCommands = {
-- 	-- other autocommands
-- 	open_folds = {
-- 		{ "BufReadPost,FileReadPost", "*", "normal zR" },
-- 	},
-- }
--
-- M.nvim_create_augroups(autoCommands)
