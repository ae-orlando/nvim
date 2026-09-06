return {
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "marilari88/neotest-vitest",
      "alfaix/neotest-gtest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          require("neotest-plenary"),
          require("neotest-vitest"),
          require("neotest-gtest"),
        },
        icons = {
          passed = "",
          failed = "",
          running = "",
          skipped = "",
          unknown = "",
        },
      })

      vim.keymap.set("n", "<leader>tr", function()
        require("neotest").run.run()
      end, { desc = "Run nearest test" })
      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end, { desc = "Run test file" })
      vim.keymap.set("n", "<leader>ta", function()
        require("neotest").run.run(vim.fn.getcwd())
      end, { desc = "Run all tests" })
      vim.keymap.set("n", "<leader>ts", function()
        require("neotest").summary.toggle()
      end, { desc = "Toggle test summary" })
      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open()
      end, { desc = "Open test output" })
    end,
  },
}
