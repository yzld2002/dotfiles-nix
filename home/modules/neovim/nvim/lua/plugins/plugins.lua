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
  {
    "linrongbin16/gitlinker.nvim",
    opts = {
      config = function()
        require("gitlinker").setup()
      end,
    },
    keys = {
      {
        "<leader>gy",
        "<cmd>GitLink<cr>",
        silent = true,
        noremap = true,
        desc = "Copy git permlink to clipboard",
        mode = { "n", "v" },
      },
      {
        "<leader>gY",
        "<cmd>GitLink!<cr>",
        silent = true,
        noremap = true,
        desc = "Open git permlink in browser",
        mode = { "n", "v" },
      },
      {
        "<leader>gb",
        "<cmd>GitLink blame<cr>",
        silent = true,
        noremap = true,
        desc = "Copy git blame link to clipboard",
        mode = { "n", "v" },
      },
      {
        "<leader>gB",
        "<cmd>GitLink! blame<cr>",
        silent = true,
        noremap = true,
        desc = "Open git blame link in browser",
        mode = { "n", "v" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
