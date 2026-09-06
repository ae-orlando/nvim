-- ~/.config/nvim/lua/plugins/ui.lua
-- UI and visual enhancements

return {
  -- Beautiful colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        styles = {
          comments = { italic = true },
          keywords = { bold = true },
        },
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- Modern statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            "filename",
            "diagnostics",
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- File icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        hijack_netrw = false,
        disable_netrw = false,
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { ".git", "node_modules", "__pycache__" },
        },
        sync_root_with_cwd = true,
      })
    end,
  },

  -- Buffer tabs
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          separator_style = "slant",
          always_show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
        },
      })
    end,
  },

  -- Better UI (input/select dialogs)
  {
    "stevearc/dressing.nvim",
    lazy = true,
    config = function()
      require("dressing").setup({
        input = { relative = "cursor" },
        select = { backend = { "telescope", "fzf", "builtin" } },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
        exclude = {
          filetypes = {
            "dashboard",
            "lazy",
            "mason",
            "NvimTree",
            "help",
            "checkhealth",
          },
          buftypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
          },
        },
      })
    end,
  },

  -- Smooth scrolling (pixel-based animated C-d/C-u, C-f/C-b)
  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    config = function()
      require("cinnamon").setup({
        options = {
          mode = "cursor",
          delay = 5,
          max_delta = {
            line = 60,
            column = 60,
            time = 1000,
          },
          step_size = {
            vertical = 1,
            horizontal = 2,
          },
        },
        keymaps = {
          basic = true,
          extra = false,
        },
      })
    end,
  },

  -- Dashboard/startup screen
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function set_dashboard_highlights()
        local highlights = {
          DashboardHeader = "Title",
          DashboardIcon = "Function",
          DashboardDesc = "String",
          DashboardKey = "Number",
          DashboardShortCut = "Identifier",
          DashboardFooter = "Comment",
        }

        for group, link in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, { link = link, default = false })
        end
      end

      local group = vim.api.nvim_create_augroup("NikaVimDashboard", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_dashboard_highlights,
      })
      set_dashboard_highlights()

      -- ASCII art logo
      local header_art = {
        "███╗   ██╗██╗██╗  ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██║██║ ██╔╝██╔══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║██║█████╔╝ ███████║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██║██╔═██╗ ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║██║██║  ██╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }

      local header_width = 0
      for _, line in ipairs(header_art) do
        header_width = math.max(header_width, vim.api.nvim_strwidth(line))
      end

      local function center_in_header(text)
        local text_width = vim.api.nvim_strwidth(text)
        local padding = math.max(header_width - text_width, 0)
        local left = math.floor(padding / 2)
        local right = padding - left
        return string.rep(" ", left) .. text .. string.rep(" ", right)
      end

      -- Separator matching the logo width
      local separator = string.rep("─", math.floor(header_width / 2))

      local dashboard_header = { "" }
      vim.list_extend(dashboard_header, header_art)
      vim.list_extend(dashboard_header, {
        "",
        center_in_header("Blazing-fast Neovim. Infinite possibilities."),
        center_in_header(separator),
        "",
      })

      -- Random tip of the day
      local tips = {
        "Press  <Space>  to discover all available keybindings",
        "Search files instantly:  <Space>f f",
        "Search across files:     <Space>f g",
        "Toggle file explorer:    <C-n>",
        "Open terminal:           <Space>t t",
        "Chat with AI:            <Space>a c",
        "Distraction-free coding: <Space>z z",
        "Toggle breakpoint:       <Space>d b",
        "Run nearest test:        <Space>t r",
        "Restore last session:    <Space>S l",
        "Switch projects:         <Space>p p",
        "Go to definition:        g d",
        "Hover documentation:     K",
        "Rename symbol:           <F2>",
        "Format code:             <F3>",
        "Code actions:            <F4>",
        "Toggle diagnostics:      <Space>x x",
        "View git log:            <Space>g l",
        "Install tools:           :Mason",
        "Manage plugins:          :Lazy",
        "Multi-cursor add word:   <Space>m a",
        "Toggle minimap:          <Space>m m",
        "List GitHub issues:      <Space>g i",
        "Show git commit graph:   <Space>g g",
        "Save session:            <Space>S s",
      }
      local tip = tips[math.random(#tips)]

      -- Greeting based on time of day
      local function greeting()
        local hour = tonumber(os.date("%H"))
        if hour < 12 then
          return "Good morning"
        elseif hour < 18 then
          return "Good afternoon"
        else
          return "Good evening"
        end
      end

      -- Detect git branch (non-blocking, runs once)
      local git_branch = ""
      local git_ok = pcall(function()
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null")
        if vim.v.shell_error == 0 and branch ~= "" then
          git_branch = "   " .. vim.trim(branch)
        end
      end)

      -- Track dashboard buffer so we can wipe it when real content opens
      local dashboard_buf = vim.api.nvim_get_current_buf()

      -- If a file was already loaded during startup (e.g. `nvim -c ":Man"`),
      -- skip the dashboard entirely so it doesn't split.
      local existing = vim.fn.getbufinfo({ buflisted = 1 })
      local skip_dashboard = false
      for _, b in ipairs(existing) do
        if b.bufnr ~= dashboard_buf and b.name ~= "" then
          skip_dashboard = true
          break
        end
      end

      if skip_dashboard then
        pcall(vim.api.nvim_buf_delete, dashboard_buf, { force = true })
        return
      end

      require("dashboard").setup({
        theme = "doom",
        config = {
          header = dashboard_header,
          center = {
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "New file          ",
              desc_hl = "String",
              key = "n",
              key_hl = "Number",
              key_format = " %s",
              action = "ene | startinsert",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Find files        ",
              desc_hl = "String",
              key = "f",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f f",
              action = "Telescope find_files",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Recent files      ",
              desc_hl = "String",
              key = "r",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f r",
              action = "Telescope oldfiles",
            },
            {
              icon = "󰱼  ",
              icon_hl = "Title",
              desc = "Search text       ",
              desc_hl = "String",
              key = "g",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC f g",
              action = "Telescope live_grep",
            },
            {
              icon = "󰙅  ",
              icon_hl = "Title",
              desc = "File explorer     ",
              desc_hl = "String",
              key = "e",
              key_hl = "Number",
              key_format = " %s",
              keymap = "CTRL n",
              action = "NvimTreeToggle",
            },
            {
              icon = "󰒲  ",
              icon_hl = "Title",
              desc = "Lazy plugins      ",
              desc_hl = "String",
              key = "l",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC l",
              action = "Lazy",
            },
            {
              icon = "󰏖  ",
              icon_hl = "Title",
              desc = "Mason tools       ",
              desc_hl = "String",
              key = "m",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC m",
              action = "Mason",
            },
            {
              icon = "  ",
              icon_hl = "Title",
              desc = "Quit              ",
              desc_hl = "String",
              key = "q",
              key_hl = "Number",
              key_format = " %s",
              keymap = "SPC q",
              action = "qa",
            },
          },
          footer = function()
            local version = vim.version()
            local version_text = string.format("Neovim %d.%d.%d", version.major, version.minor, version.patch)
            local stats_text = "Lazy.nvim is getting ready"
            local ok, lazy = pcall(require, "lazy")

            if ok then
              local stats = lazy.stats()
              local loaded = stats.loaded or 0
              local count = stats.count or 0
              local startup_ms = stats.startuptime or 0
              stats_text = string.format("Loaded %d/%d plugins in %.0fms", loaded, count, startup_ms)
            end

            local time_text = os.date("%I:%M %p"):gsub("^0", "")

            return {
              "",
              greeting() .. " and welcome to NikaVim!" .. git_branch,
              version_text .. "  •  " .. stats_text .. "  •  " .. time_text,
              "",
              tip,
            }
          end,
          vertical_center = true,
        },
      })

      -- Automatically wipe the dashboard buffer when the first real
      -- file buffer is entered (handles :Man, :help, Telescope, etc.).
      -- Guards against :e (same buffer) and during initialization.
      local dash_group = vim.api.nvim_create_augroup("NikaVimDashboard", { clear = true })
      vim.api.nvim_create_autocmd("BufEnter", {
        group = dash_group,
        callback = function()
          if not vim.api.nvim_buf_is_valid(dashboard_buf) then
            return true  -- already gone, remove autocmd
          end
          local cur_buf = vim.api.nvim_get_current_buf()
          if cur_buf ~= dashboard_buf and vim.fn.bufname(cur_buf) ~= "" then
            pcall(vim.api.nvim_buf_delete, dashboard_buf, { force = true })
            return true  -- done, remove autocmd
          end
        end,
      })
    end,
  },
}
