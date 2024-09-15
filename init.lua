vim.api.nvim_create_user_command("Q", "quit", { bang = true, desc = "Quit Neovim" })
vim.api.nvim_create_user_command("Qa", "qa", { bang = true, desc = "Quit all Neovim windows" })
vim.api.nvim_create_user_command("W", "write", { bang = true, desc = "Save current buffer" })

require "jp.core"
require "jp.lazy"
require "current-theme"
require "jp.autocommands"
