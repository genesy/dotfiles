if true then
  return {}
end

local originalConceallevel = vim.opt.conceallevel:get()

return {
  {
    '3rd/image.nvim',
    dependencies = {
      'kiyoon/magick.nvim',
    },
    opts = {},
  },
  {
    '3rd/diagram.nvim',
    dependencies = {
      '3rd/image.nvim',
    },
    opts = {},
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      '3rd/diagram.nvim',
    },
    config = function()
      require('obsidian').setup({
        ui = {
          enable = false,
        },
        workspaces = {
          {
            name = 'personal',
            path = '~/vaults/personal',
          },
          {
            name = 'work',
            path = '~/vaults/work',
          },
        },
        callbacks = {
          post_set_workspace = function(client, workspace)
            print('Workspace set to ' .. workspace.name)
            vim.opt.conceallevel = 2
            require('diagram').setup({
              integrations = {
                require('diagram.integrations.markdown'),
                require('diagram.integrations.neorg'),
              },
              renderer_options = {
                mermaid = {
                  theme = 'dark',
                  background = 'transparent',
                  scale = 2,
                },
                plantuml = {
                  charset = 'utf-8',
                },
                d2 = {
                  theme_id = 1,
                },
              },
            })
          end,
          -- enter_note = function(client, note)
          -- end,
          -- exit_note = function(client, note)
          --   vim.opt.conceallevel = originalConceallevel
          -- end,
        },
      })
    end,
  },
  {
    'OXY2DEV/markview.nvim',
    config = function()
      require('markview').setup({
        hybrid_modes = { 'n' },
      })
    end,
  },
}
