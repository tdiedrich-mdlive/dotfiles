return {
  {
    'numToStr/FTerm.nvim',
    opts = {},
    config = function()
      local ft = require 'FTerm'

      vim.keymap.set('n', '<leader>ft', function()
        ft.toggle()
      end)
      vim.keymap.set('t', '<Esc>', function()
        ft.toggle()
      end)
    end,
  },
}
