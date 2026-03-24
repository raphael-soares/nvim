local M = {}

M.setup = function()
    local nvlsp = require("nvchad.configs.lspconfig")
    local keymaps = require("configs.lsp.mappings")

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

    local vuejs = require("configs.lsp.lang.vue")
    vim.lsp.config("vue_ls", vuejs.vue_ls())
    vim.lsp.config("vtsls", vuejs.vtsls())

    local django = require("configs.lsp.lang.djlsp")
    vim.lsp.config("djlsp", django.config())

    vim.lsp.enable(vim.list_extend(servers, { "vue_ls", "vtsls", "djlsp" }))
end

return M
