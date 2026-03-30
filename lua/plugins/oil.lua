return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    config = function()
        require("oil").setup({})
    end,
}
