return {
  -- Zen mode: distraction-free coding
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen mode" },
    },
    dependencies = { "folke/twilight.nvim" },
    opts = {
      window = {
        width = 0.85,
        height = 0.95,
        options = {
          signcolumn = "no",
          number = true,
          relativenumber = true,
          cursorline = true,
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
        },
      },
      plugins = {
        options = { enabled = true },
        twilight = { enabled = true },
        gitsigns = { enabled = true },
        tmux = { enabled = true },
        kitty = { enabled = true },
        alacritty = { enabled = false },
      },
    },
  },

  -- Twilight: dim inactive code areas
  {
    "folke/twilight.nvim",
    keys = {
      { "<leader>zt", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = true,
      },
      context = 10,
      treesitter = true,
    },
  },

  -- Colorizer: highlight color codes inline
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      local flatten = vim.tbl_flatten
      if vim.iter then
        vim.tbl_flatten = function(value)
          return vim.iter(value):flatten(math.huge):totable()
        end
      end

      require("colorizer").setup({
        "*",
        css = { css = true },
        html = { mode = "foreground" },
      })

      vim.tbl_flatten = flatten
    end,
  },
}
