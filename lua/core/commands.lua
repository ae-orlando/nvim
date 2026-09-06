-- ~/.config/nvim/lua/core/commands.lua
-- Centralized user commands

local api = vim.api
local command = api.nvim_create_user_command

-- ============================================
-- Utility Commands
-- ============================================

-- Reload configuration
command("ConfigReload", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^core") or name:match("^plugins") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded!", vim.log.levels.INFO)
end, { desc = "Reload Neovim configuration" })

-- Toggle format on save
command("FormatToggle", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  vim.notify("Format on save: " .. (vim.g.autoformat_enabled and "enabled" or "disabled"), vim.log.levels.INFO)
end, { desc = "Toggle auto-format on save" })

-- ============================================
-- LSP Commands
-- ============================================

-- Restart LSP
command("LspRestart", function()
  vim.cmd("LspStop")
  vim.cmd("LspStart")
  vim.notify("LSP restarted", vim.log.levels.INFO)
end, { desc = "Restart LSP servers" })

-- ============================================
-- Git Commands
-- ============================================

-- Git blame current line
command("GitBlameLine", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Show git blame for current line" })

-- ============================================
-- Debug Commands
-- ============================================

-- Toggle DAP UI
command("DapUIToggle", function()
  require("dapui").toggle()
end, { desc = "Toggle DAP UI" })

-- ============================================
-- Test Commands
-- ============================================

-- Run nearest test
command("TestNearest", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

-- Run test file
command("TestFile", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run current test file" })

-- Run all tests
command("TestAll", function()
  require("neotest").run.run(vim.fn.getcwd())
end, { desc = "Run all tests" })

-- ============================================
-- Session Commands
-- ============================================

-- Save session
command("SessionSave", function()
  require("persistence").save()
  vim.notify("Session saved", vim.log.levels.INFO)
end, { desc = "Save current session" })

-- Load session
command("SessionLoad", function()
  require("persistence").load()
end, { desc = "Load last session" })

-- ============================================
-- Plugin Management
-- ============================================

-- Sync lazy plugins
command("LazySync", function()
  require("lazy").sync()
end, { desc = "Sync lazy plugins" })

-- Profile lazy loading
command("LazyProfile", function()
  require("lazy").profile()
end, { desc = "Profile lazy plugin loading" })