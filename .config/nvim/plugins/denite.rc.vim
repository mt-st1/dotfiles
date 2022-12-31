 " Add custom menus
let s:menus = {}
let s:menus.file = {'description': 'File search (buffer, file, file_rec, file_mru'}
let s:menus.line = {'description': 'Line search (change, grep, line, tag'}
let s:menus.others = {'description': 'Others (command, command_history, help)'}
let s:menus.file.command_candidates = [
      \ ['buffer', 'Denite buffer'],
      \ ['file: Files in the current directory', 'Denite file'],
      \ ['file_rec: Files, recursive list under the current directory', 'Denite file_rec'],
      \ ['file_mru: Most recently used files', 'Denite file_mru']
      \ ]
let s:menus.line.command_candidates = [
      \ ['change', 'Denite change'],
      \ ['grep', 'Denite grep'],
      \ ['line', 'Denite line'],
      \ ['tag', 'Denite tag']
      \ ]
let s:menus.others.command_candidates = [
      \ ['command', 'Denite command'],
      \ ['command_history', 'Denite command_history'],
      \ ['help', 'Denite help']
      \ ]

call denite#custom#var('menu', 'menus', s:menus)

nnoremap [denite] <Nop>
nmap ; [denite]
nnoremap <silent> [denite]b :<C-u>Denite buffer -smartcase<CR>
nnoremap <silent> [denite]c :<C-u>Denite change -smartcase<CR>
nnoremap <silent> [denite]f :<C-u>Denite file -smartcase<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep<CR>
nnoremap <silent> [denite]G :<C-u>DeniteCursorWord grep<CR>
nnoremap <silent> [denite]h :<C-u>Denite command_history -smartcase<CR>
nnoremap <silent> [denite]H :<C-u>Denite help<CR>
nnoremap <silent> [denite]l :<C-u>Denite line -smartcase<CR>
nnoremap <silent> [denite]T :<C-u>Denite tag<CR>
nnoremap <silent> [denite]u :<C-u>Denite file_mru -smartcase<CR>
nnoremap <silent> [denite]r :<C-u>Denite file/rec -smartcase<CR>
nnoremap <silent> [denite]d :<C-u>Denite directory_mru -smartcase<CR>
nnoremap <silent> [denite]s :<C-u>Denite directory_rec -smartcase<CR>
nnoremap <silent> [denite]M :<C-u>Denite menu<CR>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
nnoremap <silent> [denite]t :<C-u>Denite tab<CR>
nnoremap <silent> ,bm :<C-u>Denite -default-action=cd dirmark<CR>
nnoremap <silent> ,ba :<C-u>Denite dirmark/add<CR>
" Denite grep検索結果を再表示する
nnoremap <silent> gr :<C-u>Denite -resume<CR>
" resumeした検索結果の次の行の結果へ飛ぶ
nnoremap <silent> gn :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
" resumeした検索結果の前の行の結果へ飛ぶ
nnoremap <silent> gp :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>

call denite#custom#option('default', 'prompt', '>')

if executable('rg')
  call denite#custom#var('file_rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])
  " Ripgrep command on grep source
  call denite#custom#var('grep', 'command', ['rg', '--smart-case', '--hidden'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

" customize ignore globs
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy','matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [
      \ '.git/', 'build/', '__pycache__/',
      \ 'images/', '*.o', '*.make',
      \ '*.min.*',
      \ 'img/', 'fonts/'])

let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.5

" Change denite default options
call denite#custom#option('default', {
  \ 'split': 'floating',
  \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
  \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
  \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
  \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
  \ 'source_names': 'short',
  \ 'prompt': '>',
  \ 'highlight_filter_background': 'CursorLine',
  \ 'highlight_matched_char': 'Type',
  \ })

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> l
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-s>
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> h
  \ denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> .
  \ denite#do_map('choose_action')
  nnoremap <silent><buffer><expr> <Space><Space>
  \ denite#do_map('toggle_select').'j'
  inoremap <silent><buffer><expr> <C-c>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>
  \ denite#do_map('quit')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  " inoremap <silent><buffer><expr> <C-c>
  " \ denite#do_map('quit')
  " nnoremap <silent><buffer><expr> <C-c>
  " \ denite#do_map('quit')
  imap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
  nmap <silent><buffer> <C-c> <Plug>(denite_filter_quit)
endfunction

