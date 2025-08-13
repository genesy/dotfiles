--
local vscode = require('vscode')
local keymap = vim.keymap.set

-- for theme changer
vim.api.nvim_exec(
  [[
    " THEME CHANGER
    function! SetCursorLineNrColorInsert(mode)
        " Insert mode: blue
        if a:mode == "i"
            call VSCodeNotify('nvim-theme.insert')

        " Replace mode: red
        elseif a:mode == "r"
            call VSCodeNotify('nvim-theme.replace')
        endif
    endfunction

    augroup CursorLineNrColorSwap
        autocmd!
        autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
        autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
        autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
        autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
        autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
        autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
    augroup END
]],
  false
)

-- vim.api.nvim_set_keymap(
--   'n',
--   'gcc',
--   "<Cmd>lua require('vscode').call('editor.action.addCommentLine')<CR>",
--   { noremap = true, silent = true }
-- )
--
-- vim.api.nvim_set_keymap(
--   'n',
--   'gc',
--   [[<Cmd>lua vim.cmd('normal! V' .. (vim.v.count1 - 1) .. 'j')<CR>]],
--   { noremap = true, silent = true, expr = true }
-- )

-- local C = require('vscode-multi-cursor')

-- keymap({ 'n', 'x', 'i' }, '<C-d>', function()
--   vscode.with_insert(function()
--     C.addSelectionToNextFindMatch()
--   end)
-- end)

-- multi-cursor end
