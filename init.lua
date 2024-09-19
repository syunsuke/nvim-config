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

----------------------------------------------------
--- keymap
----------------------------------------------------
vim.keymap.set('i', 'jj', '<ESC>')


vim.g["skkeleton-config-markerHenkan"] = "[変換]"
vim.g["skkeleton-config-markerHenkanSelect"] = "[選択]"
