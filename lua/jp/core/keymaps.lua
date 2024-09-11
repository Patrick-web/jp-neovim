local map = vim.keymap.set

-- ===========================
-- Insert Mode Mappings
-- ===========================
map("i", "<C-b>", "<ESC>^i", { desc = "Move to the beginning of the line" })
map("i", "<C-e>", "<End>", { desc = "Move to the end of the line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- ===========================
-- Normal Mode Mappings
-- ===========================
-- Window Navigation

-- Switch between windows using Ctrl + arrow keys
map("n", "<C-S-Left>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-S-Right>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-S-Down>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-S-Up>", "<C-w>k", { desc = "Switch window up" })

-- General Commands
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line numbers" })
-- map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative numbers" }) -- Commented out
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- Formatting
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format file" })

-- Buffer Management
map("n", "<leader>qq", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close buffer" })
map("n", "<leader>qo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })

-- Commenting
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- ===========================
-- NvimTree Mappings
-- ===========================
map("n", "<leader>b", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- ===========================
-- Telescope Mappings
-- ===========================
map("n", "<leader>f", ":Telescope<CR>", { desc = "Telescope commands" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help tags" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find old files" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Telescope find git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Telescope pick hidden term" })
map("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Telescope NVChad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope find all files" })
map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope find all references" })
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "Telescope find all references" })
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "LSP hover information" })

map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Telescope show workspace symbols" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope show document symbols" })
map("n", "R", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP rename symbol" })
map("n", "A", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP code actions" })
map("n", "D", vim.diagnostic.open_float, { desc = "LSP diagnostic loclist" })

map("n", "<leader>tr", "<cmd>Telescope resume<CR>", { desc = "Telescope resume last search" })

-- ===========================
-- Terminal Mappings
-- ===========================
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Escape terminal mode" })

-- New Terminals
map("n", "<leader>t", ":terminal<CR>", { desc = "New terminal commands" })
map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "New horizontal terminal" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "New vertical terminal" })

-- Toggleable Terminals
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Toggle vertical terminal" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle horizontal terminal" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle floating terminal" })

-- ===========================
-- WhichKey Mappings
-- ===========================
map("n", "<leader>w", ":WhichKey<CR>", { desc = "WhichKey commands" })
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Show all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "Lookup WhichKey" })

-- ===========================
-- nvim-spectre Mappings
-- ===========================
map("n", "<leader>c", ":BlanklineCommands<CR>", { desc = "Blankline commands" })
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "Jump to current context in blankline" })


-- ===========================
-- Blankline Mappings
-- ===========================
map('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre"
})
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})
