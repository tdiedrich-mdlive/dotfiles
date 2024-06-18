return {
  {
    'f-person/git-blame.nvim',
    opts = {},
    config = function()
      local git_blame = require 'gitblame'

      git_blame.disable()

      vim.keymap.set('n', '<leader>gb', function()
        git_blame.toggle()
      end, { desc = 'Toggle [G]it [B]lame' })

      vim.keymap.set('n', '<leader>gu', function()
        git_blame.open_commit_url()
      end, { desc = 'Open [G]it [U]RL' })
    end,
  },
}
