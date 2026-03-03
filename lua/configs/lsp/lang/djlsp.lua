local M = {}

M.config = function(on_attach_default, capabilities)
    local lspconfig = require("lspconfig")

    return {
        on_attach = on_attach_default,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern("manage.py", "setup.py", ".git"),
    }
end

return M
