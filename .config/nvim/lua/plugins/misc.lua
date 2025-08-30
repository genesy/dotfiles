return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.ai').setup()
    end,
  },
  -- {
  --   'wakatime/vim-wakatime',
  --   lazy = false,
  -- },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
      scroll_down = '<c-j>', -- binding to scroll down inside the popup
      scroll_up = '<c-k>', -- binding to scroll up inside the popup
    },
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = 'lazydev',
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    cond = not vim.g.vscode,
    opts = {},
  },
  {
    'jake-stewart/force-cul.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('force-cul').setup()
    end,
  },
  -- {
  --   'tpope/vim-repeat',
  -- },
}
