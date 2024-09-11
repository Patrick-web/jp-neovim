return {
  "ramilito/winbar.nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("winbar").setup({
      icons = true,
      diagnostics = true,
      buf_modified = true,
      buf_modified_symbol = "M",   -- or use an icon
      dim_inactive = {
        enabled = false,
        highlight = "WinbarNC",
        icons = true,
        name = true,
      },
    })
  end
}
