---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "gruvchad",
    transparency = true,
    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.mason = {
    pkgs = {
        "basedpyright",
        "clangd",
        "css-lsp",
        "django-language-server",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "prettier",
        "stylua",
        "tailwindcss-language-server",
        "terraform-ls",
        "vtsls",
        "vue-language-server",
    },
}

M.ui = {
    tabufline = { enabled = false },
    statusline = {
        separator_style = "block",
    },
}

M.nvimtree = {
    enabled = false,
}

return M
