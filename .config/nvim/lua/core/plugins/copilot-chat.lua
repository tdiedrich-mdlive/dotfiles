return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {
      debug = true,
      show_help = true,
      window = { layout = 'float', width = 0.8, height = 0.8 },
      proxy = 'http://127.0.0.1:9000',
    },
    build = 'make tiktoken',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>cc',
        function()
          local chat = require 'CopilotChat'
          chat.toggle()
        end,
        desc = '[C]opilot [C]hat',
      },
      {
        '<Esc>',
        function()
          local chat = require 'CopilotChat'
          chat.close()
        end,
      },
    },
  },
}
