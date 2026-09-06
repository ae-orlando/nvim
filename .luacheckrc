-- .luacheckrc
-- Luacheck configuration for NikaVim

std = "luajit"
max_line_length = 120

globals = {
  "vim",
  "Snacks",
}

exclude_files = {
  "lazy-lock.json",
}

ignore = {
  "631", -- max_line_length
}

-- Per-file overrides
files["lua/core/health.lua"] = {
  ignore = { "113" }, -- accessing undefined variable health (vim.health)
}