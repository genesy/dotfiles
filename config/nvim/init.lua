vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy_init')
require('mappings')
require('config')


-- Example config
vim.keymap.set('n', '<leader>y', function()
  require('osc52').copy_operator()
end, {expr = true})
vim.keymap.set('n', '<leader>yy', '<leader>y_', {remap = true})
vim.keymap.set('v', '<leader>y', function()
  require('osc52').copy_visual()
end)

if not vim.g.vscode then
  function _G.ReloadConfig()
    for name, _ in pairs(package.loaded) do
      if name:match('^user') and not name:match('nvim-tree') then
        package.loaded[name] = nil
      end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify('Nvim configuration reloaded!', vim.log.levels.INFO)
  end

  vim.api.nvim_set_keymap('n', '<leader><CR>', '<cmd>lua ReloadConfig()<CR>', { noremap = true, silent = false })

  -- -- Define diagnostic signs with custom icons
  local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Automatically center view after moving to a line with :<number>
  vim.api.nvim_create_autocmd('CmdlineEnter', {
    pattern = ':[0-9]*', -- Match line number commands like ":10"
    callback = function()
      vim.api.nvim_create_autocmd('CursorMoved', {
        once = true,
        callback = function()
          vim.cmd('normal! zz')
        end,
      })
    end,
  })
end
