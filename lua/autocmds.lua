local autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-- highlight yank
autocmd("TextYankPost", {
    group = create_augroup("highlight_yank", { clear = true }),
    pattern = "*",
    desc = "highlight selection on yank",
    callback = function()
        vim.highlight.on_yank({ timeout = 200, visual = true })
    end,
})

-- restore cursor to file position in previous editing session
autocmd("BufReadPost", {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.api.nvim_win_set_cursor(0, mark)
            -- defer centering slightly so it's applied after render
            vim.schedule(function()
                vim.cmd("normal! zz")
            end)
        end
    end,
})

-- open help in vertical split
autocmd("FileType", {
    pattern = "help",
    command = "wincmd L",
})

-- auto resize splits when the terminal's window is resized
autocmd("VimResized", {
    command = "wincmd =",
})

-- no auto continue comments on new line
autocmd("FileType", {
    group = create_augroup("no_auto_comment", { clear = true }),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- syntax highlighting for dotenv files
autocmd("BufRead", {
    group = create_augroup("dotenv_ft", { clear = true }),
    pattern = { ".env", ".env.*" },
    callback = function()
        vim.bo.filetype = "dosini"
    end,
})

-- show cursorline only in active window enable
autocmd({ "WinEnter", "BufEnter" }, {
    group = create_augroup("active_cursorline", { clear = true }),
    callback = function()
        vim.opt_local.cursorline = true
    end,
})

-- show cursorline only in active window disable
autocmd({ "WinLeave", "BufLeave" }, {
    group = "active_cursorline",
    callback = function()
        vim.opt_local.cursorline = false
    end,
})

-- ide like highlight when stopping cursor
local lsp_highlight_group = vim.api.nvim_create_augroup("LspReferenceHighlight", { clear = true })

autocmd("CursorHold", {
    group = lsp_highlight_group,
    desc = "Highlight references under cursor",
    callback = function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client.server_capabilities.documentHighlightProvider then
                vim.lsp.buf.document_highlight()
                break
            end
        end
    end,
})

autocmd("CursorMoved", {
    group = lsp_highlight_group,
    callback = function()
        vim.lsp.buf.clear_references()
    end,
})
