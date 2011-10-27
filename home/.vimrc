"Setup vundle - a vim plugin management tool
" {{{
set nocompatible  " required for Vundle
filetype off  " required for Vundle
set runtimepath+=~/.vim/vundle/ 
call vundle#rc()
"My Plugins
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails'
" }}}

colorscheme default
filetype plugin on
filetype indent on
syntax on

set nocompatible

set autoindent " Copy indent from current line when starting a new line 
set backspace=indent,eol,start " make backspace a more flexible
"             |      |   |
"	      |      |   |+-- allow backspacing over autoindent
"             |      |+-- allow backspacing over line breaks (join lines)
"             |+-- allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.

set expandtab " expand tabs to spaces.
set smarttab " <Tab> acts based on 'shiftwidth' instead of 'tabstop'
set shiftwidth=4 " 4 char tab
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be
set shiftround " Round indent to multiple of 'shiftwidth'.  Applies to > and <	commands

set notimeout " do not timeout on key codes
set nottimeout " do not timeout on :mappings

set laststatus=2 " always show the status line
set ruler " Show the line and column number of the cursor position, separated by a
	  " comma.  When there is room, the relative position of the displayed
	  " text in the file is shown on the far right:
set showcmd " Show (partial) command in the last line of the screen
set showmode " If in Insert, Replace or Visual mode put a message on the last line.

set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink
                " matching brackets for


set wildmenu " turn on command line completion wild style
set wildmode=list:longest,full
"            |            |
"            |            |+-- Complete the next full match. After the last match the original 
"            |                 string is used and then the first match again.
"            |+-- When more than one match, list all matches and complete till longest common string.

set incsearch " hightlight as you type the search phrase
set ignorecase " case insensitive search
set smartcase " if there are caps, go case-sensitive
set hlsearch " " highlight all matches

set nowrap " do not wrap line
set whichwrap=h,l,~,[,] " Allow specified keys that move the cursor left/right to move to the
"                         previous/next line when the cursor is on the first/last character
set linebreak " on wrap mode break at a character in 'breakat' rather
	      " than at the last character that fits on the screen
  
set scrolloff=4  " Minimal number of screen lines to keep above and below the cursor
set fileformats=unix,dos,mac " support all three, in this order
set nohidden " When I close a tab, remove the buffer 
set history=50 " Number of command to remember
set nostartofline " leave my cursor where it was when executing some commands
set virtualedit=block " the cursor can be positioned where there is no actual character
                      " in visual block mode
set listchars=tab:>-,trail:- " show tabs and trailing spaces
set mouse=a " use mouse in all modes
set noerrorbells " don't make noise

autocmd FileType c setlocal makeprg=gcc\ -lm\ -W\ -Wall\ -Wextra\ -O2\ %
autocmd FileType cpp setlocal makeprg=g++\ -W\ -Wall\ -Wextra\ -O2\ %
autocmd FileType java setlocal makeprg=javac\ %
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 makeprg=ruby\ -c\ %

autocmd! BufNewFile * silent! 0r $HOME/.vim/skeletons/template.%:e

" for c/cpp compile and run
noremap <F5> <Esc>:make<Enter>
noremap <F6> <Esc>:!./a.out<Enter>
" for contests
noremap <F7> <Esc>:!g++<Space>-W<Space>-Wall<Space>-Wextra<Space>-O2<Space>%<Space>&&<Space>./a.out<Enter>
