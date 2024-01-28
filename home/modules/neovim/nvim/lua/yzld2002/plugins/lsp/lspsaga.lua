local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
  symbol_in_winbar = {
    enable = true,
  },
})
