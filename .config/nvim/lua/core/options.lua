vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.statuscolumn = '%-2{v:relnum} %-3{v:lnum} %=%s'

vim.opt.mouse = 'a'

vim.opt.showmode = false

-- sync clipboard w/ os
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250

vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.cursorline = true

vim.opt.scrolloff = 10

-- conceal level for obsidian.nvim
vim.opt.conceallevel = 1

vim.opt.hlsearch = true
