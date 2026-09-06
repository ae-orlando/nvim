-- ~/.config/nvim/lua/plugins/lsp.lua
-- Language Server Protocol setup

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("lspconfig.ui.windows").default_options.border = "rounded"

      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      lsp_defaults.capabilities =
          vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

      local lsp_group = vim.api.nvim_create_augroup("NikaVimLspAttach", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = lsp_group,
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "x" }, "<F3>", function()
            local ok, conform = pcall(require, "conform")
            if ok then
              conform.format({ async = true, lsp_format = "fallback" })
            else
              vim.lsp.buf.format({ async = true })
            end
          end, opts)
          vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })

          -- Code Lens
          vim.lsp.codelens.refresh()
          vim.keymap.set("n", "<leader>Lc", vim.lsp.codelens.run, vim.tbl_extend("force", opts, { desc = "Run code lens" }))
          vim.keymap.set("n", "<leader>Lr", vim.lsp.codelens.refresh, vim.tbl_extend("force", opts, { desc = "Refresh code lens" }))

          -- Call hierarchy
          vim.keymap.set("n", "<leader>Li", vim.lsp.buf.incoming_calls, vim.tbl_extend("force", opts, { desc = "Incoming calls" }))
          vim.keymap.set("n", "<leader>Lo", vim.lsp.buf.outgoing_calls, vim.tbl_extend("force", opts, { desc = "Outgoing calls" }))
        end,
      })
    end,
  },

  -- Mason: Package manager for LSPs, linters, formatters
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason LSP Config
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = false,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- Lua LS special config
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- Inline rename preview (VS Code-style rename with diff preview)
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      { "<leader>rn", ":IncRename ", desc = "Rename symbol (preview)" },
    },
    config = function()
      require("inc_rename").setup({
        cmd_name = "IncRename",
        input_buffer_type = "prompt",
        preview_win_highlight = "IncRenamePreview",
        show_message = true,
        highlight_alternatives = true,
      })

      -- Highlight group for the rename preview
      vim.api.nvim_set_hl(0, "IncRenamePreview", { link = "DiffAdd", default = true })
    end,
  },

  -- Better diagnostics display
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      })
    end,
  },
}
