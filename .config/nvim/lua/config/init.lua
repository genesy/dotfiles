if vim.g.vscode then
  require('config.vscode-only')
else
  require('config.nvim-only')
end

vim.opt.clipboard:append('unnamedplus')
vim.opt.ignorecase = true
vim.opt.smartcase = true
