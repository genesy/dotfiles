if vim.g.vscode then
  return {}
end

return {
  cond = not vim.g.vscode,
  { 'nvim-treesitter/nvim-treesitter-textobjects', depends = 'nvim-treesitter/nvim-treesitter' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cont = not vim.g.vscode,
    config = function()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
            },
          },
        },
        ensure_installed = {
          'lua',
          'vim',
          'javascript',
          'html',
          'typescript',
          'tsx',
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  {
    'j-hui/fidget.nvim',
    opts = {},
    config = function()
      require('fidget').setup()
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    cond = not vim.g.vscode,
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
      })

      require('lspconfig').lua_ls.setup({})
    end,
  },
  { 'mhartington/formatter.nvim', cond = not vim.g.vscode },
  {
    'neovim/nvim-lspconfig',
    cont = not vim.g.vscode,
    config = function() end,
  },
  -- {
  --   'hrsh7th/nvim-cmp',
  --
  --   cont = not vim.g.vscode,
  --   config = function()
  --     local cmp = require('cmp')
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           require('luasnip').lsp_expand(args.body) -- For LuaSnip users
  --         end,
  --       },
  --       mapping = {
  --         ['<C-j>'] = cmp.mapping.select_next_item(),
  --         ['<C-k>'] = cmp.mapping.select_prev_item(),
  --         ['<C-l>'] = cmp.mapping.complete(),
  --         ['<C-h>'] = cmp.mapping.close(),
  --         ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  --       },
  --       sources = {
  --         { name = 'nvim_lsp' },
  --         { name = 'buffer' },
  --         { name = 'path' },
  --         -- { name = 'cmdline' },
  --         { name = 'luasnip' }, -- Optional: for LuaSnip support
  --       },
  --     })
  --   end,
  -- },
  -- { 'hrsh7th/cmp-nvim-lsp' },
  -- { 'hrsh7th/cmp-buffer' },
  -- { 'hrsh7th/cmp-path' },
  -- { 'hrsh7th/cmp-cmdline' },
  --
  -- { 'saadparwaiz1/cmp_luasnip' }, -- Optional: for LuaSnip support
  -- { 'L3MON4D3/LuaSnip' }, -- Optional: snippet engine

  {
    'stevearc/conform.nvim',
    opts = {},
    cond = not vim.g.vscode,
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform will run multiple formatters sequentially
          python = { 'isort', 'black' },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { 'rustfmt', lsp_format = 'fallback' },
          -- Conform will run the first available formatter
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
          typescript = { 'prettierd', 'prettier', stop_after_first = true },
          typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
          javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        },
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function(args)
          print('tada')
          require('conform').format({ bufnr = args.buf })
        end,
      })
    end,
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  -- {
  --   'github/copilot.vim',
  -- },
  --
  -- {
  --   'AndreM222/copilot-lualine',
  -- },
}
