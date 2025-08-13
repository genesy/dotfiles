local keymap = vim.keymap.set
local vscode = require('vscode')

vim.keymap.set({ "n", "x", "i" }, "gene", function()
  require("vscode-multi-cursor").addSelectionToNextFindMatch()
end)

vim.keymap.set({ "n" }, "mm", function()
   vscode.action('bookmarks.toggle')
end)
vim.keymap.set({ "n" }, "mi", function()
   vscode.action('bookmarks.toggleLabeled')
end)

local r = require('repeatable')
vim.keymap.set({ "n" }, "mn", function()
   r.call('bookmarks_jump_to_next')
end)
vim.keymap.set({ "n" }, "mp", function()
   r.call('bookmarks_jump_to_previous')
end)

for i = 1, 9 do
  vim.keymap.set({ "n" }, "M" .. i, function()
    vscode.action('numberedBookmarks.toggleBookmark' .. i)
  end)
  vim.keymap.set({ "n" }, "m" .. i, function()
    vscode.action('numberedBookmarks.jumpToBookmark' .. i)
  end)
end

keymap({ 'n' }, '<leader>p', function()
  vscode.with_insert(function()
   vscode.action('workbench.action.quickOpen')
  end)
end)

keymap({ 'n' }, '<leader>P', function()
  vscode.with_insert(function()
   vscode.action('workbench.action.showCommands')
  end)
end)

local last_line = vim.fn.line('.')
vim.api.nvim_create_autocmd({ 'CursorMovedI' }, {
  callback = function()
    local current_line = vim.fn.line('.')
    if current_line ~= last_line then
      vim.cmd('normal! zz')
      last_line = current_line
    end
  end,
  desc = 'Center cursor in Insert mode when the cursor moves to a different line',
})
