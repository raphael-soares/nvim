return {
    "stevearc/oil.nvim",
    dependencies = {
        { "nvim-mini/mini.icons", opts = {} },
    },
    keys = {
        { "-", "<cmd>Oil<CR>", desc = "Abrir diretório pai (Oil)" },
    },
    config = function()
        require("oil").setup({
            win_options = {
                signcolumn = "yes:2",
            },
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

        -- 2. Setup do Git Status com ícones informativos
        require("oil-git-status").setup({
            symbols = {
                index = {
                    ["!"] = "󰛑", -- Ignored
                    ["?"] = "", -- Untracked
                    ["A"] = "", -- Added
                    ["C"] = "󰆏", -- Copied
                    ["D"] = "", -- Deleted
                    ["M"] = "", -- Modified
                    ["R"] = "", -- Renamed
                    ["T"] = "󰏫", -- Type changed
                    ["U"] = "", -- Unmerged
                },
                working_tree = {
                    ["!"] = "",
                    ["?"] = "",
                    ["A"] = "",
                    ["C"] = "󰆏",
                    ["D"] = "",
                    ["M"] = "",
                    ["R"] = "",
                    ["T"] = "󰏫",
                    ["U"] = "",
                },
            },
        })
    end,
}
