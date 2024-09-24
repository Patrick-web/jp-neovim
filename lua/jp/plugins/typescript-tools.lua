return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()
    local lspconfig = require "lspconfig"
    return {
      root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
    }
  end,
}
