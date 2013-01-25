#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Prompt
PS1='[\u@\h \W]\$ '

#Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
