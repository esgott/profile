# shellcheck shell=bash

export EDITOR=vim
export ANDROID_HOME=~/Android/Sdk
export SBT_OPTS="-Xmx4G -Xss4M"

if [[ "$(uname)" == "Darwin" ]]; then
	PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
	MANPATH="/opt/homebrew/opt/gnu-tar/libexec/gnuman:/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
fi

function join_array { local IFS="$1"; shift; echo "$*"; }

eval "$(dircolors ~/.dircolors)"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mg='grep -iInsr'
alias mgu='grep -Insr'
alias ls='ls -h --color=auto'
alias dog="pygmentize -g"
alias vim="vim -p"
alias delete-branches="git branch | grep -v  master | xargs git branch -D"
alias mvn='mvn-color'
alias diff='colordiff -u'
alias mpv='pv --progress --timer --rate --average-rate --bytes'

mga () { mg "$@" ./*; }
mgua () { mgu "$@" ./*; }
mgfa () {
	local pattern="$1"
	shift
	mga --include "*.$pattern" "$@"
}
mgufa () {
	local pattern="$1"
	shift
	mgua --include "*.$pattern" "$@"
}

alias upgrade_system='yaourt -Syua'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -e ~/bin/tools.sh ]; then
	. ~/bin/tools.sh
fi
if [ -e ~/.platform_specific.sh ]; then
	. ~/.platform_specific.sh
fi

if command -v jenv &> /dev/null; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi
