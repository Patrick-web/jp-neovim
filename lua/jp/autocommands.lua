-- config/autocmds.lua
if vim.fn.argc(-1) == 0 then
  vim.cmd "NvimTreeOpen"
end
