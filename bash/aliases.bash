alias g='git status'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gcf='git commit --fixup'
alias gap='git add -p'
alias gl='git lg'
alias gd='git diff'
alias gdc='git diff --cached'
alias gp='git push'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias grc='git rebase --continue'
alias grb="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias srb='grb | fzf | xargs git co'
alias retag='ctags -R --exclude .git --exclude tmp/ --exclude log/ .'
alias nom='rm -rf node_modules && npm cache clear && npm install'
alias bom='rm -rf bower_components && bower cache clean && bower install'
alias v=$EDITOR
