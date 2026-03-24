local M = {}

M.config = function()
    return {
        on_attach = require("configs.lsp.mappings").on_attach,
        capabilities = require("nvchad.configs.lspconfig").capabilities,
        root_markers = { "manage.py", "setup.py", ".git" },
    }
end

return M
