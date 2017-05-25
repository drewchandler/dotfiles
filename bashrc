source ~/.bash/variables.bash
source ~/.bash/functions.bash
source ~/.bash/aliases.bash

if which brew &> /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
elif [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
  . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

for f in ~/.bash/completion/*.bash; do
  source $f
done

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.cargo/env ] && source ~/.cargo/env
if which rbenv &> /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv &> /dev/null; then eval "$(nodenv init -)"; fi
if which pyenv &> /dev/null; then eval "$(pyenv init -)"; fi
