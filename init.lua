require("config.lazy")

----------------------------------------------------
--- opt
----------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.smarttab = true

vim.opt.clipboard = "unnamedplus"



----------------------------------------------------
--- keymap
----------------------------------------------------
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('n', '<leader>rr', '<CMD>Jaq<CR>')

--vim.keymap.set('n', '<space>k', vim.diagnostic.open_float, { desc = 'LSP diagnostic open_float' })
--vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = 'Lspsaga hover doc' })

--vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })









