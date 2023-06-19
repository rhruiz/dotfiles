local autocmd = vim.api.nvim_create_autocmd

vim.g.rbpt_max = 16
vim.g.rbpt_loadcmd_toggle = 0

vim.g.rbpt_colorpairs = {
    { 'brown',       'RoyalBlue3' },
    { 'Darkblue',    'SeaGreen3' },
    { 'darkgray',    'DarkOrchid3' },
    { 'darkgreen',   'firebrick3' },
    { 'darkcyan',    'RoyalBlue3' },
    { 'darkred',     'SeaGreen3' },
    { 'darkmagenta', 'DarkOrchid3' },
    { 'brown',       'firebrick3' },
    { 'gray',        'RoyalBlue3' },
    { 'black',       'SeaGreen3' },
    { 'darkmagenta', 'DarkOrchid3' },
    { 'Darkblue',    'firebrick3' },
    { 'darkgreen',   'RoyalBlue3' },
    { 'darkcyan',    'SeaGreen3' },
    { 'darkred',     'DarkOrchid3' },
    { 'red',         'firebrick3' },
}

if vim.fn.exists(':RainbowParenthesesToggle') then
    autocmd('VimEnter', { pattern = '*', command = 'RainbowParenthesesToggle' })
    autocmd('Syntax', { pattern = '*', command = 'RainbowParenthesesLoadRound' })
    autocmd('Syntax', { pattern = '*', command = 'RainbowParenthesesLoadSquare' })
    autocmd('Syntax', { pattern = '*', command = 'RainbowParenthesesLoadBraces' })
end
