return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  options = {
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false,       -- add a border to hover docs and signature help
    style_preset = "default",     -- tabline style preset
    offsets = {
      {
        filetype = "NvimTree", -- Adjust this based on your file explorer
        text = "File Explorer",
        text_align = "center",
        separator = true,
        padding = 1, -- Adjust this value to increase spacing
      },
    },
    separator_style = "slant", -- Choose your preferred separator style
    always_show_bufferline = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end
  },
  highlights = {
    separator = {
      thick = true
    },
    buffer_selected = {
      bold = true,
    },
  },
}
