return {
  {
    'voldikss/vim-floaterm',
    opts = {},
    config = function()
      vim.g.floaterm_width = 0.85
      vim.g.floaterm_height = 0.85

      vim.keymap.set('n', '<leader>t', ':FloatermToggle<CR>', { noremap = true, silent = true })
      vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, silent = true })
    end,
  },
}
