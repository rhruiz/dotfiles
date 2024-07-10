local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
local ivy = function(telescope)
    return function()
        telescope(themes.get_ivy({}))
    end
end

local wk = require('which-key')
wk.register({
    ['<leader>b'] = { ivy(builtin.buffers), 'Buffers' },
    ['<leader>ff'] = { ivy(builtin.find_files), 'Find files' },
    ['<leader>fs'] = { builtin.live_grep, 'Live grep' },
    ['<leader>fr'] = { ivy(builtin.oldfiles), 'Old files' },
    ['<leader>/'] = { ivy(builtin.current_buffer_fuzzy_find), 'Current buffer fuzzy find' },
    ['<leader>sp'] = { ivy(builtin.live_grep), 'Grep project' },
    ['<leader>sw'] = { ivy(builtin.grep_string), 'Find word' },

    ['<C-p>'] = { ivy(builtin.git_files), 'Git files' },
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
