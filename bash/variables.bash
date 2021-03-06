export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/bin:$PATH

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

YELLOW='\[\033[33m\]'
CYAN='\[\033[36m\]'
GREEN='\[\033[32m\]'
WHITE='\[\033[37m\]'
export PS1="$YELLOW\$(date +%H:%M) $CYAN[\u@\h \W]$GREEN \$(__git_ps1 '(%s)')\n$WHITE\$ "

if which nvim &> /dev/null; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export FZF_DEFAULT_COMMAND='ag -l -g ""'

VAULT_DMG=~/vault.dmg
