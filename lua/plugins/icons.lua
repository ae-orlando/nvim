return {
  "echasnovski/mini.icons",
  version = false,
  opts = {},
  config = function(_, opts)
    local icons = require("mini.icons")
    icons.setup(opts)

    -- Mocks nvim-web-devicons so Telescope, Neo-tree, and statuslines work automatically
    icons.mock_nvim_web_devicons()
  end,
}
