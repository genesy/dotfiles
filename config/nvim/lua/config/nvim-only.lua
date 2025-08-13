local function jk()
  vim.api.nvim_command('stopinsert')
end
vim.keymap.set('i', 'jk', jk, {})

-- smart search

-- tabs are two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- show line numbers and highlight cursor line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#121620' }) -- Replace with your preferred color
vim.o.cursorline = true
vim.o.cursorlineopt = 'both'

-- mouse and clipboard integration
vim.opt.mouse = 'a'

vim.opt.termguicolors = true -- 24-bit RGB color in the TUI
vim.opt.undofile = true -- persistent undo history
vim.opt.showmode = false -- do not show mode message on last line
vim.opt.hidden = true -- switch buffers without having to save changes
vim.opt.joinspaces = false -- insert one space when joining two sentences
vim.opt.confirm = true -- raise dialog asking to save changes when commands like ':q' fail
vim.opt.title = true -- set terminal window title to something descriptive
vim.opt.foldlevel = 99 -- do not automatically close folds when editing a file
vim.opt.inccommand = 'nosplit' -- show incremental changes of commands such as search & replace
vim.opt.virtualedit = 'block' -- virtual editing in visual block mode
vim.opt.shortmess:append('I') -- don't give intro message when starting vim
vim.opt.conceallevel = 2 -- show concealable text

-- local autocomplete = require('blink.cmp.windows.autocomplete')
-- autocomplete.listen_on_open(function()
--   -- print('listen_on_open')
--   vim.b.copilot_suggestion_hidden = true
-- end)
--
-- autocomplete.listen_on_close(function()
--   -- print('listen_on_close')
--   vim.b.copilot_suggestion_hidden = false
-- end)
