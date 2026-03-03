local M = {}

M.setup = function()
    require("nvchad.configs.lspconfig").defaults()

    local nvlsp = require("nvchad.configs.lspconfig")
    local keymaps = require("configs.lsp.mappings")

    local vuejs = require("configs.lsp.lang.vue")

    local servers = {
        "lua_ls",
        "html",
        "cssls",
        "clangd",
        "pyright",
        "tailwindcss",
        "jsonls",
        "terraformls",
    }

    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
            on_attach = keymaps.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
        })
    end

    local custom_servers = {
        "vue_ls",
        "vtsls",
    }

    vim.lsp.config("vue_ls", vuejs.vue_ls())
    vim.lsp.config("vtsls", vuejs.vtsls())

    vim.lsp.enable(servers)
    vim.lsp.enable(custom_servers)
end

return M
