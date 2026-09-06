# 🛸 NikaVim

<p align="center">
  <img src="images/header.png" alt="NikaVim Header" width="600">
</p>

<p align="center">
     <strong>A modular Neovim development environment for everyday programming.</strong><br>
     IDE-oriented workflows with explicit installation and validation requirements
</p>

<p align="center">
  <img src="https://img.shields.io/badge/neovim-%3E%3D0.10-57A143?logo=neovim&style=flat-square"
       alt="Neovim >= 0.10">
  <img src="https://img.shields.io/github/v/release/ae-orlando/NikaVim?style=flat-square&label=release"
                alt="Release v3.2.0">
  <img src="https://img.shields.io/github/last-commit/ae-orlando/NikaVim?style=flat-square&label=last%20commit"
       alt="Last Commit">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=flat-square"
       alt="License MIT">
  <img src="https://img.shields.io/badge/lua-2C2D72?logo=lua&style=flat-square"
       alt="Built with Lua">
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/ae-orlando/NikaVim?style=flat-square&logo=github&label=stars"
       alt="Stars">
  <img src="https://img.shields.io/github/forks/ae-orlando/NikaVim?style=flat-square&logo=github&label=forks"
       alt="Forks">
  <img src="https://img.shields.io/github/issues/ae-orlando/NikaVim?style=flat-square&logo=github&label=issues"
       alt="Issues">
  <img src="https://img.shields.io/github/contributors/ae-orlando/NikaVim?style=flat-square&logo=github&label=contributors"
       alt="Contributors">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square"
       alt="PRs welcome">
</p>

<p align="center">
  <img src="images/maindashboard.png" alt="NikaVim Dashboard" width="700">
</p>

---

## Table of Contents

- [Features](#-features)
- [Installation](#-installation)
- [IDE Readiness](#-ide-readiness)
- [Project Layout](#-project-layout)
- [Essential Keymaps](#-essential-keymaps)
- [Common Tasks](#-common-tasks)
- [Troubleshooting](#-troubleshooting)
- [Documentation](#-documentation)
- [Notes](#-notes)

---

## ✨ Features

### 🔧 Core

| Area | What's included |
|------|----------------|
| **Package management** | Lazy.nvim with lazy-loading and a lockfile |
| **Language servers** | LSP configurations for Lua, Python, JavaScript/TypeScript, HTML, CSS, JSON, YAML, Bash, C/C++, and Rust |
| **Completion** | nvim-cmp + LuaSnip + friendly-snippets + buffer/path/LSP sources |
| **Formatting** | conform.nvim with configurable format-on-save |
| **Linting** | nvim-lint (`pylint`, `eslint_d`, `markdownlint`, `luacheck`) |
| **Syntax highlighting** | Tree-sitter (14 languages, text objects, and structural navigation) |

### 🔍 Navigation & Search

| Feature | Plugin | Keybind |
|---------|--------|---------|
| File search | Telescope + fzf-native | `<Space>ff` |
| Text search | Telescope live_grep | `<Space>fg` |
| Flash jump | flash.nvim | `s` / `S` |
| File bookmarks | Harpoon | `<Space>ha` / `hh` |
| Breadcrumbs | nvim-navic | *(in statusline)* |
| Code outline | nvim-navbuddy | `<Space>nb` |
| Buffer tabs | bufferline.nvim | `<Tab>` / `<S-Tab>` |

### 💻 Code Intelligence

| Feature | Plugin | Keybind |
|---------|--------|---------|
| Go to definition | LSP built-in | `gd` |
| Hover docs | LSP built-in | `K` |
| Rename with preview | inc-rename.nvim | `<Space>rn` |
| Code actions | LSP built-in | `<F4>` |
| Code lens | LSP built-in | `<Space>Lc` |
| Call hierarchy | LSP built-in | `<Space>Li` / `Lo` |
| Inlay hints | LSP built-in | *(automatic)* |
| Diagnostics | trouble.nvim | `<Space>xx` |
| Todo highlights | todo-comments.nvim | `]t` / `[t` |

### 🧪 Testing & Debugging

| Feature | Plugin | Keybind |
|---------|--------|---------|
| Debugger | nvim-dap + DAP UI | `<Space>db` / `dc` / `di` / `do` |
| Test runner | neotest (python, vitest, gtest, plenary) | `<Space>tr` / `tf` / `ta` |
| Task runner | overseer.nvim | `<Space>rr` / `rb` / `rt` |

### 🛠️ Integrations

| Feature | Plugin | Keybind |
|---------|--------|---------|
| File explorer | NvimTree | `<C-n>` |
| Integrated terminal | toggleterm.nvim | `<Space>tt` |
| Git gutter | gitsigns.nvim | `]c` / `[c` |
| Git commands | vim-fugitive | `<Space>gs` / `gc` / `gp` |
| Git graph | gitgraph.nvim | `<Space>gg` |
| GitHub PRs / Issues | octo.nvim | `<Space>gi` / `gpr` |
| Database | vim-dadbod + UI | `<Space>Du` |
| REST client | rest.nvim | `<Space>Rt` |
| Projects | project.nvim | `<Space>pp` |
| Sessions | persistence.nvim | `<Space>Ss` / `Sl` |
| Markdown preview | render-markdown.nvim | *(automatic)* |

### 🤖 AI

| Feature | Plugin | Keybind |
|---------|--------|---------|
| Code suggestions | GitHub Copilot (opt-in) | `<M-l>` accept |
| AI chat | CopilotChat.nvim (opt-in) | `<Space>ac` |

Enable the optional AI integrations with `NIKAVIM_ENABLE_AI=1 nvim`. They also
require Copilot authentication and should not be necessary for core IDE use.

### 🎨 Visual

| Feature | Plugin | Keybind |
|---------|--------|---------|
| Theme | Tokyo Night | *(4 styles: night / storm / moon / day)* |
| Statusline | lualine.nvim | *(git + diagnostics + breadcrumbs)* |
| Dashboard | dashboard-nvim | *(startup screen)* |
| Zen mode | zen-mode.nvim | `<Space>zz` |
| Color highlight | nvim-colorizer.lua | *(automatic)* |
| Minimap | codewindow.nvim | `<Space>mm` |
| Smooth scroll | cinnamon.nvim | *(automatic)* |
| Indent guides | indent-blankline.nvim | *(automatic)* |
| Notifications | nvim-notify | *(toast notifications)* |
| Screencast | screenkey.nvim | `<Space>kx` |

### ✏️ Editing

| Feature | Plugin | Keybind |
|---------|--------|---------|
| Multi-cursor | vim-visual-multi | `<Space>ma` |
| Comments | Comment.nvim | `gc` / `gb` |
| Auto pairs | nvim-autopairs | *(automatic)* |
| Surround | nvim-surround | `ys` / `cs` / `ds` |
| Refactoring | refactoring.nvim | `<Space>ca` |
| Undo tree | undotree | `<Space>u` |
| Match navigation | vim-matchup | `%` enhanced |

---

## 🚀 Installation

### Prerequisites

| Dependency | Purpose | Install (Fedora) |
|------------|---------|------------------|
| **Neovim** ≥ 0.10 | Core editor | `sudo dnf install neovim` |
| **Git** | Clone repository | `sudo dnf install git` |
| **Ripgrep** | Telescope search | `sudo dnf install ripgrep` |
| **Tar & Unzip** | Plugin builds | `sudo dnf install tar unzip` |

### Setup

```bash
# 1. Back up existing config
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}   # optional
mv ~/.local/state/nvim{,.bak}   # optional
mv ~/.cache/nvim{,.bak}         # optional

# 2. Clone NikaVim
git clone https://github.com/ae-orlando/NikaVim.git ~/.config/nvim

# 3. Remove the starter's git history
rm -rf ~/.config/nvim/.git

# 4. Launch Neovim
nvim
```

Start Neovim and allow Lazy.nvim to install the pinned plugins. Review any errors in `:Lazy` before using the distribution for development.

For a clean, non-interactive installation check, use isolated XDG directories:

```bash
XDG_CONFIG_HOME="$(pwd)/.test-config" \
XDG_DATA_HOME="$(pwd)/.test-data" \
XDG_STATE_HOME="$(pwd)/.test-state" \
XDG_CACHE_HOME="$(pwd)/.test-cache" \
nvim --headless -u "$PWD/init.lua" "+Lazy! sync" +qa
```

### Install Language Servers

```vim
:Mason
```

Install language servers from Mason using the package names shown by `:Mason`.
The names used by `nvim-lspconfig` are server identifiers, not necessarily Mason
registry package names. Verify the exact package name in the Mason UI before using
headless installation commands.

Recommended servers:
Use `:Mason` to install the servers and tools required for your languages.
Do not assume that an lspconfig server identifier is a valid Mason package name.

### External Tools

The core editor requires Git, a C compiler or Make for native plugins, and
`ripgrep` for live grep. `fd` improves file discovery. Language workflows also
require the tools used by their servers, formatters, linters, test runners, and
debug adapters. Missing optional tools must not prevent Neovim from starting.

Common examples include:

| Workflow | External tools |
|----------|----------------|
| Lua | `lua-language-server`, `stylua`, `luacheck` |
| Python | `pyright`, `black`, `isort`, `pylint`, a Python environment |
| JavaScript / TypeScript | Node.js, `prettier`, `eslint_d` |
| GitHub integration | GitHub CLI (`gh`) and authentication |
| Database integration | Database client or driver required by the connection |

### IDE Readiness

NikaVim is an IDE-oriented configuration, but it should only be called
IDE-ready when a clean installation and the core workflows pass validation.
The readiness gate is:

- No startup errors on a supported stable Neovim release.
- Plugin installation succeeds from an empty data directory.
- `:checkhealth nikavim` reports no core errors.
- Completion, LSP navigation, diagnostics, formatting, and linting work.
- Search, file browsing, terminal, Git, sessions, testing, and debugging work
     or clearly report unavailable optional dependencies.
- CI passes Lua formatting, static checks, startup, health, and lockfile checks.

Until those checks pass, treat the configuration as actively developed rather
than a production-ready IDE distribution.
---

## 📁 Project Layout

```text
~/.config/nvim/
├── init.lua                 # Entry point (32 lines)
├── lazy-lock.json           # Plugin commit lock file
├── lua/
│   ├── core/
│   │   ├── init.lua         # Core loader
│   │   ├── options.lua      # Editor options
│   │   ├── keymaps.lua      # Global keymaps
│   │   ├── autocmds.lua     # Autocommands
│   │   ├── commands.lua     # User commands
│   │   └── health.lua       # Health implementation
│   ├── health/
│   │   └── nikavim.lua      # :checkhealth nikavim provider
│   └── plugins/             # 30 feature modules
│       ├── init.lua         # Plugin registry
│       ├── ui.lua           # Theme, statusline, explorer, dashboard
│       ├── editing.lua      # Comments, pairs, surround, multi-cursor
│       ├── lsp.lua          # LSP, Mason, inlay hints, code lens
│       ├── treesitter.lua   # Syntax highlighting, text objects
│       ├── completion.lua   # nvim-cmp, LuaSnip, snippets
│       ├── telescope.lua    # Fuzzy finder
│       ├── formatting.lua   # conform + nvim-lint
│       ├── git.lua          # Gitsigns, fugitive, gitgraph
│       ├── whichkey.lua     # Keybinding discovery
│       ├── trouble.lua      # Diagnostics panel
│       ├── debug.lua        # DAP debugger
│       ├── test.lua         # Neotest runner
│       ├── markdown.lua     # In-buffer markdown render
│       ├── project.lua      # Project detection
│       ├── copilot.lua      # GitHub Copilot
│       ├── terminal.lua     # toggleterm
│       ├── ai.lua           # CopilotChat
│       ├── visuals.lua      # Zen mode, twilight, colorizer
│       ├── session.lua      # persistence.nvim
│       ├── navic.lua        # Breadcrumbs + navbuddy
│       ├── tasks.lua        # Overseer
│       ├── tools.lua        # Dadbod + rest.nvim
│       ├── minimap.lua      # codewindow.nvim
│       ├── screencast.lua   # screenkey.nvim
│       ├── octo.lua         # GitHub PRs / issues
│       ├── flash.lua        # Flash navigation
│       ├── todo.lua         # TODO / FIXME highlighting
│       ├── notify.lua       # nvim-notify
│       └── harpoon.lua      # File bookmarks
├── README.md
├── KEYMAPS.md
├── QUICKSTART.md
├── SETUP.md
├── ADVANCED.md
├── CHANGELOG.md
├── INDEX.md
├── CONTRIBUTING.md
└── images/
```

---

## ⌨️ Essential Keymaps

### Navigation & Search

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Search text |
| `<Space>fb` | Find buffers |
| `<Space>fr` | Recent files |
| `<Space>hh` | Harpoon quick menu |
| `<Space>nb` | Code outline tree |
| `<Space>mm` | Toggle minimap |
| `<C-n>` | Toggle file explorer |
| `s` | Flash jump to any character |

### Code & Editing

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gr` | Go to references |
| `<F2>` | Rename symbol |
| `<F3>` | Format buffer |
| `<F4>` | Code actions |
| `<Space>xx` | Toggle diagnostics panel |
| `<Space>zz` | Toggle Zen mode |
| `<Space>ma` | Multi-cursor add word |

### Projects & Tasks

| Key | Action |
|-----|--------|
| `<Space>pp` | Switch projects |
| `<Space>Ss` | Save session |
| `<Space>rr` | Run task |
| `<Space>tt` | Toggle terminal |

### Git & Debug

| Key | Action |
|-----|--------|
| `<Space>gg` | Git commit graph |
| `<Space>gs` | Git status |
| `<Space>db` | Toggle breakpoint |
| `<Space>dc` | Continue debugger |
| `<Space>tr` | Run nearest test |

### AI

| Key | Action |
|-----|--------|
| `<Space>ac` | Toggle Copilot Chat |
| `<M-l>` | Accept Copilot suggestion |

> See [KEYMAPS.md](./KEYMAPS.md) for the **complete reference** (80+ keybindings).

---

## 🧰 Common Tasks

<details>
<summary><strong>Add a plugin</strong></summary>

```lua
-- Add to the most relevant file in lua/plugins/:
{
  "author/plugin.nvim",
  event = "BufReadPost",
  config = function()
    require("plugin").setup({})
  end,
}
```

Then run `:Lazy sync`.
</details>

<details>
<summary><strong>Add a keymap</strong></summary>

```lua
-- In lua/core/keymaps.lua:
local map = vim.keymap.set
map("n", "<leader>x", function()
  -- your action
end, { desc = "Describe the action" })
```
</details>

<details>
<summary><strong>Add a language server</strong></summary>

```vim
:Mason    " Search and install
```

Most servers auto-configure. For custom behaviour, edit `lua/plugins/lsp.lua`.
</details>

<details>
<summary><strong>Change the theme</strong></summary>

```lua
-- In lua/plugins/ui.lua
require("tokyonight").setup({ style = "storm" })
-- Options: night, storm, moon, day
```
</details>

---

## 🔍 Troubleshooting

| Problem | Try |
|---------|-----|
| Plugins missing | `:Lazy sync` |
| LSP not attached | `:LspInfo` + `:Mason` |
| Completion silent | Install the LSP server in Mason |
| Formatting not working | Install formatter in Mason; check `lua/plugins/formatting.lua` |
| Debugger not starting | Install the adapter through your project toolchain or Mason, then check `lua/plugins/debug.lua` |
| Tests not running | Ensure test adapter is configured in `lua/plugins/test.lua` |
| Telescope slow | Run `:Telescope find_files` in a smaller directory |
| Terminal not opening | Check `lua/plugins/terminal.lua` config |
| Copilot Chat not responding | Ensure `copilot.vim` is authenticated (`:Copilot setup`) |
| Dashboard splits on `:Man` | Now fixed — auto-wipes on first new buffer |
| Startup feels slow | `:Lazy profile` or `nvim --startuptime startup.log` |

> See [ADVANCED.md](./ADVANCED.md) for deeper troubleshooting.

---

## 📚 Documentation

| File | Purpose |
|------|---------|
| [INDEX.md](./INDEX.md) | Documentation map |
| [QUICKSTART.md](./QUICKSTART.md) | Fastest path to a working editor |
| [SETUP.md](./SETUP.md) | Complete setup checklist |
| [KEYMAPS.md](./KEYMAPS.md) | Full keyboard reference (80+ bindings) |
| [ADVANCED.md](./ADVANCED.md) | Customization, performance, troubleshooting |
| [CHANGELOG.md](./CHANGELOG.md) | Version history |
| [CONTRIBUTING.md](./CONTRIBUTING.md) | Contribution guide |

---

## 📝 Notes

NikaVim is meant to be edited. The configuration is split into small files so you can remove features, swap plugins, or add your own workflow without digging through a monolithic `init.lua`. Every feature is a single file in `lua/plugins/` — disable what you don't need, customize what you use.
