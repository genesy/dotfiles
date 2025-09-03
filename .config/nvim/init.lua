vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy_init')
require('mappings')
require('config')

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

-- Portable base64 (works great on macOS): openssl -A
local function osc52_tmux_copy_str(s, wraps)
  wraps = tonumber(vim.env.OSC52_TMUX_WRAPS) or wraps or 2
  local b64 = vim.fn.system({ "openssl", "base64", "-A" }, s):gsub("%s+$", "")
  local osc = "\027]52;c;" .. b64 .. "\007" -- BEL
  local payload = osc
  for _ = 1, wraps do
    payload = "\027Ptmux;\027" .. payload .. "\027\\"
  end
  io.stdout:write(payload)
  io.stdout:flush()
end

-- Mirror any yank to system clipboard via OSC52 (Neovim regs unchanged)
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.v.event.operator == "y" then
      local reg = (vim.v.event.regname ~= "" and vim.v.event.regname) or '"'
      local lines = vim.fn.getreg(reg, 1, true)
      if #lines > 0 then
        osc52_tmux_copy_str(table.concat(lines, "\n"))
      end
    end
  end,
})

-- Optional manual copy
vim.keymap.set({ "n", "v" }, "<leader>y", function()
  local lines = vim.fn.getreg('"', 1, true)
  if #lines > 0 then osc52_tmux_copy_str(table.concat(lines, "\n")) end
end, { desc = "OSC52 copy" })

