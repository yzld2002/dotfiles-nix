vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x') -- not into clipboard

-- split related
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sh", "<C-w><C-h>")
keymap.set("n", "<leader>sl", "<C-w><C-l>")
keymap.set("n", "<leader>sj", "<C-w><C-j>")
keymap.set("n", "<leader>sk", "<C-w><C-k>")
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- tab related
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- buffer related
keymap.set("n", "<leader>bp", "<cmd>BufferPrevious<cr>")
keymap.set("n", "<leader>bn", "<cmd>BufferNext<cr>")
keymap.set("n", "<leader>b1", "<cmd>BufferGoto 1<cr>")
keymap.set("n", "<leader>b2", "<cmd>BufferGoto 2<cr>")
keymap.set("n", "<leader>b3", "<cmd>BufferGoto 3<cr>")
keymap.set("n", "<leader>b4", "<cmd>BufferGoto 4<cr>")
keymap.set("n", "<leader>b5", "<cmd>BufferGoto 5<cr>")
keymap.set("n", "<leader>b6", "<cmd>BufferGoto 6<cr>")
keymap.set("n", "<leader>b7", "<cmd>BufferGoto 7<cr>")
keymap.set("n", "<leader>b8", "<cmd>BufferGoto 8<cr>")
keymap.set("n", "<leader>b9", "<cmd>BufferGoto 9<cr>")
keymap.set("n", "<leader>b0", "<cmd>BufferGoto 0<cr>")
keymap.set("n", "<leader>bc", "<cmd>BufferClose<cr>")
keymap.set("n", "<leader>bv", "<cmd>BufferPick<cr>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- symbols-outline
keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fe", "<cmd>Telescope lsp_references<cr>")
keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope live_grep_args<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>") -- resume the last search query

-- git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR><cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>gx", "<cmd>GitBlameToggle<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>gf", "<cmd>GitBlameOpenFileURL<cr>")
keymap.set("n", "<leader>gu", "<cmd>GitBlameOpenCommitURL<cr>")

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>")

-- toggleterm
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>")

-- nvim test
keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>")
keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>")
keymap.set("n", "<leader>te", "<cmd>TestEdit<cr>")
