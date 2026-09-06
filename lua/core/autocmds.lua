-- ~/.config/nvim/lua/core/autocmds.lua
-- Centralized autocommands

local api = vim.api
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

-- ============================================
-- Dashboard Highlights (re-apply on colorscheme change)
-- ============================================
local dashboard_hl_group = augroup("NikaVimDashboardHighlights", { clear = true })
autocmd("ColorScheme", {
  group = dashboard_hl_group,
  callback = function()
    local highlights = {
      DashboardHeader = "Title",
      DashboardIcon = "Function",
      DashboardDesc = "String",
      DashboardKey = "Number",
      DashboardShortCut = "Identifier",
      DashboardFooter = "Comment",
    }

    for group, link in pairs(highlights) do
      api.nvim_set_hl(0, group, { link = link, default = false })
    end
  end,
})

-- ============================================
-- Terminal Settings
-- ============================================
local term_group = augroup("NikaVimTerminal", { clear = true })
autocmd("TermOpen", {
  group = term_group,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- ============================================
-- File Type Specific
-- ============================================
local ft_group = augroup("NikaVimFileType", { clear = true })
autocmd("FileType", {
  group = ft_group,
  pattern = { "qf", "help", "man", "lspinfo", "checkhealth" },
  callback = function(event)
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- ============================================
-- Highlight on Yank
-- ============================================
local yank_group = augroup("NikaVimHighlightYank", { clear = true })
autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- ============================================
-- Resize Splits on VimResized
-- ============================================
local resize_group = augroup("NikaVimResize", { clear = true })
autocmd("VimResized", {
  group = resize_group,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})