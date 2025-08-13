local snippetDir = '~/dotfiles/snippets'
return {
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load {
        paths = { snippetDir },
      }
    end,
  },
  {
    'chrisgrieser/nvim-scissors',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      snippetDir = snippetDir,
    },
  },
}
