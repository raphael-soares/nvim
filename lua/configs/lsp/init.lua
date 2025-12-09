local M = {}

M.setup = function()
    require("nvchad.configs.lspconfig").defaults()

    local nvlsp = require("nvchad.configs.lspconfig")
    local keymaps = require("configs.lsp.mappings")

    local clang = require("configs.lsp.lang.clang")
    local vuejs = require("configs.lsp.lang.vue")

    local servers = {
        "lua_ls",
        "html",
        "cssls",
        "clangd",
        "pyright",
        "tailwindcss",
        "vtsls",
        "vue_ls",
        "jsonls",
    }

    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
            on_attach = keymaps.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
        })
    end

    vim.lsp.config("clangd", clang.config())
    vim.lsp.config("vue_ls", vuejs.vue_ls())
    vim.lsp.config("vtsls", vuejs.vtsls())

    vim.lsp.enable(servers)
end

return M
