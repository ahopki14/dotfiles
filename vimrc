set nocompatible              " be iMproved, required
filetype off                  " required
set hlsearch                  " highlight search terms
set autoindent                " start new line at the same indentation level
set showmatch                 " Show matching bracets when text indicator is over them
set nobackup                  " do not keep backup files, it's 70's style cluttering
set noswapfile                " do not write annoying intermediate swap files,

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'preservim/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nnoremap <leader>? :NERDTreeToggle<CR>


" for tmux buffer
nnoremap <leader>r :call writefile(getreg("0",1,1),'/tmp/vimreg')<CR>

