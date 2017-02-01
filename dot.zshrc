#path to your oh-my-zsh installation.
export ZSH_PROJECT=${HOME}/.oh-my-zsh
export ZSH=${ZSH_PROJECT}

# ===  BEGIN POWERLINE BULLET-TRAIN === {{{
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_CHAR=''
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_PROMPT_ORDER=(
   status
   custom
   dir
#  perl
#  ruby
#  virtualenv
#  nvm
   go
   git
   hg
   cmd_exec_time
)
# === END POWERLINE BULLET-TRAIN === }}}

# === source oh-my-zsh ===
source ${ZSH_PROJECT}/oh-my-zsh.sh

# === BEGIN plugins === {{{
plugins=(git)
plugins=(sudo)
plugins=(scala)
plugins=(sbt)
plugins=(git-flow)
plugins=(docker)
plugins=(python)
plugins=(tmuxinator)
plugins=(colored-man)
plugins=(tmux)
plugins=(osx)
plugins=(sbt)
plugins=(httpie)
plugins=(brew)
plugins=(z)
plugins=(zsh-autosuggestions)
# === END plugins === }}}


# language environment
export LANG=en_US.UTF-8


# Compilation flags
export ARCHFLAGS="-arch x86_64"

DEFAULT_USER="junix"

export EDITOR=nvim

# === BEGIN ZSH HISTORY UTILITIES === {{{
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
# === END ZSH HISTORY UTILITIES === }}}

alias ls='gls --color=auto'
alias grep="grep --color=auto"
alias ll='ls -l'
alias la='ls -a'

# === BEGIN PAGER === {{{
export PAGER='less -R -s -i'
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'
# === END PAGER === }}}


# === BEGIN FANCY CONTROL Z === {{{
fancy-ctrl-z () {
        if [[ $#BUFFER -eq 0  ]]; then
                BUFFER="fg"
                zle accept-line
        else
                zle push-input
                zle clear-screen
        fi

}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# === END FANCY CONTROL Z === }}}

## === BEGIN SUDO === {{{
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    #光标移动到行末
    zle end-of-line
}
#定义快捷键为： [Esc] [Esc]
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line
## === END SUDO === }}}

# for alfred workflow
root() {
  PASSWORD=$(grep "^$1" ${HOME}/.doc/bit.password | awk '{print $4}')
  echo -e "$PASSWORD\n#root_$1" | reattach-to-user-namespace pbcopy
}

## ====== brew ======
export HOMEBREW_GITHUB_API_TOKEN="84ac686900d66326f900b9be04ae3942346ec385"


# === BEGIN JAVA === {{{
JVM_DIR=/Library/Java/JavaVirtualMachines
jdk17() {
  export JAVA_HOME="${JVM_DIR}/jdk1.7.0_67.jdk/Contents/Home"
}

jdk18() {
  export JAVA_HOME="${JVM_DIR}/jdk1.8.0_66.jdk/Contents/Home"
}

jdk18
alias javac="javac -J-Dfile.encoding=utf8"
# === END JAVA === }}}


function md2html {
    markdown_py -x plantuml $1 >  $1".html"
    open $1".html"
}

function use_otp18() {
    export PATH=/usr/local/Cellar/erlang/18.1/bin:${PATH}
}


# === BEGIN Haskell === {{{

export PATH=/Users/junix/.cabal/bin:${PATH}
export PATH=/Users/junix/.local/bin:${PATH}


export PATH=/Users/junix/.stack/programs/x86_64-osx/ghc-7.10.3/bin:${PATH}


ghc_8() {
    export PATH=/usr/local/Cellar/ghc/8.0.1/bin:${PATH}
}
# === END Haskell === }}}

#alias notebook='stack exec jupyter -- notebook'


# `pw` copy the path to register
pw() {
  pwd | reattach-to-user-namespace pbcopy
  pwd
}


# === DOCKER ===
# 如果`docker-machine default`开启,则导入环境变量
if [[  $(docker-machine status default) = 'Running' ]]; then
    eval $(docker-machine env)
fi

# === 'z' 需要使用python3.x的环境 ===
export PYTHONPATH="/usr/local/lib/python3.6/site-packages:${PYTHONPATH}"

# === Vim8.0 需要使用python2的环境 ===
alias vim='env PYTHONPATH=/usr/local/lib/python2.7/site-packages /usr/local/Cellar/vim/8.0.0225/bin/vim'

# === vi 使用neovim ===
alias vi=nvim

# === support anaconda3's python notebook ===
export PATH="/opt/anaconda3/bin:$PATH"

# === BEGIN FISH LIKE AUTO SUGGESTIONS=== {{{
# 支持fish的自动建议
AUTO_SUGGESTIONS=${HOME}/.zsh/zsh-autosuggestions
source ${AUTO_SUGGESTIONS}/zsh-autosuggestions.zsh
# === END FISH LIKE AUTO SUGGESTIONS=== }}}

# === FISH SYNTAX HIGHLIGHTING ===
#brew install zsh-syntax-highlighting
source ${ZSH_PROJECT}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# === ZSH-COMPLETIONS ===
# git clone ...
plugins=(… zsh-completions)
autoload -U compinit && compinit

# === BEGIN Z === {{{
source ${ZSH_PROJECT}/plugins/z/z.sh
plugins=(z)
# === END Z === }}}

# === BEGIN 自动打开文件 === {{{
alias -s html=subl # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=subl   # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s erl=vim   # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s sh=vim    # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s py=vi     # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
# === END 自动打开文件 === }}}

export PATH=$HOME/bin:/usr/local/bin:$PATH

source ${ZSH_PROJECT}/hosts.alias

