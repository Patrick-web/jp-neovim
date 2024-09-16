local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- Import necessary plugins
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"
    local keymap = vim.keymap -- for conciseness

    -- Set up key mappings for LSP actions
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        local opts = { buffer = ev.buf, silent = true }

        -- Set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- Enable autocompletion capabilities
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Mason LSP config handlers
    mason_lspconfig.setup_handlers {
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        }
      end,

      ["denols"] = function()
        lspconfig["denols"].setup {
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
          on_attach = function(client, bufnr)
            -- vim.cmd "LspStop ts_ls"
          end,
        }
      end,

      ["ts_ls"] = function()
        lspconfig["ts_ls"].setup {
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json"),
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
          single_file_support = false,
          on_attach = function(client, bufnr)
            -- Disable formatting from tsserver
            client.server_capabilities.document_formatting = false
          end,
          commands = {
            OrganizeImports = {
              organize_imports,
              description = "Organize Imports",
            },
          },
        }
      end,
      ["volar"] = function()
        require("lspconfig").volar.setup {
          root_dir = require("lspconfig").util.root_pattern(
            "vue.config.js",
            "vue.config.ts",
            "nuxt.config.js",
            "nuxt.config.ts",
            "vite.config.ts",
            "vite.config.js"
          ),
          filetypes = { "vue", "javascript", "typescript" },
          init_options = {
            vue = {
              hybridMode = false,
            },
            typescript = {
              tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
            },
          },
        }
      end,
    }
  end,
}
