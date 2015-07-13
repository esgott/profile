export EDITOR=vim

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mg='grep -iInsr'
alias ls='ls -h --color=auto'
alias dog="pygmentize -g"
alias delete-branches="git branch | grep -v  master | xargs git branch -D"

mga () { mg "$@" *; }

alias upgrade_system='yaourt -Syua'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'