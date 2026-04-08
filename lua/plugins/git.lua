return {
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "GMove", "GDelete", "Gedit" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>",               desc = "Git status" },
      { "<leader>gd", "<cmd>Gdiffsplit<cr>",        desc = "Git diff" },
      { "<leader>gb", "<cmd>Git blame<cr>",         desc = "Git blame" },
      { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log" },
      { "<leader>gw", "<cmd>Gwrite<cr>",            desc = "Git add file" },
      { "<leader>gr", "<cmd>Gread<cr>",             desc = "Git checkout file" },
    },
  },
}
