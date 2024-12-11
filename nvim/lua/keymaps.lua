vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = { noremap = true, silent = true}

--visual 模式下的缩进代码
vim.keymap.set("v", "<", "<gv", opt)
vim.keymap.set("v", ">", ">gv", opt)

