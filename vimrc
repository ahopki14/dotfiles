set nocompatible              " be iMproved, required
filetype off                  " required
set hlsearch                  " highlight search terms
set autoindent                " start new line at the same indentation level
set showmatch                 " Show matching bracets when text indicator is over them
set nobackup                  " do not keep backup files, it's 70's style cluttering
set noswapfile                " do not write annoying intermediate swap files,
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' 
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
Plugin 'preservim/nerdtree'
Plugin 'vim-scripts/VimCompletesMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Airline
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline_theme="murmur"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_section_y=''
let g:airline_skip_empty_sections = 1
let g:airline_section_z = '%2l/%L☰%2v'
nnoremap gb :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>

nnoremap <leader>? :NERDTreeToggle<CR>


" for tmux buffer
nnoremap <leader>r :call writefile(getreg("0",1,1),'/tmp/vimreg')<CR>

