# === BEGIN OH-MY-ZSH === {{{
export ZSH_PROJECT=${HOME}/.oh-my-zsh
export ZSH=${ZSH_PROJECT}
# === END OH-MY-ZSH === }}}

# === BEGIN POWERLINE BULLET-TRAIN OH-MY-ZSH THEME === {{{
# 必须在`source oh-my-zsh.sh`之前定义
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_CHAR=''
BULLETTRAIN_PROMPT_SEPARATE_LINE=false
BULLETTRAIN_DIR_EXTENDED=0
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

# === BEGIN source oh-my-zsh === {{{
source ${ZSH_PROJECT}/oh-my-zsh.sh
# === END source oh-my-zsh === }}}

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

# === BEGIN misc === {{{
export LANG=en_US.UTF-8

export ARCHFLAGS="-arch x86_64"

DEFAULT_USER="junix"

export EDITOR=nvim

export PATH=${HOME}/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/qt5/bin:$PATH"
# === END misc === }}}

# === BEGIN ZSH HISTORY UTILITIES === {{{
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
# === END ZSH HISTORY UTILITIES === }}}

# === BEGIN some alias === {{{
alias ls='gls --color=auto'
alias grep="grep --color=auto"
alias ll='ls -l'
alias la='ls -a'
# === END some alias === }}}

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

# === BEGIN SUDO === {{{
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

# === BEGIN git.brew === {{{
export HOMEBREW_GITHUB_API_TOKEN="c2a8aeb33d840fe4b0fde8347fd1b08ee241ca6a"
# === END git.brew === }}}

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

# === BEGIN HASKELL === {{{

export PATH=/Users/junix/.cabal/bin:${PATH}
export PATH=/Users/junix/.local/bin:${PATH}
#alias notebook='stack exec jupyter -- notebook'
export PATH=/Users/junix/.stack/programs/x86_64-osx/ghc-7.10.3/bin:${PATH}

ghc_8() {
    export PATH=/usr/local/Cellar/ghc/8.0.1/bin:${PATH}
}
# === END Haskell === }}}

# === BEGIN DOCKER === {{{
# 如果`docker-machine default`开启,则导入环境变量
if [[  $(docker-machine status default) = 'Running' ]]; then
    eval $(docker-machine env)
fi
# === END DOCKER === }}}

# === BEGIN PYTHON === {{{
# === 'z' 需要使用python3.x的环境 ===

alias z="/usr/local/lib/python3.6/site-packages z"
# === END PYTHON === }}}

# === BEGIN MARKDOWN === {{{
function md2html {
    markdown_py -x plantuml $1 >  $1".html"
    open $1".html"
}
# === END MARKDOWN === }}}

# === BEGIN VIM === {{{
# === Vim8.0 需要使用python2的环境 ===
alias vim='env PYTHONPATH=/usr/local/lib/python2.7/site-packages /usr/local/bin/vim'

# === vi 使用neovim ===
alias vi=nvim
# === END VIM === }}}

# === BEGIN SOME REATTACH-TO-USER-NAMESPACE UTILITIES === {{{
# `pw` copy the path to register
pw() {
  pwd | reattach-to-user-namespace pbcopy
  pwd
}
# === END SOME REATTACH-TO-USER-NAMESPACE UTILITIES === }}}

# === BEGIN FISH LIKE AUTO SUGGESTIONS=== {{{
# 支持fish的自动建议
AUTO_SUGGESTIONS=${HOME}/.zsh/zsh-autosuggestions
source ${AUTO_SUGGESTIONS}/zsh-autosuggestions.zsh
# === END FISH LIKE AUTO SUGGESTIONS=== }}}

# === BEGIN FISH SYNTAX HIGHLIGHTING === {{{
#brew install zsh-syntax-highlighting
source ${ZSH_PROJECT}/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# === END FISH SYNTAX HIGHLIGHTING === }}}

# === BEGIN ZSH-COMPLETIONS === {{{
plugins=(… zsh-completions)
autoload -U compinit && compinit
# === END ZSH-COMPLETIONS === }}}

# === BEGIN Z === {{{
source ${ZSH_PROJECT}/plugins/z/z.sh
plugins=(z)
# === END Z === }}}

# === BEGIN 自动打开文件 === {{{
alias -s html=subl # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=subl   # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s erl=vim   # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
# === END 自动打开文件 === }}}

# === BEGIN ANACONDA3'S PYTHON NOTEBOOK === {{{
export PATH=/opt/anaconda3/bin:${PATH}
# === END ANACONDA3'S PYTHON NOTEBOOK === }}}

# === BEGIN HOSTS ALIAS === {{{
source ${ZSH_PROJECT}/hosts.alias
# === END HOSTS ALIAS === }}}

# === BEGIN DB === {{{
skydb() {
  env PYTHONPATH=/usr/local/lib/python2.7/site-packages mycli -h 172.17.128.172 -u yxt -p pwdasdwx  skyeye
}
# === END DB === }}}

source /Users/junix/pyml3.6/bin/activate
export PYTHONPATH="/Users/junix/pyml3.6/lib/python3.6/site-packages"

alias c='mosh root@188.166.221.195'


function to8kwav {
        FILE_NAME=$(echo $1 | sed 's/\(.*\)\..*/\1/')
        ffmpeg -i $1 -acodec pcm_s16le -ar 8000  ${FILE_NAME}.wav
}

source ~/.oh-my-zsh/plugins/zsh-vcs-prompt/zshrc.sh
ZSH_VCS_PROMPT_ENABLE_CACHING='true'
RPROMPT='$(vcs_super_info)'


alias job_db="mycli -h 122.193.203.182 -u yxt -D octopus  -p  g7j4nmaU7YjEY6yqYh7NX9CY"


# === BEGIN ANACONDA === {{{
alias note="unset PYTHONPATH && /opt/anaconda/bin/jupyter_mac.command"
# === END ANACONDA === }}}


py_env() {
	source ~/py3.6/bin/activate && unset PYTHONPATH
}

alias py='source ~/py3.6/bin/activate && unset PYTHONPATH && ipython'
