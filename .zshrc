# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tmu/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

prompt gentoo

alias gs="git status"
alias gl="git log --graph --oneline --all"
alias pd="pushd"
alias ppd="popd"
alias up="cd .."
alias a="emacsclient -n"
alias ll="ls -la"
alias ls="ls --color=auto"
