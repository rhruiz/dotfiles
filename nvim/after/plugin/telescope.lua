local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local ivy = function(telescope)
    return function()
        telescope(themes.get_ivy({}))
    end
end

local wk = require('which-key')
wk.add({
    { '<leader>b', ivy(builtin.buffers), desc = 'Buffers' },
    { '<leader>ff', ivy(builtin.find_files), desc = 'Find files' },
    { '<leader>fr', ivy(builtin.oldfiles), desc = 'Old files' },
    { '<leader>/', ivy(builtin.current_buffer_fuzzy_find), desc = 'Current buffer fuzzy find' },
    { '<leader>sp', ivy(builtin.live_grep), desc = 'Grep project' },
    { '<leader>sw', ivy(builtin.grep_string), desc = 'Find word' },
    { '<C-p>', ivy(builtin.git_files), desc = 'Git files' },
    { '<leader>gs', builtin.git_status, desc = '[G]it [S]tatus' },
})

require('telescope').setup {
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
