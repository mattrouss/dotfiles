# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/mattrouss/.oh-my-zsh"

# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

export PATH=/opt/cuda/bin:$PATH
export PYTHON_PATH=/usr/lib/python3.7/site-packages

plugins=(git kubectl docker pip heroku git-extras git-flow command-not-found common-aliases compleat zsh-z virtualenv zsh-autosuggestions zsh-syntax-highlighting python)

powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

alias ls='ls --color=auto'
alias i3lock='i3lock --color=000000'

eval $(thefuck --alias)
