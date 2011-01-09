call pathogen#runtime_append_all_bundles()

set nocompatible

colorscheme wombat

filetype indent plugin on
syntax on

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
set laststatus=2

set expandtab "use spaces instead of tabstops
set smarttab
set autoindent
set shiftwidth=2
set softtabstop=2
set list listchars=tab:>-,trail:.,extends:>,precedes:<

let mapleader=","

nmap <leader>wt :%s/\s\+$//<cr> "Remove trailing whitespace

"--- PLUGIN SPECIFIC STUFF ---
"---NERDTree
nmap <leader>p :NERDTreeToggle<cr>

"---bufexplorer
nmap <leader>b :BufExplorer<cr>
