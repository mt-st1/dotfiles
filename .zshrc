### General ###
setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する
setopt auto_menu               # 補完キー連打で補完候補を順に表示する
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt IGNOREEOF               # Ctrl+Dでログアウトしてしまうことを防ぐ
bindkey "^[[Z" reverse-menu-complete                # Shift-Tabで補完候補を逆順する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない
# setopt globdots      # 明確なドットの指定なしで.から始まるファイルをマッチ

### History ###
HISTFILE=~/.zsh_history     # ヒストリを保存するファイル
HISTSIZE=100000             # メモリに保存されるヒストリの件数
SAVEHIST=100000             # 保存されるヒストリの件数
DIRSTACKSIZE=100            # ディレクトリ移動の履歴保持数
setopt bang_hist            # !を使ったヒストリ展開を行う
setopt extended_history     # ヒストリに実行時間も保存する
setopt hist_ignore_dups     # 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
setopt share_history        # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する

autoload -U history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end

### Env Vars ###
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME="OneHalfDark"

export JAVA_HOME=`/usr/libexec/java_home -v 11`

### PATH ###
export PATH="$PATH:$HOME/scripts/mybin"
export PATH="$PATH:/opt/homebrew/bin" # brew
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts" # idea
export PATH="$JAVA_HOME/bin:$PATH" # Java

### Alias ###
alias vim='nvim'
alias oldvim="\vim"

if [[ $(command -v exa) ]]; then
  alias e='exa'
  alias ls=e
  alias ea='exa -a'
  alias l=ea
  alias el='exa -l --icons --git'
  alias ll=el
  alias ee='exa -ahl --icons --git'
  alias la=ee
  alias eot='exa -ahl -s modified -r' # 更新時間順 (Order by Time)
  alias lot=eot
  alias eos='exa -ahl -s size -r'     # ファイルサイズ順 (Order by Size)
  alias los=eos
  alias et='exa -T -L4 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
fi

## ref. [[https://github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh]]
# Disable correction.
alias ack='nocorrect ack'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias ebuild='nocorrect ebuild'
alias gcc='nocorrect gcc'
alias gist='nocorrect gist'
alias grep='nocorrect grep'
alias heroku='nocorrect heroku'
alias ln='nocorrect ln'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='nocorrect mysql'
alias rm='nocorrect rm'

# Disable globbing.
alias bower='noglob bower'
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# Define general aliases.
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias type='type -a'

# Safe ops. Ask the user before doing anything destructive.
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"

### Key binding ###
# bindkey -e # emacs
bindkey -v # vim

# viinsをemacsモードのように
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^E' end-of-line
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^B'  backward-char
bindkey -M viins '^F'  forward-char
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^Y'  yank

# Ctrl-Wでパスの文字列などをスラッシュ単位で削除する
autoload -U select-word-style
select-word-style bash

### ls when cd ###
# ターミナルウィンドウのタイトルを現在のカレントディレクトリの最後の2つのディレクトリ名に設定
function chpwd() { ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007" }

### zsh-syntax-highlighting ###
if [[ -s "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

### prezto completion ###
## ref. [[https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh]]
# cd時のtab補完や色をいい感じに設定
if [[ -s "${ZDOTDIR:-$HOME}/.zsh-prezto-completion.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh-prezto-completion.zsh"
fi

### asdf ###
. /opt/homebrew/opt/asdf/libexec/asdf.sh

### cdr ###
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
fi

### fzf ###
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"
export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden --follow --glob "!.git/*"'

function fzf-select-history() {  # コマンド履歴を検索
    BUFFER=$(history -n -r 1 | awk '!a[$0]++' | fzf --no-sort --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

function fzf-cdr() {  # cdrによるディレクトリ移動の履歴から検索しcd
  local selected_dir="$(cdr -l | sed -e 's/^[[:digit:]]*[[:blank:]]*//' | fzf --no-sort --query "$LBUFFER")"
  if [ -n "$selected_dir" ]; then
    eval "cd ${selected_dir}"
    zle clear-screen
  fi
  zle reset-prompt
}
zle -N fzf-cdr
bindkey '^j^j' fzf-cdr

function fzf-fd-cd() {  # カレントディレクトリ下(隠しディレクトリ除く)を探索しcd
  local selected_dir="$(fd --type d -E node_modules -E debug -E Library | fzf --query "$LBUFFER")"
  if [ -n "$selected_dir" ]; then
    eval "cd ${selected_dir}"
    zle clear-screen
  fi
  zle reset-prompt
}
zle -N fzf-fd-cd
bindkey '^j^f' fzf-fd-cd

function fzf-fd-hidden-cd() {  # カレントディレクトリ下(隠しディレクトリ含む)を探索しcd
  local selected_dir="$(
    fd --type d --hidden -E .git -E .cache -E node_modules -E debug -E Library --max-depth 8 \
      | fzf --query "$LBUFFER" \
  )"
  if [ -n "$selected_dir" ]; then
    eval "cd ${selected_dir}"
    zle clear-screen
  fi
  zle reset-prompt
}
zle -N fzf-fd-hidden-cd
bindkey '^j^a' fzf-fd-hidden-cd

function fzf-any-search() {
  local fdpath='fd . ~ --full-path --type d -E debug -E Library | sed -e "s/^/cd /"'
  local history='history -n 1 | sort | uniq | grep -v "cd" | tail -r'
  local result=$({ eval "$fdpath" ; eval "$history" ; } | fzf --query "$LBUFFER")
  if [[ "$result" =~ ^cd ]]; then
    eval "$result"
    zle clear-screen
  else
    BUFFER="$result"
    CURSOR=$#BUFFER
    zle clear-screen
  fi
}
zle -N fzf-any-search
bindkey '^\' fzf-any-search

function fzf-ghq() {  # `ghq list`でcloneしたリポジトリ検索しcd
  local root="$(ghq root)"
  local repo="$(ghq list | fzf --preview="ls -AF --color=always ${root}/{1}")"
  local dir="${root}/${repo}"
  if [[ -n "$repo" ]]; then
    cd "${dir}"
    zle clear-screen
  fi
  zle reset-prompt
}
zle -N fzf-ghq
bindkey '^g^g' fzf-ghq

function fzf-git-branch() {
  local selected_branch=$(
    git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads \
      | perl -pe 's{^refs/heads/}{}' \
      | fzf --query "$LBUFFER" --preview "git --no-pager l -20 --color=always {}"
  )
  if [[ -n "$selected_branch" ]]; then
    BUFFER="git checkout ${selected_branch}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-git-branch
bindkey "^g^b" fzf-git-branch

function fzf-ps() {  # プロセスIDを取得 (tabで複数選択可)
  local current_buffer=$BUFFER
  local pid
  pid=$(ps aux | sed 1d | fzf -m | awk '{print $2}' | sed -e "s/[\r\n]\+/ /g" | xargs echo)

  if [ "x$pid" != "x" ]; then
    BUFFER="${current_buffer}${pid}"
    CURSOR=$#BUFFER
  fi
  zle reset-prompt
}
zle -N fzf-ps
bindkey "^t^p" fzf-ps

### GitHub CLI ###
eval "$(gh completion -s zsh)"

### Starship ###
eval "$(starship init zsh)"

