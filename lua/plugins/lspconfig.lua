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

        local icons = {
            [vim.diagnostic.severity.ERROR] = "󰅙",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
        }

        vim.diagnostic.config({
            severity_sort = true,
            update_in_insert = false,
            signs = { text = icons },
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = function(diagnostic)
                    return icons[diagnostic.severity] or "●"
                end,
            },
            float = {
                border = "rounded",
                source = "if_many",
            },
            jump = { float = true },
            underline = true,
        })
    end,
}
