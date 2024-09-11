local M = {}

function M.save_theme(theme)
    vim.api.nvim_set_var('selected_theme', theme)
end

return M
