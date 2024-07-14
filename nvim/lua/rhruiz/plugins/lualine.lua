local mode_map = {
  ['NORMAL'] = '\u{f36f}',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = '',
  ['VISUAL'] = '',
  ['V-BLOCK'] = '',
  ['V-LINE'] = 'L',
  ['V-REPLACE'] = '',
  ['REPLACE'] = '',
  ['COMMAND'] = '',
  ['SHELL'] = '',
  ['TERMINAL'] = '',
  ['EX'] = 'X',
  ['S-BLOCK'] = '',
  ['S-LINE'] = 'L',
  ['SELECT'] = '',
  ['CONFIRM'] = '',
  ['MORE'] = 'M',
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
  config = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = (function ()
          if require("rhruiz/colors").inUtterDarkness() then
            return 'auto'
          else
            return 'powerline'
          end
        end)(),
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        component_separators  = { left = "\u{e0bd}", right = "\u{e0bd}" },
        section_separators = { left = "\u{e0bc}", right = "\u{e0ba}" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(s) return mode_map[s] or s end } },
        lualine_b = { { 'branch', icon = "" }, 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
