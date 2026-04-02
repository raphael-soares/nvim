return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },

    config = function()
        require("nvim-tree").setup({
            view = {
                width = 55,
                preserve_window_proportions = true,
            },
            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = { enable = true },
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
        })
    end,
}
