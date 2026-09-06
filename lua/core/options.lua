local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ============================================
-- Visual Settings
-- ============================================
opt.termguicolors = true      -- True color support
opt.number = true              -- Line numbers
opt.relativenumber = true      -- Relative line numbers
opt.cursorline = true          -- Highlight current line
opt.signcolumn = "yes"         -- Always show sign column
opt.scrolloff = 8              -- Keep cursor centered
opt.list = true                -- Show invisible characters
opt.listchars = { tab = "▶ ", trail = "·" }

-- ============================================
-- Tab Settings
-- ============================================
opt.tabstop = 2                -- Tab width
opt.shiftwidth = 2             -- Indent width
opt.softtabstop = 2            -- Tab in insert mode
opt.expandtab = true           -- Use spaces
opt.autoindent = true          -- Auto indent
opt.smartindent = true         -- Smart indent

-- ============================================
-- Search Settings
-- ============================================
opt.ignorecase = true          -- Ignore case in search
opt.smartcase = true           -- Override if search has capitals
opt.hlsearch = true            -- Highlight matches
opt.incsearch = true           -- Show matches while typing

-- ============================================
-- Behavior Settings
-- ============================================
opt.mouse = "a"                -- Enable mouse
opt.clipboard = "unnamedplus"  -- System clipboard
opt.undofile = true            -- Persistent undo
opt.swapfile = false           -- No swap files (cleaner)
opt.backup = false             -- No backup files
opt.splitright = true          -- Vertical splits go right
opt.splitbelow = true          -- Horizontal splits go down

-- ============================================
-- Performance
-- ============================================
opt.timeoutlen = 300           -- Faster key sequences
opt.updatetime = 250           -- Faster CursorHold

print("⚙️  Options loaded")