"Setup vundle - a vim plugin management tool

set nocompatible  " required!
filetype off  " required!
set runtimepath+=~/.vim/vundle/ 
call vundle#rc()
"My Plugins
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails'

colorscheme default
filetype plugin on
filetype indent on
syntax on

set nocompatible
set autoindent
set backspace=2
set cindent shiftwidth=4
set diffopt=filler
set expandtab
set guioptions-=m
set guioptions-=T
set nohidden
set history=50
set incsearch
set laststatus=2
set linebreak
set matchtime=5
set notimeout
set nottimeout
set ruler
set scrolloff=1
set shiftwidth=4
set showcmd
set showmatch
set softtabstop=4
set virtualedit=block
set wildmenu
set listchars=tab:>-,trail:-
set wildmode=list:longest,full
set helpfile=$VIMRUNTIME/doc/help.txt
set path+=.,..,../..,../../..,../../../..,/usr/include
set mouse=a
set hlsearch
set showmode
set modeline
set nowrap
set shiftround
set ffs=unix,dos,mac
set whichwrap=h,l,~,[,]
  
autocmd FileType c set noexpandtab shiftwidth=4 tabstop=4 formatoptions+=ro makeprg=gcc\ -lm\ -W\ -Wall\ -Wextra\ -O2\ %
autocmd FileType cpp set noexpandtab shiftwidth=4 tabstop=4 makeprg=g++\ -W\ -Wall\ -Wextra\ -O2\ %
autocmd FileType java set noexpandtab shiftwidth=4 tabstop=4 makeprg=javac\ %
autocmd FileType perl set smartindent
autocmd FileType css set smartindent
autocmd FileType html set noci noai nosi
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType python set shiftwidth=4 tabstop=4 expandtab
autocmd FileType ruby set shiftwidth=2 tabstop=2 expandtab makeprg=ruby\ -c\ %

autocmd! BufNewFile * silent! 0r $HOME/.vim/skeletons/template.%:e

" for c/cpp compile and run
noremap <F5> <Esc>:make<Enter>
noremap <F6> <Esc>:!./a.out<Enter>
" for contests
noremap <F7> <Esc>:!g++<Space>-W<Space>-Wall<Space>-Wextra<Space>-O2<Space>%<Space>&&<Space>./a.out<Enter>