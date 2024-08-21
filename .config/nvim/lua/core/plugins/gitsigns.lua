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
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[G]it [H]unk [S]tage' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[G]it [H]unk [R]eset' })
        map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = '[G]it [H]unk [U]ndo Stage' })
        map('v', '<leader>ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [s]tage Hunk' })
        map('v', '<leader>ghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [r]eset Hunk' })

        -- buffer
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage Buffer' })
        map('n', '<leader>gR', gitsigns.reset_buffer_index, { desc = '[G]it [R]eset Buffer' })

        -- diff
        local builtin = require 'telescope.builtin'
        local actions = require 'telescope.actions'
        local action_state = require 'telescope.actions.state'

        local diff_with_selection = function(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          local branch_name = selection.name
          actions.close(prompt_bufnr)
          gitsigns.diffthis(branch_name)
        end

        local function diff_with_branch()
          builtin.git_branches {
            attach_mappings = function(_, attach_map)
              attach_map('i', '<CR>', diff_with_selection)
              attach_map('n', '<CR>', diff_with_selection)
              return true
            end,
          }
        end

        vim.keymap.set('n', '<leader>gds', diff_with_branch, { desc = '[G]it [D]iff [S]elect' })
        vim.keymap.set('n', '<leader>gdt', gitsigns.diffthis, { desc = '[G]it [D]iff [T]his' })
        vim.keymap.set('n', '<leader>gdh', function()
          gitsigns.diffthis 'HEAD~'
        end, { desc = '[G]it [D]iff [H]ead' })
      end,
    },
  },
}
