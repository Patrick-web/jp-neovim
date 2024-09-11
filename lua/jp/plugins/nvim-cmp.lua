local function border(hl_name)
  return {
    { "╭", hl_name }, -- Top-left corner
    { "─", hl_name }, -- Top border
    { "╮", hl_name }, -- Top-right corner
    { "│", hl_name }, -- Right border
    { "╯", hl_name }, -- Bottom-right corner
    { "─", hl_name }, -- Bottom border
    { "╰", hl_name }, -- Bottom-left corner
    { "│", hl_name }, -- Left border
  }
end
vim.api.nvim_set_hl(0, "CmpSel", { bg = "#90CAF9", fg = "#424242" })
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*", -- Latest release
      build = "make install_jsregexp", -- Optional build step
    },
    "saadparwaiz1/cmp_luasnip", -- For autocompletion
    "rafamadriz/friendly-snippets", -- Useful snippets
    "onsails/lspkind.nvim", -- VS Code-like pictograms
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    -- Load VS Code style snippets from installed plugins
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup {
      window = {
        completion = {
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,FloatBorder:CmpBorder", -- Highlight groups
          scrollbar = false,
          border = border "CmpBorder", -- Add border to completion window
        },
        documentation = {
          border = border "CmpDocBorder", -- Add border to documentation window
          winhighlight = "Normal:CmpDoc",
        },
      },
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expand snippets
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<ArrowUp>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<ArrowDown>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Previous suggestion (Shift + Tab)
        ["<Tab>"] = cmp.mapping.select_next_item(), -- Next suggestion (Tab)
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
        ["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- Close completion window
        ["<CR>"] = cmp.mapping.confirm { select = false }, -- Confirm selection
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" }, -- LSP source
        { name = "luasnip" }, -- Snippet source
        { name = "buffer" }, -- Text within current buffer
        { name = "path" }, -- File system paths
      },
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = "...",
        },
      },
    }
  end,
}
