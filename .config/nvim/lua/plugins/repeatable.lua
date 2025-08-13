if vim.g.vscode then
  local vscode = require('vscode')
  return {
    'genesy/repeatable.nvim',
    opts = {
      functions = {
        bookmarks_jump_to_next = function()
          vscode.action('bookmarks.jumpToNext')
        end,
        bookmarks_jump_to_previous = function()
          vscode.action('bookmarks.jumpToPrevious')
        end,
        bookmarks_toggle = function()
          vscode.action('bookmarks.toggle')
        end,
      }
    }
  }
else

local function center_view()
  vim.cmd('normal! zz')
end
local gitsigns = require('gitsigns')

return {
  'genesy/repeatable.nvim',
  -- dir = '~/projects/repeatable.nvim',
  opts = {
    functions = {
      next_hunk = function()
        gitsigns.nav_hunk('next', { greedy = true })
        center_view()
      end,

      prev_hunk = function()
        gitsigns.nav_hunk('prev', { greedy = true })
        center_view()
      end,

      next_diagnostic = function()
        vim.diagnostic.goto_next({
          float = false,
        })
        center_view()
      end,

      prev_diagnostic = function()
        vim.diagnostic.goto_prev({
          float = false,
        })
        center_view()
      end,
    },
  },
}
end
