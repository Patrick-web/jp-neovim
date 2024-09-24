return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "andrewberty/telescope-themes",
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        width = 0.9,
        height = 0.9,
        preview_cutoff = 1,
        mirror = true,
      },
      mappings = {
        n = {
          ["<C-v>"] = require("telescope.actions").select_vertical, -- For normal mode
          ["q"] = require("telescope.actions").close,
        },
        i = {
          ["<C-v>"] = require("telescope.actions").select_vertical, -- For insert mode
          ["<Esc>"] = require("telescope.actions").close,
        },
      },
      file_ignore_patterns = { "^assets/" },
    },
    pickers = {},
    extensions = {
      themes = {
        enable_previewer = true,
        enable_live_preview = true,
        light_themes = {
          ignore = true,
          keywords = { "light", "day", "frappe" },
        },
        persist = {
          enabled = true,
        },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "themes"
  end,
}
