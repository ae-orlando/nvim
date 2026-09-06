-- ~/.config/nvim/lua/plugins/editing.lua
-- Editing utilities and enhancements

return {
  -- Easy comments
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
      })

      -- Integrate with nvim-cmp so pairs work after completions
      local ok, cmp = pcall(require, "nvim-autopairs.completion.cmp")
      if ok then
        cmp.on_confirm_done()
      end
    end,
  },

  -- Surround with brackets, quotes, etc.
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "BufReadPost",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Extend % motions (match-up)
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Undo tree visualization
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undo tree" },
    },
  },

  -- Better incremental search
  {
    "kevinhwang91/nvim-hlslens",
    keys = { { "/", desc = "Search" } },
    config = function()
      require("hlslens").setup()
    end,
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    event = "BufReadPost",
    dependencies = {
      "lewis6991/async.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({})
    end,
  },

  -- Multi-cursor (VS Code Ctrl+D / Alt+Click equivalent)
  {
    "mg979/vim-visual-multi",
    branch = "master",
    keys = {
      { "<leader>ma", mode = { "n", "x" }, desc = "Add cursor at word" },
      { "<leader>mn", mode = { "n", "x" }, desc = "Add cursor (skip next)" },
      { "<leader>mD", mode = { "n", "x" }, desc = "Add cursor down" },
      { "<leader>mU", mode = { "n", "x" }, desc = "Add cursor up" },
    },
    config = function()
      vim.g.VM_theme = "default"
      vim.g.VM_highlight_matches = "underline"
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<leader>mD",
        ["Add Cursor Up"] = "<leader>mU",
        ["Select Cursor Down"] = "<M-C-Down>",
        ["Select Cursor Up"] = "<M-C-Up>",
        ["Visual Cursors"] = "<leader>ma",
        ["Visual Add"] = "<leader>mn",
        ["Skip Region"] = "q",
        ["Remove Region"] = "Q",
      }
    end,
  },

  -- Smart text objects
  {
    "echasnovski/mini.ai",
    version = false,
    event = "BufReadPost",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
    end,
  },
}
