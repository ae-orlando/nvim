# ⚡ Quick Start

The fastest path from a fresh NikaVim checkout to a usable editor.

---

## 1. Verify prerequisites

NikaVim requires a supported stable Neovim release, Git, a compiler or Make,
and `ripgrep`. Install `fd` for faster file discovery. Language servers,
formatters, linters, test runners, and debug adapters have additional
dependencies.

```bash
nvim --version
git --version
rg --version
```

## 2. Open Neovim

```bash
nvim
```

Allow Lazy.nvim to finish installing plugins, then inspect `:Lazy` for errors.
Do not treat the startup message alone as proof that installation succeeded.

---

## 3. Install Language Servers

```vim
:Mason
```

Install the packages shown by the Mason interface for the languages you use.
The names below are lspconfig identifiers; Mason registry names may differ.

| Language | Server |
|----------|--------|
| Lua | `lua_ls` |
| Python | `pyright` |
| TypeScript / JavaScript | `ts_ls` |
| HTML | `html` |
| CSS | `cssls` |
| JSON | `jsonls` |
| YAML | `yamlls` |
| Bash | `bashls` |
| C / C++ | `clangd` |
| Rust | `rust_analyzer` |

Close Mason with `q`.

---

## 4. Try the Core Workflow

| Action | Key |
|--------|-----|
| Find files | `<Space>ff` |
| Search across files | `<Space>fg` |
| Switch buffers | `<Space>fb` |
| Open recent files | `<Space>fr` |
| Toggle file explorer | `<C-n>` |
| Hover documentation | `K` |
| Go to definition | `gd` |
| Rename symbol | `<Space>rn` |
| Format code | `<F3>` |
| Code actions | `<F4>` |

---

## 5. Essential IDE Features

### Integrated Terminal

| Action | Key |
|--------|-----|
| Toggle terminal | `<Space>tt` |
| Floating terminal | `<Space>tF` |
| Exit terminal mode | `<Esc>` |

### Debugger

| Action | Key |
|--------|-----|
| Toggle breakpoint | `<Space>db` |
| Start / continue | `<Space>dc` |
| Step over | `<Space>do` |
| Step into | `<Space>di` |

### Test Runner

| Action | Key |
|--------|-----|
| Run nearest test | `<Space>tr` |
| Run test file | `<Space>tf` |
| Run all tests | `<Space>ta` |

### Git

| Action | Key |
|--------|-----|
| Git status | `<Space>gs` |
| Git commit | `<Space>gc` |
| Git push | `<Space>gp` |
| Git log | `<Space>gl` |
| Git commit graph | `<Space>gg` |
| Stage hunk | `<Space>hs` |
| Toggle blame | `<Space>tb` |

### AI

| Action | Key |
|--------|-----|
| Toggle Copilot Chat | `<Space>ac` |
| Accept Copilot suggestion | `<M-l>` |
| Next suggestion | `<M-]>` |

AI integrations are opt-in. Start Neovim with `NIKAVIM_ENABLE_AI=1` and
authenticate Copilot before using these mappings.

### Navigation

| Action | Key |
|--------|-----|
| Flash jump to any character | `s` (forward) / `S` (backward) |
| File bookmarks (Harpoon) | `<Space>ha` add / `hh` menu |
| Code outline | `<Space>nb` |
| Toggle diagnostics | `<Space>xx` |
| Switch projects | `<Space>pp` |

---

## 6. Visual Features

| Action | Key |
|--------|-----|
| Toggle Zen mode | `<Space>zz` |
| Toggle minimap | `<Space>mm` |
| Toggle dashboard | Restart Neovim |
| Restore last session | `<Space>Sl` |
| Save session | `<Space>Ss` |

---

## 7. Install Formatters and Linters

Use `:Mason` to install the tools listed below, or install them through the
language ecosystem used by your project.

| Language | Formatter | Linter |
|----------|-----------|--------|
| Lua | `stylua` | `luacheck` |
| Python | `black`, `isort` | `pylint` |
| JavaScript / TypeScript | `prettier` | `eslint_d` |
| Markdown | `prettier` | `markdownlint` |

Formatting is controlled by the configured Conform policy. Verify the current
state with `:ConformInfo`; manual format is `<F3>`. Do not assume a formatter is
available until its executable is installed.

---

## 8. Validate the Installation

Run these checks after installation:

```vim
:checkhealth nikavim
:Lazy
:Mason
:LspInfo
```

Open a representative project and verify completion, hover, definition,
diagnostics, formatting, search, terminal, and Git workflows before relying on
the distribution for daily work.

## 9. Next Steps

- Read [KEYMAPS.md](./KEYMAPS.md) for the full keymap reference (80+ bindings)
- Read [SETUP.md](./SETUP.md) for a complete first-time checklist
- Read [ADVANCED.md](./ADVANCED.md) for customization and troubleshooting

---

## 🔍 Common First Checks

```vim
:checkhealth nikavim
:Lazy
:Mason
:LspInfo
```
