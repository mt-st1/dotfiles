let g:python3_host_prog = "~/.config/nvim/neovim3/.venv/bin/python3"

"===========================
" Default settings
"===========================
syntax on
syntax enable
language messages C   " 各種メッセージを英語にする

"===========================
" 画面表示の設定
"===========================
set number            " 行番号を表示
set cursorline        " カーソル行の背景色を変える
set laststatus=2      " ステータス行を常に表示
set cmdheight=2       " メッセージ表示欄を2行確保
set showmatch         " 対応する括弧を強調表示
set helpheight=999    " ヘルプを画面いっぱいに開く
set title             " ウインドウのタイトルバーにファイルのパス情報等を表示する
set list              " 不可視文字を表示
set splitbelow        " 新しいウインドウを下に開く
set splitright        " 新しいウインドウを右に開く
set inccommand=split  " 文字列置換をインタラクティブに表示
set noshowmode        " 左下のinsertモードなどの表示をしない
set pumblend=10       " ポップアップメニューを半透明化
set encoding=utf-8
set termguicolors
set listchars=tab:\▸\-,extends:❯,precedes:❮ " 不可視文字の表示記号指定
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set winbar=%f
set laststatus=3      " global status line
set signcolumn=yes    " always display signcolumn for gitsigns.nvim
" set cmdheight=0       " hide command line

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

"============================
" タブ/インデントの設定
"============================
set expandtab       " タブ入力を複数の空白入力に置き換える
set tabstop=2       " 画面上でタブ文字が占める幅
set shiftwidth=2    " 自動インデントでずれる幅
set softtabstop=2   " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent      " 改行時に前の行のインデントを継続する
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"=============================
" 動作環境との統合関連の設定
"=============================
set clipboard+=unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set mouse+=a               " マウスの入力を受け付ける

"=============================
" コマンドラインの設定
"=============================
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効に>する
set noshowcmd     " 入力中のコマンドを表示しない
set history=10000 " コマンドラインの履歴を10000件保存する

"=============================
" ビープの設定
"=============================
set visualbell t_vb=  "ビープ音すべてを無効にする
set noerrorbells      "エラーメッセージの表示時にビープを鳴らさない

" ============================
" 基本的なキーバインド設定
" ============================
noremap j gj
noremap k gk
noremap <S-h> g^
noremap <S-l> g$
noremap <S-j> }
noremap <S-k> {

"エスケープをcontrol+jにマッピング
imap <C-j> <esc>

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" 挿入モード時にカーソルを移動
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" tabにて対応ペアにジャンプ
nnoremap <tab> %
vnoremap <tab> %

"Yで行末までヤンク
nnoremap Y y$

" コマンドラインモードのマッピング
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>


if exists('g:vscode')
  " -- VSCode extension -- 
else
  " -- ordinary Neovim --
  "============================
  " dein.vim setup
  "============================
  let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
  let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'

  " Set dein runtime path
  set runtimepath+=$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim

  if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    call dein#load_toml(s:dein_config_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:dein_config_dir . '/dein_lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
  endif

  " Install not-installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif

  "============================
  " color scheme
  "============================
  colorscheme onedark
  " colorscheme tokyonight-night

  "==================================
  " スプリットやバッファ, タブの設定
  "==================================
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
  nnoremap <silent>sQ :<C-u>bd<CR>
  nnoremap <silent><C-n> :<C-u>bn<CR>
  nnoremap <silent><C-p> :<C-u>bp<CR>
  nnoremap <silent>st :<C-u>tabnew<CR>
  nnoremap sn gt
  nnoremap sp gT

  nnoremap [Tag] <Nop>
  nmap s [Tag]
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

  " ================================
  " <Space>* によるキーバインド設定
  " ================================
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
  nnoremap <silent> <Space>cd :<C-u>CD<CR>
  " PWD
  nnoremap <silent> <Space>; :<C-u>pwd<CR>

  " ==================================
  " <Option>* のキーバインド設定
  " ==================================
  " Option+o でウィンドウ間を時計回りに移動
  noremap ø <C-w>w
  tnoremap ø <C-\><C-n><C-w>w
  " Option+O でウィンドウ間を反時計回りに移動
  noremap Ø <C-w>W
  tnoremap Ø <C-\><C-n><C-w>W
  " Option+z で他のウィンドウを閉じて最大化する
  noremap Ω <C-w>o
  tnoremap Ω <C-\><C-n><C-w>o
  " Option+q でバッファを削除
  noremap œ :<C-u>bd!<CR>
  tnoremap œ <C-\><C-n>:<C-u>bd!<CR>
  " Option+r でファイル再読込み
  noremap ® :<C-u>e!<CR>
  " Option+\ でTerminal-Normalモードに
  tnoremap « <C-\><C-n>

  "==================================
  " Terminalモードの設定
  "==================================
  nnoremap <silent> ,t :<C-u>split<CR>:resize 20<CR>:terminal<CR>
  nnoremap <silent> ,vt :<C-u>vsplit<CR>:terminal<CR>
  " ターミナルを開いたらに常にinsertモードに入る
  autocmd TermOpen * startinsert
  " ウィンドウを移動した際、ターミナルの場合は
  " 自動的にTerminal-Jobモードに切り替わるように
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
endif

filetype plugin indent on

