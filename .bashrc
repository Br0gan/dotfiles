#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for files in /home/br0gan/.dotfiles/bash_stuff/*
do
    source $files
done

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PATH=$PATH:/usr/local/go/bin:/usr/local/VSCode-linux-x64/bin/
export GOPATH=$HOME/work
