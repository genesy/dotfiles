return {
  cond = false and not vim.g.vscode,
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        keymap = {
          accept_word = false,
          accept_line = false,
          next = '<C-n>',
          prev = '<C-p>',
          dismiss = '<Esc>',
        },
      },
    })
  end,
}
