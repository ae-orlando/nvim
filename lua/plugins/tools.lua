return {
  -- REST client (VS Code REST Client equivalent)
  {
    "rest-nvim/rest.nvim",
    cmd = { "Rest", "RestRun" },
    keys = {
      { "<leader>Rt", "<cmd>Rest run<CR>", desc = "Run REST request", ft = "http" },
      { "<leader>Rl", "<cmd>Rest last<CR>", desc = "Re-run last request" },
      { "<leader>Rp", "<cmd>Rest preview<CR>", desc = "Preview cURL command" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("rest-nvim").setup({
        rocks = { enabled = false },
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
        highlight_private_parameters = true,
        highlight_request = true,
        result_splitter_always = false,
      })
    end,
  },

  -- Database explorer (VS Code SQLTools equivalent)
  {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI" },
    keys = {
      { "<leader>Dc", ":DB<CR>", desc = "DB prompt" },
      { "<leader>Dq", ":DB list tables<CR>", desc = "List tables" },
    },
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle" },
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<CR>", desc = "Toggle DB UI" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<CR>", desc = "Find buffer" },
    },
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_tmp_query_location = vim.fn.stdpath("data") .. "/db_ui_queries"
    end,
  },

  {
    "kristijanhusak/vim-dadbod-completion",
    event = "InsertEnter",
    dependencies = { "tpope/vim-dadbod" },
  },
}
