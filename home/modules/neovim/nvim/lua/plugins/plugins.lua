return {
  "folke/flash.nvim",
  keys = {
    -- disable the default flash keymap
    { "s", mode = { "n", "x", "o" }, false },
    {
      "r",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
  },
}
