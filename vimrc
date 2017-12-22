call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-rails'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'nono/vim-handlebars'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-eunuch'
Plug 'vim-ruby/vim-ruby'
Plug 'heartsentwined/vim-ember-script'
Plug 'heartsentwined/vim-emblem'
Plug 'rust-lang/rust.vim'
Plug 'bling/vim-airline'
Plug 'jgdavey/tslime.vim'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/paredit.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline-themes'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
if filereadable(expand('~/.fzf/plugin/fzf.vim'))
  Plug '~/.fzf'
else
  Plug '/usr/local/opt/fzf'
endif
Plug 'rizzatti/dash.vim',  { 'on': 'Dash' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'racer-rust/vim-racer'
Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-unimpaired'
Plug 'wombat256.vim'
Plug 'elmcast/elm-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }

call plug#end()

set nocompatible

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme wombat256mod

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

let g:python_host_prog = expand('~/.pyenv/versions/py2neovim/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/py3neovim/bin/python')

let mapleader=","

nmap <leader>rt :!ctags --extra=+f -R *<cr><cr>
nmap <leader>p :set paste!<cr>

"Convert ruby hashes to 1.9 syntax
vmap <leader>h :s/:\@<!:\([^ ,=:]\+\)\s*=>/\1:/g<CR>

let whitespace_blacklist = ['diff']
autocmd BufWritePre * if index(whitespace_blacklist, &ft) < 0 |:%s/\s\+$//e

"--- PLUGIN SPECIFIC STUFF ---
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['tslint'],
  \ 'python': ['flake8']}
nmap <leader>d <Plug>(ale_fix)

"---bufexplorer
nmap <leader>b :BufExplorer<cr>

nmap <leader>t :Files<CR>

" Ack.vim should use the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

au BufNewFile,BufRead *.es6 setf javascript

au FileType python setl ts=8 et sw=4 sts=4

autocmd CompleteDone * pclose

if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.cs = '.*[^=\);]'
endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:rustfmt_autosave = 1

let g:elm_format_autosave = 1

let test#strategy = 'tslime'
nmap <silent> <Leader>r :TestNearest<CR>
nmap <silent> <Leader>R :TestFile<CR>
nmap <silent> <Leader>a :TestSuite<CR>
nmap <silent> <Leader>l :TestLast<CR>
nmap <silent> <Leader>g :TestVisit<CR>

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

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
