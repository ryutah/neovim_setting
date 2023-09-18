vim.opt.hidden = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = "tab:>.,trail:·,eol:↲,extends:❯,precedes:❮,nbsp:␣"
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932"
vim.opt.fileformats = "unix,dos,mac"
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.iskeyword:append("-")
vim.opt.guicursor:append("c:ver10")
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.opt.diffopt = 'vertical'
vim.opt.updatetime = 1000
