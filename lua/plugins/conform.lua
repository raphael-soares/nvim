return {
    "stevearc/conform.nvim",
    even = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            vue = { "prettier" },
            typescript = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            html = { "prettier" },
        },

        format_on_save = {
            timeout_ms = 300,
            lsp_fallback = true,
        },
    },
}
