if vim.g.vscode then
  return {}
end

return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    cond = not vim.g.vscode,
    config = function()
      require('github-theme').setup()
      vim.cmd('colorscheme github_dark_default')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
        },

        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
          },
          lualine_c = { 'filename' },
          lualine_x = {
            'copilot',
            -- 'encoding',
            -- 'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      })
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}
