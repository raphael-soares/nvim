-- lua/plugins/lspconfig/keymaps.lua
local M = {}

function M.on_attach(client, bufnr)
    local map = function(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
    map("n", "gr", vim.lsp.buf.references, { desc = "References" })
    map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
    map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })

    map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    map({ "n", "v" }, "<leader>cr", require("nvchad.lsp.renamer"), { desc = "Code Rename" })
    map({ "n", "v" }, "<leader>cf", function()
        require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format Code" })

    require("nvchad.configs.lspconfig").on_attach(client, bufnr)
end

return M
