return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "lua",
            "javascript",
            "typescript",
            "html",
            "vue",
            "css",
            "json",
            "python",
            "bash",
            "markdown",
            "tsx",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}
