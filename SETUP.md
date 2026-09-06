# 🚀 First-Time Setup Checklist

Complete this checklist after installing NikaVim.

---

## ⚡ Immediate Setup

Before installing, confirm that the host has a supported stable Neovim release,
Git, a compiler or Make, `ripgrep`, and a working network connection. `fd` is
recommended for file discovery.

- [ ] **Install plugins**: Open Neovim (`nvim`) and let Lazy install the pinned plugins
  - Wait for Lazy to finish
  - Inspect `:Lazy` for failed tasks
  - Close Neovim (`:q`)

- [ ] **Verify installation**:
  ```bash
  nvim --version
  nvim --headless -u init.lua "+checkhealth nikavim" +qa
  ```

---

## 🛠️ Core Setup (10 minutes)

- [ ] **Install language servers** for your languages:
  ```bash
  NIKAVIM_OPEN_MASON=1 ./setup.sh
  ```
  Use the package names shown by Mason. lspconfig server identifiers and Mason
  registry package names are not always identical.

- [ ] **Install formatters and linters**:
  - Lua: `stylua`, `luacheck`
  - Python: `black`, `isort`, `pylint`
  - JavaScript/TypeScript: `prettier`, `eslint_d`
  - Markdown: `prettier`, `markdownlint`
  - Verify availability with `:ConformInfo` and `:checkhealth nikavim`

- [ ] **Test LSP**:
  - Create `test.lua`
  - Type and use `<C-Space>` for completion
  - Press `K` to hover
  - Use `gd` to go to definition

- [ ] **Configure git** (if not already done):
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```

---

## 🧪 Feature Setup

### Terminal

- [ ] Press `<Space>tt` to toggle terminal
- [ ] Press `<Esc>` in terminal mode to return to normal mode
- [ ] Try `<Space>tF` for floating terminal

### Debugger

- [ ] Open a supported file (Python, JS, C++, Rust)
- [ ] Set a breakpoint: `<Space>db`
- [ ] Start debugging: `<Space>dc`
- [ ] Step through code: `<Space>di` (into), `<Space>do` (over), `<Space>dO` (out)

### Test Runner

- [ ] Open a test file (Python `test_*.py`, JS `*.test.ts`, etc.)
- [ ] Run nearest test: `<Space>tr`
- [ ] Run all tests: `<Space>ta`
- [ ] View test summary: `<Space>ts`

### Git

- [ ] Open a git repository
- [ ] Press `<Space>gs` to see git status
- [ ] Navigate changes with `]c` and `[c`
- [ ] Stage hunks: `<Space>hs`
- [ ] View commit graph: `<Space>gg`

### Copilot AI

- [ ] Enable the optional AI integrations:
  ```bash
  NIKAVIM_ENABLE_AI=1 nvim
  ```
- [ ] Authenticate: `:Copilot setup`
- [ ] Accept suggestion in insert mode: `<M-l>`
- [ ] Open chat panel: `<Space>ac`

### Database & REST

- [ ] Configure a database connection in `~/.config/nvim/db_ui.json`
- [ ] Open DB UI: `<Space>Du`
- [ ] Create an `.http` file and run requests: `<Space>Rt`

### GitHub

- [ ] Authenticate: `gh auth login`
- [ ] List issues: `<Space>gi`
- [ ] List PRs: `<Space>gpr`

### Flash Navigation

- [ ] Press `s` in normal mode, then type 2 characters → jump labels appear
- [ ] Press the label to jump

### File Bookmarks (Harpoon)

- [ ] Open files and add them: `<Space>ha`
- [ ] Quick switch: `<Space>hh`
- [ ] Jump to slots: `<Space>h1` through `<Space>h5`

---

## 🎨 Customization (Optional)

- [ ] **Change keymaps**: Edit `lua/core/keymaps.lua`, then `:source %`
- [ ] **Change theme**: In `lua/plugins/ui.lua`, change `style` to `storm`, `moon`, or `day`
- [ ] **Disable a feature**: Add `enabled = false` to any plugin spec in `lua/plugins/*.lua`
- [ ] **Add a plugin**: Follow the pattern in `lua/plugins/init.lua` and run `:Lazy sync`

---

## 📖 Post-Setup Learning

- [ ] Read [README.md](./README.md) for the full feature overview
- [ ] Read [KEYMAPS.md](./KEYMAPS.md) for the complete keymap reference
- [ ] Read [ADVANCED.md](./ADVANCED.md) for customization and troubleshooting

---

## 🔍 Troubleshooting Checklist

| Symptom | Fix |
|---------|-----|
| Plugins not installed | `:Lazy sync` |
| LSP not working | `:LspInfo` + `:checkhealth` |
| Completion not working | Install LSP server in Mason |
| Formatting not working | Install formatter in Mason |
| Debugger not starting | Install the required adapter through your project toolchain or Mason, then check `lua/plugins/debug.lua` |
| Tests not running | Check test adapter in `lua/plugins/test.lua` |
| Terminal not opening | Check `lua/plugins/terminal.lua` |
| Copilot not responding | `:Copilot setup` to authenticate |
| Colors look wrong | `:set termguicolors` + `:colorscheme tokyonight` |
| Startup feels slow | `:Lazy profile` or `nvim --startuptime startup.log` |

> See [ADVANCED.md](./ADVANCED.md#common-issues--solutions) for detailed troubleshooting.

---

## ✅ Success Checklist

- [ ] LSP features work (hover, goto, completion)
- [ ] Telescope search works (`<Space>ff`, `<Space>fg`)
- [ ] Formatting and linting work (`<F3>`)
- [ ] Git integration works (`<Space>gs`, `]c`)
- [ ] Terminal works (`<Space>tt`)
- [ ] Debugger works (`<Space>db`, `<Space>dc`)
- [ ] Test runner works (`<Space>tr`)
- [ ] All keybindings from [KEYMAPS.md](./KEYMAPS.md) are functional
- [ ] `:checkhealth nikavim` has no core errors
- [ ] A clean headless startup completes without errors

NikaVim should not be considered IDE-ready until the core checks above pass.
Optional integrations such as Copilot, Octo, databases, REST requests, and
debug adapters may require separate credentials, binaries, or project tooling.

---

**Next**: Start coding with `nvim yourfile.py` or `nvim .`
