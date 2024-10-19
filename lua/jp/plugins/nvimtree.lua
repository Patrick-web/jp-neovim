return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require "nvim-tree"

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup {
      view = {
        width = 30,
        preserve_window_proportions = true,
      },
      update_focused_file = {
        enable = true,
        update_cwd = false, -- Set to true if you want to update the current working directory
        ignore_list = {}, -- Add any file patterns to ignore
      },
      -- change folder arrow icons
      renderer = {
        root_folder_label = false,
        highlight_git = false,
        indent_markers = {
          enable = false,
        },
        icons = {
          glyphs = {
            default = "󰈚",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
            },
            -- git = { unmerged = "" },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    }

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
  end,
}
