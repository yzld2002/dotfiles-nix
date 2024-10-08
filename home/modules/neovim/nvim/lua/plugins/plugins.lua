return {
  {
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
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    opts = {
      lang = "kotlin",
    },
  },
  {
    "numToStr/Navigator.nvim",
    opts = {},
    keys = {
      { "<C-h>", mode = { "n", "t" }, "<CMD>NavigatorLeft<CR>" },
      { "<C-l>", mode = { "n", "t" }, "<CMD>NavigatorRight<CR>" },
      { "<C-k>", mode = { "n", "t" }, "<CMD>NavigatorUp<CR>" },
      { "<C-j>", mode = { "n", "t" }, "<CMD>NavigatorDown<CR>" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
    },
  },
}
