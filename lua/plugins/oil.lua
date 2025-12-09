return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "refractalize/oil-git-status.nvim" },
    lazy = false,
    opts = {
        win_options = {
            signcolumn = "yes:2",
        },
        columns = { "icon" },

        view_options = {
            show_hidden = true,

            is_always_hidden = function(name, bufnr)
                if name == ".git" then
                    return true
                end

                if name == ".." then
                    local dir = require("oil").get_current_dir(bufnr)
                    local cwd = vim.fn.getcwd()

                    if dir and cwd then
                        dir = dir:gsub("/$", "")

                        return dir == cwd
                    end
                end

                return false
            end,
        },

        float = {
            padding = 2,
            max_width = 100,
            max_height = 30,
            border = { " ", " ", " ", " ", " ", " ", " ", " " },

            win_options = {
                winblend = 0,
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat,FloatTitle:TelescopePromptTitle",
            },

            override = function(conf)
                local title = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
                conf.title = "  " .. title .. "  "
                conf.title_pos = "center"
                return conf
            end,
        },

        preview = {
            max_width = 0.9,
            min_width = { 40, 0.4 },
            border = { " ", " ", " ", " ", " ", " ", " ", " " },
            win_options = {
                winblend = 0,
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat,FloatTitle:TelescopePromptTitle",
            },
        },

        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["q"] = "actions.close",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
        },
    },
    config = function(_, opts)
        require("oil").setup(opts)
        require("oil-git-status").setup({
            show_ignored = false,
        })
    end,
}
