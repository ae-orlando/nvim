-- ~/.config/nvim/init.lua
-- Main Neovim configuration entry point

local config_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
vim.opt.rtp:prepend(config_dir)
package.path = config_dir .. "/lua/?.lua;" .. config_dir .. "/lua/?/init.lua;" .. package.path

-- Load core configuration (options and keymaps)
require("core")

-- Bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error("Failed to bootstrap lazy.nvim: " .. vim.trim(output))
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins from plugins/init.lua
require("lazy").setup("plugins", {
  lockfile = config_dir .. "/lazy-lock.json",
  rocks = {
    enabled = false,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
})

-- Print startup info
vim.schedule(function()
  print("✨ NikaVim ready!")
end)
