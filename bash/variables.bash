export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto
export PS1="$C5\$(date +%H:%M) $C10[\u@\h \W]$C8 \$(__git_ps1 '(%s)') $P\$ "
