-- ~/.config/nvim/lua/core/init.lua
-- Load core configuration modules

require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.commands")

vim.g.autoformat_enabled = true

local version = vim.version()
if version.major == 0 and version.minor < 10 then
	error(string.format("NikaVim requires Neovim >= 0.10.0, found %s", tostring(version)))
end
