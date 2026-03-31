return {
    "neovim/nvim-lspconfig",
    config = function()
        local nvlsp = require("nvchad.configs.lspconfig")

        local servers = {
            "lua_ls",
            "html",
            "cssls",
            "clangd",
            "basedpyright",
            "tailwindcss",
            "jsonls",
            "marksman",
            "djls",
            "terraformls",
        }

        for _, lsp in ipairs(servers) do
            vim.lsp.config(lsp, {
                on_attach = nvlsp.on_attach,
                on_init = nvlsp.on_init,
                capabilities = nvlsp.capabilities,
            })
        end

        local vuejs = require("configs.lsp.vue")
        vim.lsp.config("vue_ls", vuejs.vue_ls())
        vim.lsp.config("vtsls", vuejs.vtsls())

        vim.lsp.enable(vim.list_extend(servers, { "vue_ls", "vtsls" }))
    end,
}
