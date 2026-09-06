return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope-project.nvim" },
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", "pyproject.toml", "go.mod" },
      })

      require("telescope").load_extension("projects")

      vim.keymap.set("n", "<leader>pp", function()
        require("telescope.builtin").projects()
      end, { desc = "Find projects" })
    end,
  },
}
