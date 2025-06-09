return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  cond = not require('rhruiz.runtime').vscode,
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')
    local ivy = function(telescope)
      return function()
        telescope(themes.get_ivy({}))
      end
    end

    require('which-key').add({
      { '<leader>sr', ivy(builtin.resume), desc = '[S]earch: [R]esume' },
      { '<leader>b', ivy(builtin.buffers), desc = 'Buffers' },
      { '<leader>ff', ivy(builtin.find_files), desc = 'Find files' },
      { '<leader>fp', ivy(builtin.git_files), desc = 'Git files' },
      { '<leader>fr', ivy(builtin.oldfiles), desc = 'Old files' },
      { '<leader>/', ivy(builtin.current_buffer_fuzzy_find), desc = 'Current buffer fuzzy find' },
      { '<leader>sp', ivy(builtin.live_grep), desc = 'Grep project' },
      { '<leader>sw', ivy(builtin.grep_string), desc = 'Find word' },
      { '<leader>gs', builtin.git_status, desc = '[G]it [S]tatus' },
      { '<C-p>', ivy(builtin.git_files), desc = 'Git files' },
    })

    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        fzf = {},
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end
}
