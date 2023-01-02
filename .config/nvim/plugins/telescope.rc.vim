" Find files using Telescope command-line sugar.
nnoremap ;f <cmd>Telescope find_files<cr>
nnoremap ;g <cmd>Telescope live_grep<cr>
nnoremap ;b <cmd>Telescope buffers<cr>
nnoremap ;h <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap ;g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap ;b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<cr>

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
    }
  }
}
EOF

