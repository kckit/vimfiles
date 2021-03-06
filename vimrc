" Load Pathogen {
    filetype off " necessary on some Linux distros for pathogen to properly load bundles
    call pathogen#helptags() " generate helptags
    call pathogen#runtime_append_all_bundles() " load pathogen managed plugins
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark " use a dark background
    colorscheme jellybeans "use jellybeans as default color scheme
    set cpoptions=aABceFsmq " Vim default: "aABceFs"
    "             |||||||||
    "             ||||||||+-- When joining multiple lines leave the cursor at the
    "             ||||||||     position where it would be when joineng two lines
    "             |||||||+-- When a new match is created (showmatch)
    "             |||||||     pause for .5
    "             ||||||+-- Set buffer option when entering the
    "             ||||||     buffer
    "             |||||+-- :write command updates current file name
    "             |||||
    "             ||||+-- Automatically add <CR> to the last line
    "             ||||     when using :@r
    "             |||+-- Searching continues at the end of the match
    "             |||     at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             ||
    "             |+-- :write updates alternative file name
    "             |
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    set encoding=utf-8 "use utf-8 encoding
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    "set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set backupdir=~/.vim/backup// " with double trailing // vim will
                                  " automatically use the full path to the file
                                  " /etc/X11/x.org and ~/x.org won't clobber each
                                  " other in your swap directory
    set directory=~/.vim/swp// " directory to place swap files in
    set clipboard+=unnamed " share windows clipboard
    set fileformats=unix,mac,dos " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    "set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list
" }

" Vim UI {
    " set cursorcolumn " highlight the current column
    " set cursorline " highlight the current line
    set incsearch " highlight as you type you search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " no extra pixel lines between rows
    set list " display unprintable characters
    set listchars=tab:>-,trail:-,precedes:<,extends:>
                                " show tabs and trailing
                                " show preceds and extends
    "set matchtime=5 " how many tenths of a second to blink
                    " matching brackets for
    set nohlsearch " highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 9999 lines
    set report=0 " tell us when aiything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid
                        " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F\ %m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]
    "              |   | | | |  |   |      |  |     |  |
    "              |   | | | |  |   |      |  |     |  +-- current
    "              |   | | | |  |   |      |  |     |       column
    "              |   | | | |  |   |      |  |     +-- current line
    "              |   | | | |  |   |      |  +-- current % into file
    "              |   | | | |  |   |      +-- current syntax in
    "              |   | | | |  |   |          square brackets
    "              |   | | | |  |   +-- current fileformat
    "              |   | | | |  +-- number of lines
    "              |   | | | +-- preview flag in square brackets
    "              |   | | +-- help flag in square brackets
    "              |   | +-- readonly flag en square brackets
    "              |   +-- modified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    "set completeopt= " don't use a pop up menu for completions
    set cindent " C style indent
    set expandtab " no real tabs
    set formatoptions=tnq " r - Automatically insert comment leader on return, [off]
                          " t - Auto-wrap text using textwidth
                          " n - When formatting text, recognize numbered lists.
                          " q - and let gq comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " Round indent to multiple of 'shiftwidth'
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent,
                     " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       " should a tab be (see sxpandtab)
    set tabstop=8 " real tabs should be 8, and they will show with
                  " set list on
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=999 " Don't autofold anything (but I can still
                       " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,search,tag
                                    " what movements open folds
" }

" Mappings {
    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>

    " Make Arrow Keys Useful Again {
        map <down> <ESC>:bn<RETURN>
        map <left> <ESC>:NERDTreeToggle<RETURN>
        map <right> <ESC>:Tlist<RETURN>
        map <up> <ESC>:bp<RETURN>
    " }
" }

" GUI Settings {
if has("gui_running")
    " Basics {
        "colorscheme tango3 " my color scheme (only works in GUI)
        set columns=120 " perfect size for me
        set guifont=Consolas:h14 " my favorite font
        let g:Powerline_symbols = 'fancy' "powerline fancy setting
        set guioptions=ce
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +-- use GUI tabs, not console style tabs
        set lines=70 " perfect size for me
        set mousehide " hide the mouse cursor when typing
    " }
endif
" }
