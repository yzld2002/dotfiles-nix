local setup, nvimtest = pcall(require, "nvim-test")
if not setup then
	return
end

nvimtest.setup({
	term = "toggleterm",
	runners = {
		javascriptreact = "nvim-test.runners.jest",
		javascript = "nvim-test.runners.jest",
	},
})

require("nvim-test.runners.jest"):setup({
	command = "./node_modules/.bin/jest", -- a command to run the test runner
	args = { "--detectOpenHandles" }, -- default arguments
	env = { NODE_CONFIG_ENV = "test", TZ = "UTC" }, -- custom environment variables

	file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$", -- determine whether a file is a testfile
	find_files = { "__tests__/{name}.test.{ext}", "{name}.spec.{ext}" }, -- find testfile for a file

	filename_modifier = nil, -- modify filename before tests run (:h filename-modifiers)
	working_directory = nil, -- set working directory (cwd by default)
})
