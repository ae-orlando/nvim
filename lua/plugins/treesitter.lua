-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Treesitter for better syntax highlighting and code understanding

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts = require("nvim-treesitter")
      local parsers = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "bash",
        "rust",
      }

      ts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      local treesitter_group = vim.api.nvim_create_augroup("NikaVimTreesitter", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = treesitter_group,
        pattern = parsers,
        callback = function(event)
          local ok, err = pcall(vim.treesitter.start, event.buf)
          if not ok then
            vim.notify("NikaVim Treesitter parser unavailable: " .. tostring(err), vim.log.levels.WARN)
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = treesitter_group,
        pattern = "TSUpdate",
        callback = function()
          for _, parser in ipairs(parsers) do
            if not vim.tbl_contains(ts.get_installed("parsers"), parser) then
              vim.notify("NikaVim Treesitter parser missing: " .. parser, vim.log.levels.WARN)
            end
          end
        end,
      })

    end,
  },

  -- Treesitter text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
        },
      })
    end,
  },

  -- Context aware comments
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
  },
}
