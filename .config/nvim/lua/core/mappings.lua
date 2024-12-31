vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Write current buffer to clipboard
vim.keymap.set('n', '<leader>cb', '<cmd>:let @+=expand("%")<cr>', { desc = 'Get [C]urrent [B]uffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>sp', function()
  vim.cmd.set 'spell!'
end, { desc = 'Toggle [Sp]ell checking' })

vim.keymap.set('n', '<leader>rl', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Toggle [R]e[l]ative numbering' })

vim.keymap.set('n', '<C-i>', '<C-^>', { noremap = true, silent = true })
