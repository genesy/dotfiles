-- local telescopeConfig = require('telescope.config')
-- local conf = telescopeConfig.values

-- local harpoon = require('harpoon')
--
-- if harpoon and telescopeConfig then
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
--
--   require('telescope.pickers')
--     .new({}, {
--       prompt_title = 'Harpoon',
--       finder = require('telescope.finders').new_table({
--         results = file_paths,
--       }),
--       previewer = conf.file_previewer({}),
--       sorter = conf.generic_sorter({}),
--     })
--     :find()
-- end
--   vim.keymap.set('n', '<leader>h', function()
--     toggle_telescope(harpoon:list())
--   end, { desc = 'Open harpoon window in telescope' })
--   vim.keymap.set('n', '<leader>ae', function()
--     harpoon.ui:toggle_quick_menu(harpoon:list())
--   end, { desc = 'Open harpoon window' })
--   vim.keymap.set('n', '<leader>aa', function()
--     harpoon:list():add()
--   end, { desc = 'Add current buffer to harpoon list' })
--
--   -- Toggle previous & next buffers stored within Harpoon list
--   vim.keymap.set('n', '<C-S-P>', function()
--     harpoon:list():prev()
--   end)
--   vim.keymap.set('n', '<C-S-N>', function()
--     harpoon:list():next()
--   end)
-- end

local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
keymap('n', '<leader>p', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

keymap('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
keymap('n', '<leader>qq', ':q!<CR><CR>', { desc = 'Quit' })
keymap('n', '<C-d>', '<C-d>zz')

keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')
keymap('n', 'j', 'jzzzv')
keymap('n', 'k', 'kzzzv')
keymap('n', '<C-p>', '<C-p>zzzv')
keymap('n', '<C-n>', '<C-n>zzzv')

-- keymap('n', '<leader>zm', ':ZenMode<CR>', { desc = 'Toggle Zen Mode' })

keymap('n', '<leader>rr', function()
  dofile(vim.fn.stdpath('config') .. '/init.lua')
  print('Config reloaded!')
end, { desc = 'Reload config'})

keymap('n', '<leader>ri', ':Lazy install<CR>', { desc = 'Install Lazy plugins' })
keymap('n', '<leader>1', ':Neotree toggle<cr>')

local function leader_e()
  -- close neotree if neotree is focused
  -- if vim.api.nvim_win_get_config(0).relative == '' then
  --   vim.cmd('Neotree close')
  --   return
  -- else
  vim.cmd('Neotree reveal')
  -- end
end
keymap('n', '<leader>e', leader_e, { desc = 'Open Neotree' })
keymap('n', 'gD', ':TSToolsGoToSourceDefinition<CR>', { desc = 'go to TS source definition' })
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '/', ':Neotree toggle current reveal_force_cwd<CR>', { noremap = true, silent = true })
--
vim.keymap.set('n', '<leader>gse', function()
  require('scissors').editSnippet()
end)

-- when used in visual mode, prefills the selection as snippet body
vim.keymap.set({ 'n', 'x' }, '<leader>gsa', function()
  require('scissors').addNewSnippet()
end)

local r = require('repeatable')
-- if r == nil then
vim.keymap.set({ 'n' }, '<leader>xn', function()
  r.call('next_diagnostic')
end, { desc = 'Next diagnostic' })

vim.keymap.set({ 'n' }, '<leader>xp', r.keymap('prev_diagnostic'), { desc = 'Previous diagnostic' })
-- end

vim.keymap.set({ 'n' }, '<leader>lr', function()
  vim.lsp.buf.rename()
end, { desc = 'Rename symbol' })

-- local suggestion = require('copilot.suggestion')

-- local function mytab()
--   if suggestion.is_visible() == true then
--     suggestion.accept()
--   else
--     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
--   end
-- end

-- vim.keymap.set('i', '<Tab>', mytab, { noremap = true })
