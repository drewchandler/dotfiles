if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
source $HOME/.cargo/env

source ~/.bash/variables.bash
source ~/.bash/functions.bash
source ~/.bash/aliases.bash

for f in ~/.bash/completion/*.bash; do
  source $f
done
