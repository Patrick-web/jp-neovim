return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local hooks = require "ibl.hooks"

    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F8D7DA" }) -- Very faint Red
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9F2DB" }) -- Very faint Yellow
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#D1E8F5" }) -- Very faint Blue
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FCE8D5" }) -- Very faint Orange
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#E3F9E5" }) -- Very faint Green
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#F1D6EB" }) -- Very faint Violet
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#D6EAF8" }) -- Very faint Cyan
    end)

    require("ibl").setup {
      indent = {
        -- highlight = highlight,
        char = ".",
      },
      scope = {
        enabled = true,
        char = "│",
      },
    }
  end,
}
