require("nvchad.options")

local o = vim.o

o.conceallevel = 2
o.concealcursor = "nc"

o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.number = true
o.relativenumber = true
o.swapfile = false
o.scrolloff = 10
o.signcolumn = "yes"

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
