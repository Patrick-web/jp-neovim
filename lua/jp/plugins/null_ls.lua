local cspell_config = {
  find_json = function()
    return vim.fn.expand "~/.config/nvim/lua/jp/cspell.json"
  end,
}

return {
  "nvimtools/none-ls.nvim",
  dependencies = "davidmh/cspell.nvim",
  -- enabled = false,
  config = function()
    local null_ls = require "null-ls"
    local cspell = require "cspell"

    local function on_attach(client, buffer)
      -- Check if the buffer is NvimTree
      if vim.bo[buffer].filetype == "NvimTree" then
        -- Disable diagnostics for NvimTree
        if client.resolved_capabilities ~= nil then
          client.resolved_capabilities.document_diagnostics = false
        end
      end
    end

    null_ls.setup {
      fallback_severity = vim.diagnostic.severity.WARN,
      sources = {
        cspell.diagnostics.with { config = cspell_config },
        cspell.code_actions.with { config = cspell_config },
      },
      on_attach = on_attach,
    }
  end,
}
