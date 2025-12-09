return {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },

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

        dofile(vim.g.base46_cache .. "nvimtree")

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
            -- A mágica que você quer:
            update_focused_file = {
                enable = true, -- sempre mantém o NvimTree focado no arquivo atual
                update_cwd = true, -- opcional: muda o CWD para o do arquivo
            },
            hijack_directories = {
                enable = true,
                auto_open = true, -- abre NvimTree quando abrir uma pasta
            },
        })
    end,
}
