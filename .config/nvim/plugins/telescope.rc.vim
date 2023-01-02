nnoremap ;f <cmd>Telescope find_files find_command=rg,--files,--ignore,--hidden,--follow,--glob,!.git/*<cr>
nnoremap ;g <cmd>Telescope live_grep<cr>
nnoremap ;b <cmd>Telescope buffers<cr>
nnoremap ;h <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup {
  defaults = {
    mappings = {
      n = {
        ["<esc>"] = require('telescope.actions').close,
      },
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<C-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist
      }
    },
    vimgrep_arguments = {
      'rg',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore',
      '--hidden'
    },
  }
}
EOF

