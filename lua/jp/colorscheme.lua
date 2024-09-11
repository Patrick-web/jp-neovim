local M = {}

-- Function to save the current colorscheme to a file
function M.save_colorscheme(theme)
    local file = io.open(vim.fn.stdpath("config") .. "/colorscheme.txt", "w")
    if file then
        file:write(theme)
        file:close()
    end
end

-- Function to load the colorscheme from the file
function M.load_colorscheme()
    local file = io.open(vim.fn.stdpath("config") .. "/colorscheme.txt", "r")
    if file then
        local theme = file:read("*a")
        file:close()
        return theme
    end
    return nil
end

return M
