return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      signs_staged_enable = true,
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        local gitsigns = require 'gitsigns'

        -- blame
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle [G]it Blame' })

        -- movement
        map('n', '<leader>gj', gitsigns.next_hunk, { desc = '[G]it Next Hunk' })
        map('n', '<leader>gk', gitsigns.prev_hunk, { desc = '[G]it Previous Hunk' })

        -- hunks
        -- map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it [s]tage Hunk' })
        -- map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it [r]eset Hunk' })
        -- map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[G]it [u]ndo Hunk Stage' })
        -- map('v', '<leader>gs', function()
        --   gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        -- end, { desc = '[G]it [s]tage Hunk' })
        -- map('v', '<leader>gr', function()
        --   gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        -- end, { desc = '[G]it [r]eset Hunk' })

        -- buffer
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage Buffer' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[G]it [R]tage Buffer' })

        -- diff
        map('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it [D]iff This' })
      end,
    },
  },
}
