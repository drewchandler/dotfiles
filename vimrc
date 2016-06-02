call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-rails'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tsaleh/vim-align'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-scripts/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'nono/vim-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-eunuch'
Plug 'pangloss/vim-javascript'
Plug 'vim-ruby/vim-ruby'
Plug 'heartsentwined/vim-ember-script'
Plug 'heartsentwined/vim-emblem'
Plug 'wting/rust.vim'
Plug 'bling/vim-airline'
Plug 'othree/yajs.vim'
Plug 'jgdavey/tslime.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim'
Plug 'benekastah/neomake'
Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug '/usr/local/opt/fzf'

call plug#end()

set nocompatible

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme wombat

filetype indent plugin on
syntax on
set hidden

if has("gui_running")
  set guioptions-=T "No toolbar in gvim
  set guioptions-=r "No right scrollbar
  set guioptions-=L "No right scrollbar
  set guifont=Sauce\ Code\ for\ Powerline\ Regular:h12
  highlight Cursor guifg=#000 guibg=#ff00ee
  highlight iCursor guifg=#000 guibg=#ff00ee
endif

let g:airline_powerline_fonts = 1

set vb "Visual bell
set incsearch "Go to the first match as we search
set nowrap "No line wrapping
set wildmode=list:longest "Make cmdline tab completion similar to bash
set wildmenu "Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=*/tmp/*,*/node_modules/*,*/bower_components/*,*/dist/*
set showcmd " display incomplete commands
set ruler " show the cursor position all the time
set number "show line numbers
set laststatus=2
set nohlsearch

set expandtab "use spaces instead of tabstops
set smarttab
set autoindent
set shiftwidth=2
set softtabstop=2
set list listchars=tab:>-,trail:.,extends:>,precedes:<

"Color column 80 to help show long lines
set textwidth=80
set colorcolumn=+1

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

set backspace=2

let mapleader=","

nmap <leader>rt :!ctags --extra=+f -R *<cr><cr>
nmap <leader>p :set paste!<cr>

"Convert ruby hashes to 1.9 syntax
vmap <leader>h :s/:\@<!:\([^ ,=:]\+\)\s*=>/\1:/g<CR>

let whitespace_blacklist = ['diff']
autocmd BufWritePre * if index(whitespace_blacklist, &ft) < 0 |:%s/\s\+$//e

"--- PLUGIN SPECIFIC STUFF ---
"---bufexplorer
nmap <leader>b :BufExplorer<cr>

nmap <leader>t :Files<CR>

" Ack.vim should use the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

autocmd! BufReadPost,BufWritePost * Neomake

let g:neomake_open_list = 2
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'Todo',
            \ }

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_enabled_makers = ['jshint', 'jscs']
let g:neomake_haskell_enabled_makers = ['hlint']
let g:neomake_rust_enabled_makers = ['rustc']
let g:neomake_coffee_enabled_makers = ['coffeelint']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']

au BufNewFile,BufRead *.es6 setf javascript

au FileType ruby map <Leader>r :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby map <Leader>l :call RunLastSpec()<CR>
au FileType ruby map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" disable arrow keys
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
vmap <up> <nop>
vmap <down> <nop>
vmap <left> <nop>
vmap <right> <nop>
