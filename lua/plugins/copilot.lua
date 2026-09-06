return {
  {
    "github/copilot.vim",
    cond = function()
      return vim.env.NIKAVIM_ENABLE_AI == "1"
    end,
    event = "InsertEnter",
    config = function()
      vim.g.copilot_enabled = true
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<M-l>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true, desc = "Accept copilot suggestion" })
      vim.g.copilot_assume_mapped = true
    end,
  },
}
