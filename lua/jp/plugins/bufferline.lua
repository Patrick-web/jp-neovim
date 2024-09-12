return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Use a table for dependencies
  config = function() -- Configuration function
    local bufferline = require "bufferline"
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            separator = true,
          },
        },
        sort_by = "insert_after_current",
        show_close_icon = false,
        show_buffer_close_icons = false,
        themable = true,
        separator_style = "slope",
        tab_separator = {
          fg = "#000000",
          bg = "#000000",
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match "error" and " " or ""
          return " " .. icon .. count
        end,
      },
    }
  end,
}
