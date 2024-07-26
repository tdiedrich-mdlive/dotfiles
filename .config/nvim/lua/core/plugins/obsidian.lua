return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'work',
          path = '~/notes',
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      picker = {
        name = 'telescope.nvim',
      },
      follow_url_func = function(url)
        vim.fn.jobstart { 'open', url }
      end,
    },
  },
}
