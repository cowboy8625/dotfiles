local api = vim.api

local function splash_screen()
    local a = tostring(vim.api.nvim_get_current_line())
    -- local a = "Hello World"
    -- vim.nvim_paste(a)
    -- print(vim.nvim_win_get_width(0), vim.nvim_win_get_height(0))
    print(vim.api.nvim_win_get_height(0), vim.api.nvim_win_get_width(0))
    buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_paste(a, 'CR', 1)
end


return {
    splash_screen = splash_screen
}
