-- config/autocmds.lua
if vim.fn.argc(-1) == 0 then
  vim.cmd "NvimTreeOpen"
end

-- Delete unused imports and organize imports on saving .ts and .tsx files
local jp_group = vim.api.nvim_create_augroup("jpgroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = jp_group,
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    -- Create a function to organize imports
    local function organize_imports()
      -- Execute the command to organize imports
      vim.cmd "OrganizeImports"
      -- Wait for the command to finish (optional, adjust time as needed)
      vim.wait(1000)
      -- Save the buffer after organizing imports
      vim.cmd "write"
    end

    -- Load lspconfig to find the root directory
    local lspconfig = require "lspconfig"

    -- Get the root directory based on specific project files
    local root_dir =
      lspconfig.util.root_pattern("tsconfig.json", "jsconfig.json", "package.json")(vim.fn.expand "%:p:h")

    -- Check if we found a valid root directory and if it's indeed a project root
    if root_dir then
      local current_dir = vim.fn.expand "%:p:h" -- Get current file's directory

      -- Check if the current directory matches the identified root directory
      if current_dir == root_dir then
        organize_imports() -- Call the function only if in a valid project root
      end
    end
  end,
})
