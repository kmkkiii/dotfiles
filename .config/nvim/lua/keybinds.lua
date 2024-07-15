vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')

vim.keymap.set('n', 'ZZ', '<NOP>')
vim.keymap.set('n', 'ZQ', '<NOP>')

vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

vim.api.nvim_set_var('mapleader', ' ')
vim.api.nvim_set_var('maplocalleader', '_')
