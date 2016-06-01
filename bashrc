if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.bash/variables.bash
source ~/.bash/functions.bash
source ~/.bash/aliases.bash

for f in ~/.bash/completion/*.bash; do
  source $f
done
