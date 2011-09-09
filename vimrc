call pathogen#runtime_append_all_bundles()

set nocompatible

colorscheme wombat

filetype indent plugin on
syntax on
set hidden

if has("gui_running")
  set guioptions-=T "No toolbar in gvim
  set guifont=Menlo\ Regular:h12
endif

set vb "Visual bell
set incsearch "Go to the first match as we search
set nowrap "No line wrapping
set wildmode=list:longest "Make cmdline tab completion similar to bash
set wildmenu "Enable ctrl-n and ctrl-p to scroll thru matches
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

let mapleader=","

nmap <leader>wt :%s/\s\+$//<cr> "Remove trailing whitespace
nmap <leader>rt :!ctags --extra=+f -R *<cr><cr>
nmap <leader>p :set paste!<cr>

"--- PLUGIN SPECIFIC STUFF ---
"---NERDTree
nmap <leader>n :NERDTreeToggle<cr>

"---bufexplorer
nmap <leader>b :BufExplorer<cr>

" Allow CommandT plugin to cache a lot of files
let g:CommandTMaxFiles=50000
