-- ~/.config/nvim/lua/core/health.lua
-- Health check for NikaVim configuration

local M = {}

M.check = function()
  local health = vim.health or require("health")
  vim.g.nikavim_health_errors = 0

  local function report_error(message)
    vim.g.nikavim_health_errors = vim.g.nikavim_health_errors + 1
    health.error(message)
  end

  health.start("NikaVim Configuration Health")

  -- Check Neovim version
  local nvim_version = vim.version()
  if nvim_version.major > 0 or nvim_version.minor >= 10 then
    health.ok(string.format("Neovim version: %d.%d.%d", nvim_version.major, nvim_version.minor, nvim_version.patch))
  else
    report_error(string.format("Neovim version %d.%d.%d is too old. Requires >= 0.10", nvim_version.major, nvim_version.minor, nvim_version.patch))
  end

  -- Check required external tools
  local required_tools = {
    { cmd = "rg", name = "ripgrep", desc = "Required for Telescope live_grep" },
    { cmd = "fd", alternate = "fdfind", name = "fd", desc = "Recommended for Telescope file finding" },
    { cmd = "git", name = "git", desc = "Required for Git integration" },
    { cmd = "make", name = "make", desc = "Required for building plugins" },
    { cmd = "python3", name = "python3", desc = "Required for Python LSP and tools" },
    { cmd = "node", name = "node", desc = "Required for TypeScript/JavaScript LSP and tools" },
    { cmd = "npm", name = "npm", desc = "Required for installing LSP servers" },
  }

  for _, tool in ipairs(required_tools) do
    local command = vim.fn.executable(tool.cmd) == 1 and tool.cmd or tool.alternate
    if command and vim.fn.executable(command) == 1 then
      health.ok(string.format("%s (%s) found", tool.name, command))
    else
      health.warn(string.format("%s not found - %s", tool.name, tool.desc))
    end
  end

  -- Check optional tools
  local optional_tools = {
    { cmd = "lazygit", name = "lazygit", desc = "Optional: Git TUI" },
    { cmd = "gh", name = "gh", desc = "Optional: GitHub CLI for Octo" },
    { cmd = "docker", name = "docker", desc = "Optional: For container development" },
  }

  for _, tool in ipairs(optional_tools) do
    if vim.fn.executable(tool.cmd) == 1 then
      health.ok(string.format("%s (%s) found", tool.name, tool.cmd))
    else
      health.info(string.format("%s (%s) not found - %s", tool.name, tool.cmd, tool.desc))
    end
  end

  -- Check Python provider
  local python_ok, _ = pcall(function()
    vim.fn.system("python3 -c 'import pynvim'")
  end)
  if python_ok and vim.v.shell_error == 0 then
    health.ok("Python pynvim provider installed")
  else
    health.warn("Python pynvim provider not installed - run: pip install pynvim")
  end

  -- Check Lazy.nvim
  local lazy_ok, lazy = pcall(require, "lazy")
  if lazy_ok then
    health.ok("Lazy.nvim loaded")
    local stats = lazy.stats()
    health.info(string.format("Plugins: %d loaded / %d total", stats.loaded, stats.count))
  else
    report_error("Lazy.nvim not loaded")
  end

  -- Check Mason
  local mason_ok, _ = pcall(require, "mason")
  if mason_ok then
    health.ok("Mason.nvim loaded")
    local registry_ok, registry = pcall(require, "mason-registry")
    if registry_ok then
      health.ok("Mason registry loaded")
      for _, package_name in ipairs({ "lua-language-server", "pyright", "typescript-language-server" }) do
        if registry.is_installed(package_name) then
          health.ok(string.format("Mason package '%s' installed", package_name))
        else
          health.warn(string.format("Mason package '%s' is not installed", package_name))
        end
      end
    else
      health.warn("Mason registry not loaded; installed package status unavailable")
    end
  else
    health.warn("Mason.nvim not loaded")
  end

  for _, integration in ipairs({
    { module = "cmp", name = "nvim-cmp" },
    { module = "luasnip", name = "LuaSnip" },
    { module = "nvim-autopairs", name = "nvim-autopairs" },
    { module = "neotest", name = "Neotest" },
    { module = "dap", name = "nvim-dap" },
  }) do
    if pcall(require, integration.module) then
      health.ok(integration.name .. " loaded")
    else
      health.warn(integration.name .. " is not loaded")
    end
  end

  -- Check LSP servers
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if lspconfig_ok then
    health.ok("nvim-lspconfig loaded")
    local servers = { "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls", "yamlls", "bashls", "clangd", "rust_analyzer" }
    for _, server in ipairs(servers) do
      local configs = require("lspconfig.configs")
      if configs[server] and configs[server].manager then
        health.ok(string.format("LSP server '%s' configured", server))
      else
        health.info(string.format("LSP server '%s' not yet configured (install via :Mason)", server))
      end
    end
  else
    health.warn("nvim-lspconfig not loaded")
  end

  -- Check Treesitter parsers
  local ts_ok, ts = pcall(require, "nvim-treesitter")
  if ts_ok then
    health.ok("nvim-treesitter loaded")
    local parsers = { "lua", "python", "javascript", "typescript", "html", "css", "json", "yaml", "markdown", "bash", "vim", "c", "cpp", "rust" }
    local installed = {}
    for _, parser in ipairs(ts.get_installed("parsers")) do
      installed[parser] = true
    end
    for _, parser in ipairs(parsers) do
      local has_parser = installed[parser] == true
      if has_parser then
        health.ok(string.format("Treesitter parser: %s", parser))
      else
        health.warn(string.format("Treesitter parser missing: %s (run :TSInstall %s)", parser, parser))
      end
    end
  else
    health.warn("nvim-treesitter not loaded")
  end

  -- Check formatters/linters
  local conform_ok, conform = pcall(require, "conform")
  if conform_ok then
    health.ok("conform.nvim loaded")
    health.info("Configured formatters are reported by :ConformInfo")
  else
    health.warn("conform.nvim not loaded")
  end

  local lint_ok, _ = pcall(require, "lint")
  if lint_ok then
    health.ok("nvim-lint loaded")
    for _, executable in ipairs({ "pylint", "eslint_d", "markdownlint", "luacheck" }) do
      if vim.fn.executable(executable) == 1 then
        health.ok(string.format("Linter executable '%s' found", executable))
      else
        health.warn(string.format("Linter executable '%s' not found", executable))
      end
    end
  else
    health.warn("nvim-lint not loaded")
  end

  for _, executable in ipairs({ "stylua", "black", "isort", "prettier" }) do
    if vim.fn.executable(executable) == 1 then
      health.ok(string.format("Formatter executable '%s' found", executable))
    else
      health.warn(string.format("Formatter executable '%s' not found", executable))
    end
  end

  health.info("Run :checkhealth for more detailed plugin health checks")
end

return M