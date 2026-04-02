return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "-", "<cmd>Oil<CR>", desc = "Abrir diretório pai (Oil)" },
    },
    config = function()
        require("oil").setup({
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-p>"] = "actions.preview",
                ["q"] = "actions.close",
                ["g."] = "actions.toggle_hidden",
            },
        })
    end,
}
