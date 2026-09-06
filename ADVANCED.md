# 🔧 Advanced Configuration & Troubleshooting

---

## ⚡ Performance Optimization

### Check Startup Time

```bash
nvim --startuptime startup.log
nvim startup.log   # View the log
```

Look for plugins taking >50 ms and consider:
- Adding `event`, `cmd`, or `keys` for lazy-loading
- Disabling unused plugins (`enabled = false`)
- Moving heavy initialisation after startup (`vim.schedule`)

### Profile Plugin Loading

```vim
:Lazy profile
```

Shows which plugins take the longest to load.

### Optimise LSP

```vim
:LspInfo        " See active servers
:LspStart       " Start LSP for current buffer
:LspStop        " Stop LSP
```

For specific file types, add a custom handler in `lua/plugins/lsp.lua`:

```lua
your_language = function()
  require("lspconfig").your_language.setup({
    settings = { /* your config */ },
  })
end,
```

---

## 🎨 Customization Examples

### Change the Theme

```lua
-- In lua/plugins/ui.lua, replace or extend:
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({ style = "storm" })  -- night, storm, moon, day
    vim.cmd.colorscheme("tokyonight")
  end,
}
```

### Add a Custom Keymap

```lua
-- In lua/core/keymaps.lua:
local map = vim.keymap.set
map("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git write / stage all" })
```

### Disable a Feature

```lua
-- Option 1: Comment the require() in lua/plugins/init.lua
-- Option 2: Use lazy's enabled flag in the plugin spec:
{
  "author/plugin.nvim",
  enabled = false,   -- completely disabled
}
```

### Add a New Plugin

```lua
-- 1. Create or edit a file in lua/plugins/, e.g. lua/plugins/myplugin.lua:
return {
  {
    "author/plugin.nvim",
    event = "BufReadPost",
    config = function()
      require("plugin").setup({})
    end,
  },
}

-- 2. Register it in lua/plugins/init.lua:
return {
  -- ... existing requires ...
  require("plugins.myplugin"),
}

-- 3. Install:
:Lazy sync
```

### Lazy-Loading Strategies

| Trigger | When plugin loads | Use case |
|---------|------------------|----------|
| `event = "BufReadPre"` | Before file opens | Git signs, LSP |
| `event = "InsertEnter"` | When entering insert mode | Auto-pairs, completion |
| `event = "VeryLazy"` | After UI starts | Which-key, notify |
| `cmd = "CommandName"` | When the command is used | Fugitive, Mason |
| `keys = { { "<leader>xx" } }` | When the key is pressed | Harpoon, debugger |
| `lazy = false` | At startup | Theme, essential |

### Configure LSP for a New Language

1. Install the server in Mason: `:Mason` → search → install
2. Most servers auto-configure. For custom settings:

```lua
-- In lua/plugins/lsp.lua, add a handler:
handlers = {
  -- ... existing handlers ...
  mylang_ls = function()
    require("lspconfig").mylang_ls.setup({
      settings = {
        -- your settings
      },
    })
  end,
}
```

### Conditional Plugin Loading

```lua
{
  "plugin/name.nvim",
  enabled = vim.fn.executable("required_tool") == 1,
}
```

### Create a Custom Command

```lua
-- In lua/core/keymaps.lua or any plugin config:
vim.api.nvim_create_user_command("MyCommand", function()
  -- your logic
end, {})
```

### Create an Autocommand

```lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.lua" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
```

---

## 🔍 Common Issues & Solutions

### LSP Not Working

| Step | Action |
|------|--------|
| 1 | Check if the server is installed: `:Mason` |
| 2 | Check LSP logs: `:LspLog` |
| 3 | Verify it's attached: `:LspInfo` |
| 4 | Check Neovim version: `:version` (needs ≥0.10) |

### Completion Not Working

```vim
:LspInfo           " Is an LSP server attached?
<C-Space>         " Manually trigger completion
:checkhealth      " Check cmp configuration
```

### Telescope Not Finding Files

Files in `.gitignore` are automatically ignored.

```lua
-- Add custom ignore patterns in lua/plugins/telescope.lua:
file_ignore_patterns = {
  "node_modules",
  ".git/",
  "build/",
},
```

### Colors Look Wrong

```vim
:set termguicolors       " Should be on
:colorscheme tokyonight  " Reset theme
:redraw!                 " Force redraw
```

### Plugin Not Loading

```vim
:Lazy sync    " Reinstall all plugins
:Lazy log     " View plugin installation logs
```

Check if lazy-loading is configured:

```lua
event = "BufReadPost",
cmd = "CommandName",
keys = { { "<leader>xx", desc = "Action" } },
```

### Mason Servers Not Installing

```vim
:Mason         " Try again
```

Clear cache if needed:

```bash
rm -rf ~/.local/share/nvim/mason
```

### Formatting Not Working

| Step | Action |
|------|--------|
| 1 | Is the formatter installed? Check `:Mason` |
| 2 | Check `lua/plugins/formatting.lua` for your filetype |
| 3 | Manual format: `<F3>` or `:Format` |

### Debugger Not Starting

| Step | Action |
|------|--------|
| 1 | Check installed adapters in Mason or through the adapter's documented toolchain |
| 2 | Verify `lua/plugins/debug.lua` has your language adapter |
| 3 | Set a breakpoint first: `<Space>db` |
| 4 | Start: `<Space>dc` |

### Tests Not Running

| Step | Action |
|------|--------|
| 1 | Check `lua/plugins/test.lua` has the right adapter |
| 2 | Run from a test file (e.g. `test_*.py`, `*.test.ts`) |
| 3 | `<Space>tr` for nearest test, `<Space>tf` for file |

### Database Not Connecting

| Step | Action |
|------|--------|
| 1 | Create `~/.config/nvim/db_ui.json` with connection details |
| 2 | Open DB UI: `<Space>Du` |
| 3 | See [vim-dadbod docs](https://github.com/tpope/vim-dadbod) for syntax |

### Copilot Not Working

```vim
:Copilot setup    " Authenticate with GitHub
:Copilot status   " Check connection
```

### GitHub (Octo) Not Working

```bash
gh auth login     " Authenticate with GitHub CLI
```

Then in Neovim:

```vim
:Octo issue list
:Octo pr list
```

### Session Not Restoring

```vim
<Space>Sl    " Load last session
<Space>Sd    " Stop auto-saving (if you don't want it)
```

Check `lua/plugins/session.lua` for the save directory:

```lua
dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
```

### Dashboard Splits on Command

This was fixed — the dashboard buffer auto-wipes when the first new buffer opens. If you still see splits, run:

```vim
:bd!         " Close dashboard buffer manually
```

### Flash Navigation Not Working

`S` (capital S) may conflict with `:w` if you are used to `:wq!`. Flash replaces the default `s` (substitute) and `S` (substitute line) mappings. Use `cl` and `cc` as alternatives for those.

### Harpoon Not Remembering Files

```vim
<Space>hh    " Open the menu — files are listed per-project
<Space>ha    " Add current file
```

Harpoon saves to a file in `~/.local/share/nvim/harpoon/`.

---

## 🩺 Health Check

```vim
:checkhealth
```

Shows issues with configuration, dependencies, and missing tools.

---

## 📋 Performance Checklist

- [ ] Run `:checkhealth` — fix any warnings
- [ ] Check startup time with `--startuptime`
- [ ] Only install language servers you need (`:Mason`)
- [ ] Enable lazy-loading for heavy plugins
- [ ] Disable unused plugins with `enabled = false`
- [ ] Use `:Lazy profile` to find slow plugins
- [ ] Keep formatters and linters lean

---

## 📚 Resources

- [Neovim documentation](https://neovim.io/doc/user/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [LSPConfig Wiki](https://github.com/neovim/nvim-lspconfig/wiki)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim/wiki)
- [Mason](https://github.com/williamboman/mason.nvim)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [Neotest](https://github.com/nvim-neotest/neotest)
