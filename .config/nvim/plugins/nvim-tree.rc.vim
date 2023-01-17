lua << EOF
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-a>", ":NvimTreeFocus<cr>", {silent = true, noremap = true})

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local config = {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "s", action = "" },
        { key = "<C-e>", action = "" },
        { key = "l", action = "edit", action_cb = edit_or_open },
        { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all", action_cb = collapse_all }
      }
    },
  },
  actions = {
    open_file = {
      window_picker = {
        -- enable = false,
        chars = "HLJKGFDSABCEIMNOPQRTUVWXYZ1234567890",
      },
    }
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = "after",
    }
  },
}

require("nvim-tree").setup(config)
EOF

