local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<C-p>', function() builtin.git_files(themes.get_ivy({})) end, {})
vim.keymap.set('n', '<leader>p', function() builtin.find_files(themes.get_ivy({})) end, {})
vim.keymap.set('n', '<C-b>', function() builtin.oldfiles(themes.get_ivy({})) end, {})
vim.keymap.set('n', '<leader>b', function() builtin.buffers(themes.get_ivy({})) end, {})
