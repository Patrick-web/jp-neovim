local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.toggle_theme_icon = "   "

-------------------------------------- options ------------------------------------------
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- g.mapleader = " "

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- Exit from insert mode by Esc in Terminal
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Handle command casing mistakes
vim.api.nvim_create_user_command("Q", "quit", { bang = true, desc = "Quit Neovim" })
vim.api.nvim_create_user_command("Qa", "qa", { bang = true, desc = "Quit all Neovim windows" })
vim.api.nvim_create_user_command("W", "write", { bang = true, desc = "Save current buffer" })
vim.g.mapleader = " "
-- Remap {} to scroll half page
vim.api.nvim_set_keymap("n", "{", "<C-U>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "}", "<C-D>", { noremap = true, silent = true })

-- Remap 'p' in visual mode to paste and then yank back into the default register
vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true, silent = true })
