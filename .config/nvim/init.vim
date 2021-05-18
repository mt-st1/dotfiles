" 挙動を vi 互換ではなく、Vim のデフォルト設定にする
set nocompatible
" ファイルタイプ関連を無効化する
filetype off

"===========================
" 画面表示の設定
"===========================
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
" set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
set listchars=tab:\▸\-,extends:❯,precedes:❮ " 不可視文字の表示記号指定
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set title         " ウインドウのタイトルバーにファイルのパス情報等を表示する
set t_Co=256
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,shift_jis,ucs-bombs
set fileformats=unix,dos,mac
set background=dark
set splitbelow " 新しいウインドウを下に開く
set splitright " 新しいウインドウを右に開く
set inccommand=split " 文字列置換をインタラクティブに表示
set noshowmode " 左下のinsertモードなどの表示をしない
" set ambiwidth=double
set pumblend=10 " ポップアップメニューを半透明化
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let mapleader = '\<Space>'
language messages C " 各種メッセージを英語にする

augroup MyAutoGroup
  autocmd!
augroup END

" jellybeansの背景色をターミナルと同じに
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}

"===========================
" カーソル移動関連の設定
"===========================
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " カーソルが行頭、行末で止まらないようにする
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set ruler                      " カーソルが何行目の何列目に置かれているかを表示する

"============================
" ファイル処理関連の設定
"============================
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

"============================
" 検索/置換の設定
"============================
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
"set gdefault   " 置換の時 g オプションをデフォルトで有効にする

"=============================
" タブ/インデントの設定
"============================
set expandtab       " タブ入力を複数の空白入力に置き換える
set tabstop=2       " 画面上でタブ文字が占める幅
set shiftwidth=2    " 自動インデントでずれる幅
set softtabstop=2   " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent      " 改行時に前の行のインデントを継続する
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"==============================
"動作環境との統合関連の設定
"==============================
set clipboard+=unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
" set mouse=n  " マウスの入力を受け付ける
" set shellslash " Windows でもパスの区切り文字を / にする
" set iminsert=2 " インサートモードから抜けると自動的にIMEをオフにする

let g:python_host_prog=$PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim3/bin/python'

"==============================
" コマンドラインの設定
"==============================
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効に>する
" set showcmd " 入力中のコマンドを表示する
set noshowcmd " 入力中のコマンドを表示しない
set history=10000 " コマンドラインの履歴を10000件保存する

"=============================
" ビープの設定
"=============================
set visualbell t_vb=  "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

"================================
" dein
"================================
let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

" Check dein has been installed or not.
if !isdirectory(s:dein_repo_dir)
  echo "dein is not installed, install now "
  let s:dein_repo = "https://github.com/Shougo/dein.vim"
  echo "git clone " . s:dein_repo . " " . s:dein_repo_dir
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

" Add the dein installation directory into runtimepath
set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#load_toml(s:dein_config_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:dein_config_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Installation check.
if dein#check_install()
  call dein#install()
endif


"===============================
" color schema
"===============================
syntax on
syntax enable
autocmd ColorScheme * highlight Normal ctermbg=none
" autocmd ColorScheme * highlight EndOfBuffer ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight VertSplit ctermbg=none
" autocmd ColorScheme * highlight StatusLine ctermbg=none
" autocmd ColorScheme * highlight TabLine ctermbg=none
autocmd ColorScheme * highlight IncSearch ctermbg=none
autocmd ColorScheme * highlight Search ctermbg=none
" autocmd ColorScheme * highlight Visual ctermbg=143 ctermfg=232 cterm=bold
" autocmd ColorScheme * highlight Visual ctermbg=238 cterm=bold

let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 1

" colorscheme dracula
" color Dracula
" colorscheme solarized
" colorscheme molokai
" colorscheme hybrid
" colorscheme mustang
" colorscheme jellybeans
" colorscheme wombat
" colorscheme railscasts
" colorscheme tender
" colorscheme atom-dark
" colorscheme onedark
colorscheme tokyonight
" colorscheme gruvbox

" 行番号の色
" highlight LineNr ctermfg=darkyellow
highlight LineNr ctermfg=130
" highlight LineNr ctermfg=148
" 編集業の行番号の色
" highlight CursorLineNr term=bold ctermfg=11
" highlight clear CursorLine
" uniteなどの選択行の色
" highlight CursorLine ctermbg=95
highlight CursorLine ctermfg=167
" ステータスラインの色
highlight statusline term=bold cterm=bold ctermfg=231 ctermbg=59


" タブやスプリットの設定
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap s= <C-w>=
nnoremap <silent>ss :<C-u>sp<CR>
nnoremap <silent>sv :<C-u>vs<CR>
nnoremap <silent>sq :<C-u>q<CR>
" バッファを消す
nnoremap <silent>sQ :<C-u>bd<CR>
" 前のバッファへ
nnoremap <silent>sn :<C-u>bn<CR>
" 後ろのバッファへ
nnoremap <silent>sp :<C-u>bp<CR>
nnoremap <silent>st :<C-u>tabnew<CR>
" nnoremap sn gt
" nnoremap sp gT
nnoremap <C-n> gt
nnoremap <C-p> gT

" The prefix key.
nnoremap [Tag] <Nop>
nmap s [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブ閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>


"==============================
" Denite
"==============================
if dein#tap('denite.nvim')
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

  " call denite#custom#var('file_rec', 'command',
  "     \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  nnoremap [denite] <Nop>
  nmap ; [denite]
  nnoremap <silent> [denite]b :<C-u>Denite buffer -smartcase<CR>
  " nnoremap <silent> [denite]B :<C-u>Denite buffer_tab -buffer-name=file<CR>
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
  " nnoremap <silent> ,bm :<C-u>Denite -direction=topleft -cursor-wrap=true bookmark<CR>
  " nnoremap <silent> ,ba :<C-u>DeniteBookmarkAdd<CR>
  " Denite grep検索結果を再表示する
  nnoremap <silent> gr :<C-u>Denite -resume<CR>
  " resumeした検索結果の次の行の結果へ飛ぶ
  nnoremap <silent> gn :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
  " resumeした検索結果の前の行の結果へ飛ぶ
  nnoremap <silent> gp :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
  " resume previous buffer
  " nnoremap <silent> [denite]R :<C-u>Denite -buffer-name=search -resume -mode=normal<CR>

  call denite#custom#option('default', 'prompt', '>')

  if executable('rg')
    call denite#custom#var('file_rec', 'command',
          \ ['rg', '--files', '--glob', '!.git'])
    " Ripgrep command on grep source
    call denite#custom#var('grep', 'command', ['rg', '--smart-case'])
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

  " autocmd FileType denite set winblend=10
  " autocmd FileType denite-filter set winblend=10
endif


"==============================
" Defx
"==============================
nnoremap <silent><C-e> :<C-u>Defx -split=vertical -winwidth=40 -direction=topleft -toggle<CR>
nnoremap <silent><C-a> :<C-u>Defx -resume<CR>

call defx#custom#option('_', {
    \ 'columns': 'indent:git:icons:filename',
    \ 'show_ignored_files': 0,
    \ 'root_marker': '> ',
    \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
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
    nnoremap <silent><buffer><expr> t
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
    " 【d】 ファイルを削除する
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    " 【r】 ファイル名を変更する
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    " 【e】 ツリーを表示/非表示する
    nnoremap <silent><buffer><expr> e
    \ defx#do_action('open_or_close_tree')
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

" update defx status automatically when changing file
autocmd BufWritePost * call defx#redraw()


"==============================
" key-bind
"==============================
"emacs-like key bind
"imap <silent> <c-p> <up>
"imap <silent> <c-n> <down>
"imap <silent> <c-b> <left>
"imap <silent> <c-f> <right>
"imap <silent> <c-a> <home>
"imap <silent> <c-e> <end>
"imap <silent> <c-d> <del>
"imap <silent> <C-K> <C-O>
"imap <silent> <C-Y> <C-R>

"括弧の補完(改行してインデント)
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " ""<LEFT>
" inoremap ' ''<LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

" =======================================
" 基本的なキーマッピング変更
" =======================================
noremap j gj
noremap k gk
noremap <S-h> g^
noremap <S-l> g$
noremap <S-m> %
noremap <S-j> }
noremap <S-k> {

"jjでノーマルモード
" inoremap jj <esc>

"エスケープをcontrol+jにマッピング
imap <C-j> <esc>

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" 挿入モード時にカーソルを移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" tabにて対応ペアにジャンプ
nnoremap <tab> %
vnoremap <tab> %

"rだけでリドゥ
" nnoremap r <C-r>

"Yで行末までヤンク
nnoremap Y y$

" コマンドラインモードのマッピング
" 行頭へ移動
cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>

" QuickFix
" 前へ
nnoremap [q :<C-u>cprevious<CR>
" 次へ
nnoremap q] :<C-u>cnext<CR>
" 最初へ
nnoremap [Q :<C-u>cfirst<CR>
" 最後へ
nnoremap Q] :<C-u>clast
" QuickFixウィンドウを閉じる
nnoremap qc :<C-u>cclose<CR>

"**************************************************
" <Space>* によるキーバインド設定
"**************************************************

"--------------------------------------------------
" <Space>i でコードをインデント整形
map <Space>i gg=<S-g><C-o><C-o>zz

"--------------------------------------------------
" <Space>v で1行選択(\n含まず)
noremap <Space>v 0v$h

"--------------------------------------------------
" <Space>d で1行削除(\n含まずに dd)
noremap <Space>d 0v$hx

"--------------------------------------------------
" <Space>y で改行なしで1行コピー（\n を含まずに yy）
noremap <Space>y 0v$hy

"--------------------------------------------------
" <Space>s で置換
noremap <Space>s :%s/

"--------------------------------------------------
" <Space>co でコメントアウトの行頭の# を削除(Ruby形式)
map <Space>co ^xx<ESC>

" <Space>cd で編集ファイルのカレントディレクトリへと移動
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>
nnoremap <silent> <Space>; :<C-u>pwd<CR>
nnoremap <silent> <Space>~ :<C-u>cd ~<CR>

" ファイル再読込み
nnoremap <Space>re :<C-u>e!<CR>

" vimgrepなどで自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

" 全バッファに対してgrepする
" :bufdo vimgrepa {pattern} %
nnoremap ,bg :<C-u>bufdo vimgrepa

" デフォルトで起動するshellはzsh
set sh=zsh
" set termkey=<A-w>

" neovim terminal mapping
if has('nvim')
  " 新しいタブでターミナルを起動
  nnoremap <silent> <Space>t :tabe<CR>:terminal<CR>
  nnoremap <silent> ,t :<C-u>16Term<CR>
  nnoremap <silent> ,vt :<C-u>VTerm<CR>
  " Ctrl + q でターミナルを終了
  tnoremap <C-q> <C-\><C-n>:q<CR>
  " ESCでターミナルモードからノーマルモードへ
  tnoremap <silent> <ESC> <C-\><C-n>
  tnoremap <silent> <C-j> <C-\><C-n>
endif

function! s:open(args) abort
  if empty(term_list())
    execute "terminal" a:args
  else
    let bufnr = term_list()[0]
    execute term_getsize(bufnr)[0] . "new"
    execute "buffer + " bufnr
  endif
endfunction
" すでに :terminal が存在していればそのterminal を使用する
command! -nargs=*
\   Terminal call s:open(<q-args>)

" terminal起動直後にinsert抜ける(terminalモードへ)
" if has('nvim')
"   " Neovim 用
"   autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
" else
"   " Vim 用
"   autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
" endif

" neotermの設定
nnoremap @p :T python3 %<CR><c-w>j
" REPLを自動的に改行
let g:neoterm_autoscroll=1
" let g:neoterm_default_mod='horizontal'

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示


" =======================================
" tcomment_vimキーマップ変更
" =======================================
let g:tcomment_mapleader1 = '<C-_>'
let g:tcomment_mapleader2 = '<Leader>'
let g:tcomment_opleader1 = 'gc'
let g:tcomment_opleader2 = 'gC'

" tcommentで使用する形式を追加
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
  \'php_surround' : "<?php %s ?>",
  \'eruby_surround' : "<%% %s %%>",
  \'eruby_surround_minus' : "<%% %s -%%>",
  \'eruby_surround_equality' : "<%%= %s %%>",
\}

" =======================================
" emmetキーマップ変更
" =======================================
" let g:user_emmet_leader_key = '<C-E>' " default: <C-Y>
let g:user_emmet_settings = {'variables' : { 'lang' : 'ja' }}

" マッピングを追加
function! SetErubyMapping2()
  nmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  nmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  nmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>

  vmap <buffer> <C-_>c :TCommentAs eruby_surround<CR>
  vmap <buffer> <C-_>- :TCommentAs eruby_surround_minus<CR>
  vmap <buffer> <C-_>= :TCommentAs eruby_surround_equality<CR>
endfunction

" erubyのときだけ設定を追加
au FileType eruby call SetErubyMapping2()
" phpのときだけ設定を追加
au FileType php nmap <buffer><C-_>c :TCommentAs php_surround<CR>
au FileType php vmap <buffer><C-_>c :TCommentAs php_surround<CR>


" =======================================
" Markdownの設定
" =======================================
" set syntax=markdown
set shellslash
" ,pvでプレビュー
" nnoremap <silent> ,pv :PrevimOpen<CR>
nmap <silent> ,pv <Plug>MarkdownPreview

if has("autocmd")
  augroup MyAutoCmd
    autocmd!

    " md等の拡張子をMarkdownと判断させるための設定
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    " イタリックフォントを無効にする設定
    autocmd FileType markdown hi! def link markdownItalic LineNr
  augroup END
endif
" html
hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg

" markdownの折りたたみなし
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_new_list_item_indent = 2
" for plasticboy/vim-markdown
" let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_liquid=1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_toc_autofit = 1
" let g:vim_markdown_folding_style_pythonic = 1
" 強調(**)など同じ行内に閉じる**がなければ強調しない
let g:vim_markdown_empasis_multiline = 1
" 強調文字(**)など隠さない
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:markdown_fenced_languages = [
\  'coffee',
\  'css',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'xml',
\  'zsh',
\  'scala',
\  'java',
\  'c',
\  'php'
\]

" previmのプレビューのデザイン変更
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = '~/.previm/markdown.css'

" nyaovim-markdown-preview
let g:markdown_preview_auto = 1


" =======================================
" Vim-Quickrun
" =======================================
let g:quickrun_config = {
\   "_" :{
\       'runner'    : 'vimproc',
\       'runner/vimproc/updatetime' : 60,
\       'outputter' : 'error',
\       'outputter/error/success' : 'buffer',
\       'outputter/error/error'   : 'quickfix',
\       'outputter/buffer/split'  : ':rightbelow 15sp',
\       'outputter/buffer/close_on_empty' : 1,
\   },
\   "tex" : {
\       'command' : 'latexmk',
\       'outputter/error/error' : 'quickfix',
\       'hook/cd/directory': '%S:h',
\       'exec': '%c %s'
\   },
\   "cpp" : {
\       'command': 'g++',
\       'cmdopt': '-std=c++17 -Wall -O3'
\   },
\   "python": {
\       'command': 'python3'
\   },
\}
let g:quickrun_config['vim'] = {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "utf-8",
\}
" 出力バッファ閉じる(Space + q)
nnoremap <silent> <Space>q :<C-u>bw! \[quickrun\ output\]<CR>
" キーマッピング変更(Space + r)
nnoremap <silent> <Space>rr :QuickRun<CR>
" <C-c>でquickrun停止
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


"tex形式のファイルにおいてgqコマンドを実行した時には選択範囲に対してmarkdown->LaTex変換を行うようにする
augroup texfile
autocmd BufRead,BufNewFile *.tex set filetype=tex
let md_to_latex  = "pandoc --from=markdown --to=latex"
autocmd Filetype tex let &formatprg=md_to_latex
augroup END

" Ocamlにおけるmerlin(エラーチェック)の設定
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute 'set rtp+=' . g:opamshare . '/merlin/vim'


"自動でペーストモード
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function! XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" jedi
let g:deoplete#sources#jedi#server_timeout=100
let g:deoplete#sources#jedi#statement_length=100
" jedi本体の補完は切る（deoplete-jediで非同期処理をしてくれるため）
let g:jedi#completions_enabled = 0

" =======================================
" neosnippet
" =======================================
imap <C-l> <Plug>(neosnippet_expand_or_jump)
smap <C-l> <Plug>(neosnippet_expand_or_jump)
xmap <C-l> <Plug>(neosnippet_expand_target)
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" =======================================
" vim-airline
" =======================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#ale#enabled = 1
" 上部タブバー右にバッファを表示させない
" let g:airline#extensions#tabline#show_splits = 0
let g:airline_theme = 'jellybeans'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''

" ale symbols
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '

let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': '0 ',
  \ '1': '1 ',
  \ '2': '2 ',
  \ '3': '3 ',
  \ '4': '4 ',
  \ '5': '5 ',
  \ '6': '6 ',
  \ '7': '7 ',
  \ '8': '8 ',
  \ '9': '9 '
  \}

set timeout timeoutlen=1000 ttimeoutlen=50

" =======================================
" gitgutter
" =======================================
" gitの差分を表示
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
nmap ,gv <Plug>(GitGutterPreviewHunk)
nmap ,gn <Plug>(GitGutterNextHunk)
nmap ,gp <Plug>(GitGutterPrevHunk)
set updatetime=250

" =======================================
" fugitive
" =======================================
" Gstatusのウィンドウを閉じるコマンドは'gq'
nnoremap <silent> <Space>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Space>gl :<C-u>Glog<CR>
nnoremap <silent> <Space>ga :<C-u>Gwrite<CR>
nnoremap <silent> <Space>gc :<C-u>Gcommit<CR>
nnoremap <silent> <Space>gca :<C-u>Gcommit --amend<CR>
nnoremap <silent> <Space>gd :<C-u>Gdiff<CR>
nnoremap <silent> <Space>gb :<C-u>Gblame<CR>
nnoremap <silent> <Space>gps :<C-u>Gpush<CR>
nnoremap <silent> <Space>gpl :<C-u>Gpull<CR>

" =======================================
" fzf
" =======================================
nnoremap <silent> <Space>b :<C-u>Buffers<CR>
nnoremap <silent> <Space>x :<C-u>Commands<CR>
nnoremap <silent> <Space>f :<C-u>Files<CR>
nnoremap <silent> <Space>l :<C-u>Lines<CR>
nnoremap <silent> <Space>gf :<C-u>GFiles<CR>
nnoremap <silent> <Space>cm :<C-u>Commits<CR>
nnoremap <silent> <Space>rg :<C-u>Rg<CR>
nnoremap <silent> <Space>u :<C-u>FZFMru<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" 絞り込み画面新規タブ
" let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'down': '~70%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang Buffers
  \ call fzf#vim#buffers({'options': '--reverse'})

command! -bang Commands
  \ call fzf#vim#commands({'options': '--reverse'})

command! -bang Lines
  \ call fzf#vim#lines({'options': '--reverse'})

command! -bang Commits
  \ call fzf#vim#commits({'options': '--reverse'})

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'options': '--reverse'}, 'right:50%:wrap'))

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s --reverse',
\  'down' : '~70%' })

" =======================================
" ctags
" =======================================
" tagsファイルの読み取り場所の設定
set tags+=.git/tags
" タグジャンプ先が複数ある場合にリスト表示
" nnoremap ,t g<C-]>
nnoremap <C-]> g<C-]>
nnoremap ,, g<C-]>
" タグジャンプ時に画面分割
nnoremap <silent> ,k :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <silent> ,h :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" auto-ctags
" セーブしたときに自動でctags実行
" let g:auto_ctags = 1
" .gitディレクトリにtagsファイルを作成する
let g:auto_ctags_directory_list = ['.git']
" ctagsのオプション指定
let g:auto_ctags_tags_args = '--recurse=yes --append=yes --tag-relative=yes --languages=Ruby,JavaScript,Python,Java --exclude=node_modules --exclude=vendor --exclude=.git --exclude=log'
let g:auto_ctags_set_tags_option = 0


" =======================================
" ALE(シンタックスチェッカー)
" =======================================
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

nnoremap ,sc :<C-u>ALELint<CR>
nmap <silent> ,p <Plug>(ale_previous)
nmap <silent> ,n <Plug>(ale_next)
nmap <silent> ,a <Plug>(ale_toggle)
command! ALEList call s:ale_list()
nnoremap ,m  :ALEList<CR>
autocmd MyAutoGroup FileType help,qf,man,ref let b:ale_enabled = 0

" シンボル変更
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_format = '[%linter%] %s (%severity%)'

let g:ale_linters = {
    \ 'javascript': ['eslint', 'prettier'],
    \ 'ruby': ['rubocop', 'ruby'],
    \ 'eruby': [],
    \ 'python': ['flake8'],
    \ 'go': ['golint'],
    \}

let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \}

" 各ツールの実行オプションを変更してPythonパスを固定
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'

" =======================================
" vim-easymotion
" =======================================
" general config
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

nnoremap [em] <Nop>
nmap <Space>m [em]
" FindMotion
map [em]f <Plug>(easymotion-fl)
map [em]t <Plug>(easymotion-tl)
map [em]F <Plug>(easymotion-Fl)
map [em]T <Plug>(easymotion-Tl)
map <C-s> <Plug>(easymotion-s2)
" LineMotion
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
let g:EasyMotion_startofline = 0
" SearchMotion
nmap <C-w> <Plug>(easymotion-sn)
xmap <C-w> <Plug>(easymotion-sn)
" RepeatMotion
map <Space>. <Plug>(easymotion-repeat)
map <Space>n <Plug>(easymotion-next)
map <Space>p <Plug>(easymotion-prev)

" =======================================
" clever-f.vim
" =======================================
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_not_overwrites_standard_mappings = 1
" f, Fのみ利用(t, Tは使わない)
map f <Plug>(clever-f-f)
map F <Plug>(clever-f-F)

" =======================================
" Gundo.vim
" =======================================
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap U :GundoToggle<CR>

" =======================================
" indentLine
" =======================================
" let g:indentLine_color_term = 240
let g:indentLine_color_term = 59
let g:indentLine_fileTypeExclude = ['denite', 'defx']


" =======================================
" Rainbow
" =======================================
let g:rainbow_active = 1

let g:rainbow_conf = {
  \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \  '*': {},
  \  'tex': {
  \   'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \  },
  \  'lisp': {
  \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \  },
  \  'vim': {
  \   'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \  },
  \  'html': {
  \   'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \  },
  \  'css': 0,
  \ }
\}

" =======================================
" vim-json
" =======================================
" jsonでダブルクォーテーション表示されるように
let g:vim_json_syntax_conceal = 0


" Goの設定
" =======================================
" vim-go
" =======================================
let g:go_highlight_chan_whitespace_error = 0
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_interfaces = 1
let g:go_template_autocreate = 0
let g:go_list_type = "quickfix"

autocmd FileType go nnoremap ;gob :GoBuild<CR>
autocmd FileType go nnoremap ;gor :GoRun<CR>
autocmd FileType go nnoremap ;got :GoTest<CR>
autocmd FileType go nnoremap ;goi :GoInstall<CR>

cnoremap ,goi GoImport<space>
cnoremap ,gor GoRename<space>
cnoremap ,god GoDrop<space>

" Goのインデント
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
" errという文字列をハイライト
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

"quickrunでgo testを走らせる
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config['go.test'] = {'command': 'go', 'exec' : ['%c test']}

" =======================================
" deoplete-go
" =======================================
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#package_dot = 1

" LanguageClient-nvim
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ }
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" set clipboard+=unnamedplus
if $TMUX == ''
  set clipboard+=unnamed
endif

" 選択範囲を<,c>でクリップボードに
vmap ,c :w !xsel -ib<CR><CR>

function! TrimTailSpaces()
  let s:tmppos = getpos(".")
  if &filetype == "markdown"
    " 行末に2space以上ある場合は2spaceまで切り詰める
    " 1spaceなら消去
    %s/\v(\s{2})?(\s+)?$/\1/e
    match Underlined /\s\{2}$/
  else
    " 行末のspaceを消去
    %s/\v\s+$//e
  endif
  call setpos(".", s:tmppos)
endfunction
" 保存時に行末スペースを除く
autocmd BufWritePre * :call TrimTailSpaces()

if filereadable(expand('~/dotfiles/command-mine.vim'))
  source ~/dotfiles/command-mine.vim
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

filetype plugin indent on
