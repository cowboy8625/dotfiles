local function python_repr ( )
    -- Gets Line number of cursor
    local line_num = vim.api.nvim_call_function("line", {'.'})
    -- Grabs line under cursor
    local code = tostring(vim.api.nvim_get_current_line())
    -- Creates a Key press
    local key = vim.api.nvim_replace_termcodes("O<ESC>", true, false, true)
    -- Runs Action
    vim.api.nvim_feedkeys(key, 'n', true)
    -- Runs Python Code
    local output = vim.api.nvim_command_output('py3 ' .. code)
    -- Places cursor on line below ran code.
    vim.api.nvim_call_function("cursor", {line_num + 1, 0})
    -- Paste Python code to file.
    vim.api.nvim_paste("# " .. output .. "\n", 'CR', 0)
end

return {
    python_repr = python_repr
}
