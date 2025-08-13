return {
  'kylechui/nvim-surround',
  version = '*', -- Use for stability; omit to use `main` branch for the latest features
  event = 'VeryLazy',
  config = function()
    require('nvim-surround').setup({
      keymaps = {
        visual = 's',
      },
      surrounds = {

        ['('] = {
          add = { '(', ')' },
          find = function()
            return M.get_selection({ motion = 'a(' })
          end,
          delete = '^(.)().-(.)()$',
        },

        ['{'] = {
          add = { '{', '}' },
          find = function()
            return M.get_selection({ motion = 'a{' })
          end,
          delete = '^(.)().-(.)()$',
        },

        ['<'] = {
          add = { '<', '>' },
          find = function()
            return M.get_selection({ motion = 'a<' })
          end,
          delete = '^(.)().-(.)()$',
        },
        ['['] = {
          add = { '[', ']' },
          find = function()
            return M.get_selection({ motion = 'a[' })
          end,
          delete = '^(.)().-(.)()$',
        },
      },
    })
  end,
}
