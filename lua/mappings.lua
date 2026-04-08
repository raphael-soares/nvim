local map = vim.keymap.set

-- General
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save" })
map("n", "<leader><leader>", "<C-^>", { desc = "Alternate last file" })
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

map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "next buffer" })
map("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "previous buffer" })
map("n", "<leader>bd", ":bp | bd #<CR>", { desc = "Deletar Buffer mantendo split" })
map("n", "<leader>bf", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })

-- LSP extra mappings
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map({ "n", "v" }, "<leader>cf", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format Code" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Telescope find Files" })
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", { desc = "Telescope live grep" })
map("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>m", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>z", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>r", function()
    require("telescope.builtin").oldfiles({ cwd_only = true, prompt_title = "Recent Files" })
end, { desc = "telescope recent files" })
map(
    "n",
    "<leader>a",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "telescope find all files" }
)

map("n", "<leader>q", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end, { desc = "Diagnostics to quickfix" })

-- Markdown Preview
map("n", "<leader>mps", "<cmd>MarkdownPreview<cr>", { desc = "Markdown: Start preview" })
map("n", "<leader>mpS", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown: Stop preview" })
map("n", "<leader>mpr", "<cmd>MarkdownPreviewRefresh<cr>", { desc = "Markdown: Refresh preview" })
