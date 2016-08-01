export ANDROID_HOME="/Applications/Android Studio.app/sdk"

export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto

YELLOW='\[\033[33m\]'
CYAN='\[\033[36m\]'
GREEN='\[\033[32m\]'
WHITE='\[\033[37m\]'
export PS1="$YELLOW\$(date +%H:%M) $CYAN[\u@\h \W]$GREEN \$(__git_ps1 '(%s)')\n$WHITE\$ "

export EDITOR='nvim'

export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

VAULT_DMG=~/vault.dmg
