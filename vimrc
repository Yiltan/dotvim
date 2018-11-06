""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree -  Project Explorer - Tree View of files/directories
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
autocmd vimenter * NERDTree " Open NERDTree automatically
autocmd vimenter * wincmd p " Move cursor into file automatically


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Monokai - Sumblime Text Colours
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sickill/vim-monokai'
syntax enable
colorscheme monokai

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                        " 256 colours
set number                          " Line numbers
set autoread                        " Update open files
set updatetime=250                  " File update interval
set tabstop=4                       " The width of a tab is set to 4.
set shiftwidth=4                    " Indents will have a width of 4
set softtabstop=4                   " Number of columns for a tab
set expandtab                       " Expand tabs to spaces
au FileType * set fo-=c fo-=r fo-=o " Disable annoying vim comment after newline
set splitbelow                      " Open splits below the current pane
set splitright                      " Open vsplits to the right of the current pane
set list                            " Show trailing whitespace and tabs
set listchars=tab:→\ ,trail:▫       " Characters to show as above
set cc=100                          " Set width bar
set nowrap                          " Disable wrap by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically strip trailling white space on write
fun! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"Type :PlugInstall into vim
