call pathogen#runtime_append_all_bundles()

set nocompatible

colorscheme wombat

filetype indent plugin on
syntax on
set hidden

if has("gui_running")
  set guioptions-=T "No toolbar in gvim
  set guioptions-=r "No right scrollbar
  set guioptions-=L "No left scrollbar
  set guifont=Menlo\ Regular:h12
  highlight Cursor guifg=#000 guibg=#ff00ee
  highlight iCursor guifg=#000 guibg=#ff00ee
endif

set vb "Visual bell
set incsearch "Go to the first match as we search
set nowrap "No line wrapping
set wildmode=list:longest "Make cmdline tab completion similar to bash
set wildmenu "Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore+=tmp/cache/**
set showcmd " display incomplete commands
set ruler " show the cursor position all the time
set number "show line numbers
set laststatus=2

set expandtab "use spaces instead of tabstops
set smarttab
set autoindent
set shiftwidth=2
set softtabstop=2
set list listchars=tab:>-,trail:.,extends:>,precedes:<

"Color column 80 to help show long lines
set textwidth=80
set colorcolumn=+1

let mapleader=","

nmap <leader>wt :%s/\s\+$//<cr> "Remove trailing whitespace
nmap <leader>rt :!ctags --extra=+f -R *<cr><cr>
nmap <leader>p :set paste!<cr>

"Convert ruby hashes to 1.9 syntax
vmap <leader>h :s/:\([^ ,=]\+\)\s*=>/\1:/g<CR>


"--- PLUGIN SPECIFIC STUFF ---
"---bufexplorer
nmap <leader>b :BufExplorer<cr>

" Clear CommandT cache
nmap <leader>cf :CommandTFlush<cr>
" Allow CommandT plugin to cache a lot of files
let g:CommandTMaxFiles=50000

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
