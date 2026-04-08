return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "-", "<cmd>Oil<CR>", desc = "Open oil" },
    },
    config = function()
        require("oil").setup({

            columns = { "icon" },
            view_options = {
                show_hidden = false,
                is_hidden_file = function(name, bufnr)
                    if name == ".." then return false end
                    return name:match("^%.") ~= nil
                end,
            },
            keymaps = {
                ["-"] = "actions.parent",
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
