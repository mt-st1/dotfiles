lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    colored = true,
    globalstatus=true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      {
        'filename',
        path = 1,
        file_status = true,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[RO]',
          unnamed = 'Untitled',
        }
      }
    },
    lualine_x = {'filetype', 'encoding'},
    lualine_y = {
      {
        'diagnostics',
        source = {'nvim-lsp'},
      }
    },
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'location'},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF

