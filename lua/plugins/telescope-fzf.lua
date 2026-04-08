return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.extensions = vim.tbl_deep_extend("force", opts.extensions or {}, {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      })
      return opts
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
    end,
  },
}
