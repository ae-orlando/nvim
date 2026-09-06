return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = function()
      return vim.env.NIKAVIM_ENABLE_AI == "1"
    end,
    branch = "canary",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
    },
    keys = {
      { "<leader>ac", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
      { "<leader>aq", "<cmd>CopilotChat<CR>", desc = "Open Copilot Chat (quick)" },
      { "<leader>aa", "<cmd>CopilotChatAdd<CR>", desc = "Add selection to chat" },
      { "<leader>ar", "<cmd>CopilotChatReset<CR>", desc = "Reset Copilot Chat" },
    },
    config = function()
      require("CopilotChat").setup({
        show_help = false,
        debug = false,
        mappings = {
          close = "<C-c>",
          reset = "<C-l>",
          submit_prompt = "<CR>",
          accept_diff = "<C-y>",
          next_diff = "<C-n>",
          prev_diff = "<C-p>",
        },
      })
    end,
  },
}
