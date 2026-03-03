return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antosha417/nvim-lsp-file-operations",
    },

    config = function()
        local api = require("nvim-tree.api")

        local function custom_on_attach(bufnr)
            local opts = { buffer = bufnr }

            api.config.mappings.default_on_attach(bufnr)

            local function lefty()
                local node = api.tree.get_node_under_cursor()
                if not node then
                    return
                end

                if node.nodes and node.open then
                    api.node.open.edit()
                else
                    api.node.navigate.parent()
                    api.node.open.edit()
                end
            end

            local function righty()
                local node = api.tree.get_node_under_cursor()
                if not node then
                    return
                end

                api.node.open.edit()
            end

            vim.keymap.set("n", "h", lefty, opts)
            vim.keymap.set("n", "l", righty, opts)
        end

        require("lsp-file-operations").setup({
            debug = false,
            timeout_ms = 2000,
        })

        if vim.g.base46_cache then
            dofile(vim.g.base46_cache .. "nvimtree")
        end

        require("nvim-tree").setup({
            on_attach = custom_on_attach,
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
