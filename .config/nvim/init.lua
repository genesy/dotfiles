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

-- Send OSC52 with N tmux DCS wrappers so it survives nested tmux
local function osc52_tmux_copy_str(s, wraps)
  wraps = wraps or 2   -- 2 wrappers handles outer+inner tmux in your setup
  -- Base64 (LuaJIT/Neovim has vim.fn.system for portability)
  local b64 = vim.fn.system({ "base64", "-w0" }, s):gsub("%s+$", "")
  local osc = "\027]52;c;" .. b64 .. "\007"        -- BEL terminator
  local payload = osc
  for _ = 1, wraps do
    payload = "\027Ptmux;\027" .. payload .. "\027\\"
  end
  -- Write directly to terminal
  io.stdout:write(payload)
  io.stdout:flush()
end

local function copy(lines, _)
  osc52_tmux_copy_str(table.concat(lines, "\n"), 2)
end

vim.g.clipboard = {
  name = "tmux-osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = {
    ["+"] = function() return { vim.fn.getreg("+") }, vim.fn.getregtype("+") end,
    ["*"] = function() return { vim.fn.getreg("*") }, vim.fn.getregtype("*") end,
  },
}

-- Route unnamed yanks to +
vim.opt.clipboard = "unnamedplus"

-- Optional: auto-copy on any yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    if vim.v.event.operator == "y" then
      osc52_tmux_copy_str(table.concat(vim.fn.getreg('"', 1, true), "\n"), 2)
    end
  end,
})

