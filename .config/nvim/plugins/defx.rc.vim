nnoremap <silent><C-e> :<C-u>Defx -split=vertical -winwidth=40 -direction=topleft -toggle<CR>
nnoremap <silent><C-a> :<C-u>Defx -resume<CR>

call defx#custom#option('_', {
    \ 'columns': 'indent:git:icons:filename:mark',
    \ 'show_ignored_files': 0,
    \ 'root_marker': '> ',
    \ 'resume': 1,
    \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 3

" update defx status automatically when changing file
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    " IndentLinesDisable
    setl nonumber
    " 【Enter】 ツリーを表示/非表示する
    nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open_or_close_tree')
    " 【l】 ファイルを開く
    nnoremap <silent><buffer><expr> l
    \ defx#do_action('drop')
    " 【h】 親ディレクトリに移動する
    nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
    " 【s】 ウィンドウを水平分割してファイルを開く
    nnoremap <silent><buffer><expr> <C-s>
    \ defx#do_action('open', 'split')
    " 【v】 ウィンドウを垂直分割してファイルを開く
    nnoremap <silent><buffer><expr> <C-v>
    \ defx#do_action('open', 'vsplit')
    " 【t】 新規タブでファイルを開く
    nnoremap <silent><buffer><expr> <C-t>
    \ defx#do_action('open', 'tabnew')
    " 【c】 ファイルをコピーする
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    " 【m】 ファイルを移動する
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    " 【p】 ファイルを貼り付ける
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    " 【n】 新しいファイルを作成する
    nnoremap <silent><buffer><expr> n
    \ defx#do_action('new_file')
    " 【N】 新しいディレクトリを作成する
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_directory')
    " 【d】 ファイルをゴミ箱へ
    " nnoremap <silent><buffer><expr> d
    " \ defx#do_action('remove_trash')
    " 【D】 ファイルを消去
    nnoremap <silent><buffer><expr> D
    \ defx#do_action('remove')
    " 【r】 ファイル名を変更する
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    " 【e】 ツリーを開く
    nnoremap <silent><buffer><expr> e
    \ defx#do_action('open_tree')
    " 【E】 ツリーを再帰的に開く
    nnoremap <silent><buffer><expr> E
    \ defx#do_action('open_tree_recursive')
    " 【C】 カラムのトグル
    nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
    " 【x】 ファイルを実行する
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    " 【yy】 ファイル/ディレクトリのパスをコピーする
    nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
    " 【.】 隠しファイルを表示/非表示する
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    " 【~】 ホームディレクトリに移動する
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    " 【ESC】 / 【q】 defx.nvimを終了する
    nnoremap <silent><buffer><expr> <Esc>
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    " 【j】 カーソルを下に移動する
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    " 【k】 カーソルを上に移動する
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    "  [Space] 選択のトグル
    nnoremap <silent><buffer><expr> <Space><Space>
     \ defx#do_action('toggle_select') . 'j'
    " [*] 全選択
    nnoremap <silent><buffer><expr> <Space>*
    \ defx#do_action('toggle_select_all')
    "  [C-g] フルパスをプリント
    nnoremap <silent><buffer><expr> <C-g>
     \ defx#do_action('print')
    " 【cd】 Neovim上のカレントディレクトリを変更する
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
endfunction

let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 1
" hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

