local map = vim.keymap.set

-- General
map("n", "<leader>a", "gg<S-v>G", { desc = "Select All" })
map("n", "<C-s>", "<cmd>write<CR>", { desc = "Save" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- Scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center" })

-- Line movement
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Line Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Line Up" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Selection Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Selection Down" })

-- File explorer
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", function()
--     require("oil").toggle_float()
-- end, { desc = "nvimtree toggle window" })

map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "next buffer" })
map("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "previous buffer" })

-- Telescope
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { desc = "Telescope find Files" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fr", function()
    require("telescope.builtin").oldfiles({ cwd_only = true, prompt_title = "Recent Files" })
end, { desc = "telescope recent files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

vim.keymap.set("n", "<leader>q", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end, { desc = "Diagnostics to quickfix" })
