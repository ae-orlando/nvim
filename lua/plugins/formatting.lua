-- ~/.config/nvim/lua/plugins/formatting.lua
-- Code formatting and linting

return {
  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          markdown = { "prettier" },
          yaml = { "prettier" },
        },
        format_on_save = function()
          if not vim.g.autoformat_enabled then
            return
          end

          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end,
      })

      vim.keymap.set({ "n", "v" }, "<leader>fp", function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end, { desc = "Format code" })
    end,
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        python = { "pylint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        markdown = { "markdownlint" },
        lua = { "luacheck" },
      }

      local linter_commands = {
        pylint = "pylint",
        eslint_d = "eslint_d",
        markdownlint = "markdownlint",
        luacheck = "luacheck",
      }

      local function try_lint()
        for _, linter_name in ipairs(lint.linters_by_ft[vim.bo.filetype] or {}) do
          local command = linter_commands[linter_name]
          if command and vim.fn.executable(command) ~= 1 then
            return
          end
        end

        lint.try_lint()
      end

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        callback = function()
          try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>fl", function()
        try_lint()
      end, { desc = "Lint file" })
    end,
  },
}
