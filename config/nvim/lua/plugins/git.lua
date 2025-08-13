if vim.g.vscode then
  return {}
end

return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('neogit').setup({})
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        numhl = true,
        attach_to_untracked = true,
        current_line_blame = true,
        on_attach = function(client)
          local map = vim.keymap.set
          local f = require('repeatable')
          map({ 'n', 'v' }, '<leader>gn', function()
            f.call('next_hunk')
          end, { desc = 'Next hunk' })

          map({ 'n', 'v' }, '<leader>gp', function()
            f.call('prev_hunk')
          end, { desc = 'Previous hunk' })
        end,
      })
    end,
  },
}
