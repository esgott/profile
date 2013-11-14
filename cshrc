setenv PATH /home/ezsoszi/bin:$PATH
setenv EDITOR vim
setenv WINEDITOR nedit
setenv LESS "-erX" #for git diff output (colorful less)

# ----- PROMPT -----
alias getDate 'date +"[%k:%M"]'
alias getCurrentGitBranch 'git symbolic-ref HEAD |& grep "refs/heads/" |& cut -c12- |& sed "s/\(.*\)/(\1) /" '
set DOLLAR = '$'
if ($?tcsh) then
  alias precmd set 'prompt="%{\033[0;32m%}`getCurrentGitBranch`%{\033[1;37m%}`hostname`%{\033[0;33m%} %~%{\033[0m%}%{\033[0m%} %{\033[1;37m%}`getDate`\n %{\033[0;34m%}$DOLLAR%{\033[0m%} "'
endif
# ----- /PROMPT -----

set history=10000        # command history
set savehist=10000
unset correct
set color               # coloured Tab completions
