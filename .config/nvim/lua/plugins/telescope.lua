return {
  cond = not vim.g.vscode,
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', 'debugloop/telescope-undo.nvim' },
    config = function()
      require('telescope').setup({

        pickers = {
          live_grep = {
            additional_args = function()
              return { '--hidden', '--no-ignore-vcs', '--glob', '!**/.git/*' }
            end,
          },
          
          find_files = {
            hidden = true,
            no_ignore = true,
            find_command = { 'rg', '--files', '--hidden', '--no-ignore-vcs', '--glob', '!**/.git/*' },
          },

        },

        defaults = {

          wrap_results = true,
          sorting_strategy = 'descending',
          layout_config = {
            width = {
              padding = 0.04,
            },
            height = {
              padding = 0.04,
            },
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',          -- include dotfiles
            '--no-ignore-vcs',   -- include files ignored by git
            '--glob', '!**/.git/*' -- but exclude .git
          },
        },
        extensions = {
          undo = {},
        },
      })
    end,
  },
  {
    'axkirillov/easypick.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      -- local get_default_branch = "git rev-parse --symbolic-full-name refs/remotes/origin/HEAD | sed 's!.*/!!'"
      -- local base_branch = vim.fn.system(get_default_branch) or 'main'
      local easypick = require('easypick')
      easypick.setup({
        pickers = {
          -- {
          --   name = 'changed_files',
          --   command = 'git diff --name-only $(git merge-base HEAD ' .. base_branch .. ' )',
          --   previewer = easypick.previewers.branch_diff({ base_branch = base_branch }),
          -- },
          {
            name = 'conflicts',
            command = 'git diff --name-only --diff-filter=U --relative',
            previewer = easypick.previewers.file_diff(),
          },
        },
      })
    end,
  },
}
