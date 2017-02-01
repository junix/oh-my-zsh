#path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

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
source $ZSH/oh-my-zsh.sh

# === BEGIN plugins === {{{
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

export PATH=$HOME/bin:/usr/local/bin:$PATH

# language environment
export LANG=en_US.UTF-8


# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias mktemp="gmktemp"

# ============= [configuration sync] =============
DEFAULT_USER="junix"


export EDITOR=nvim

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

#alias vim='vim -w ~/.vimlog "$@"'

case $OS in
  "Darwin")
	alias javac="javac -J-Dfile.encoding=utf8"
	;;
   *)
	;;
esac

alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias grep="grep --color=auto"
alias -s html=subl   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=subl     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s erl=vim       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s sh=vim       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'


export PAGER='less -R -s -i'
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;34m'


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

## === BEGIN SUDO === {{{
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    #光标移动到行末
    zle end-of-line
}
#定义快捷键为： [Esc] [Esc]
zle -N sudo-command-line
## === END SUDO === }}}

bindkey "\e\e" sudo-command-line


## ====== [brew] ======
export HOMEBREW_GITHUB_API_TOKEN="92ac4e160124450816fcdb1f101b045e31514336"

#export GTK_PATH=/usr/local/lib/gtk-2.0
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home/



root() {
  PASSWORD=$(grep "^$1" /Users/junix/.doc/bit.password | awk '{print $4}')
  echo -e "$PASSWORD\n#root_$1" | reattach-to-user-namespace pbcopy
  #echo $PASSWORD
}

jdk17() {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home"
}

jdk18() {
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"
}

#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"


#. `brew --prefix`/etc/profile.d/z.sh

export PATH=/Users/junix/tmuxinator/bin:${PATH}

function md2html {
    markdown_py -x plantuml $1 >  $1".html"
    open $1".html"
}

function use_otp18() {
    export PATH=/usr/local/Cellar/erlang/18.1/bin:${PATH}
}


alias x801='ssh -t  mos@123.59.150.128'
alias x802='ssh -t  mos@123.59.150.129'
alias x803='ssh -t  mos@123.59.150.130'
alias x804='ssh -t  mos@123.59.150.155'
alias x805='ssh -t  mos@123.59.150.190'
alias x806='ssh -t  mos@123.59.150.139'
alias x807='ssh -t  mos@123.59.150.207'
alias x808='ssh -t  mos@123.59.150.208'
alias x809='ssh -t  mos@123.59.150.208 "ssh in-809-bj"'
alias x810='ssh -t  mos@106.75.9.157'
alias x811='ssh -t  mos@106.75.9.158'
alias x812='ssh -t  mos@106.75.9.159'

alias x901='mosh  mos@120.132.61.160 -- fish'
alias x902='mosh  mos@120.132.61.160 -- ssh in-902-bj'
alias x204='mosh  mos@120.132.61.160 -- ssh in-204-gd'
alias x205='mosh  mos@120.132.61.160 -- ssh in-205-gd'
alias xx901='ssh -t  mos@120.132.61.160 "fish"'
alias xx902='ssh -t  mos@120.132.61.174 "fish"'
alias xx204='ssh -t  mos@123.59.67.127 "fish"'
alias xx205='ssh -t  mos@123.59.45.124 "fish"'

# === x821 ~ x825 ===
alias x821='mosh  mos@120.132.61.160 -- ssh 10.10.31.56'
alias x822='mosh  mos@120.132.61.160 -- ssh 10.10.53.26'
alias x823='mosh  mos@120.132.61.160 -- ssh 10.10.60.240'
alias x824='mosh  mos@120.132.61.160 -- ssh 10.10.39.177'
alias x825='mosh  mos@120.132.61.160 -- ssh 10.10.38.126'

export PATH=/Users/junix/.cabal/bin:${PATH}
export PATH=/Users/junix/.local/bin:${PATH}


#ghci() { stack ghci }

export PATH=/Users/junix/.stack/programs/x86_64-osx/ghc-7.10.3/bin:${PATH}


ghc_8() {
    export PATH=/usr/local/Cellar/ghc/8.0.1/bin:${PATH}
}

#alias notebook='stack exec jupyter -- notebook'

alias ls='gls --color=auto'

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

# === FISH LIKE AUTO SUGGESTIONS===
# 支持fish的自动建议
AUTO_SUGGESTIONS=${HOME}/.zsh/zsh-autosuggestions
if [[ ! -d ${AUTO_SUGGESTIONS} ]]; then
    git clone git://github.com/zsh-users/zsh-autosuggestions ${AUTO_SUGGESTIONS}
fi
source ${AUTO_SUGGESTIONS}/zsh-autosuggestions.zsh

# === FISH SYNTAX HIGHLIGHTING ===
#brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# === ZSH-COMPLETIONS ===
# git clone ...
plugins=(… zsh-completions)
autoload -U compinit && compinit

# === BEGIN Z === {{{
source ${ZSH}/plugins/z/z.sh
plugins=(z)
# === END Z === }}}
