"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gitgutter (git diffs for vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree -  Project Explorer - Tree View of files/directories
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
autocmd vimenter * NERDTree " Open NERDTree automatically
autocmd vimenter * wincmd p " Move cursor into file automatically

let g:NERDTreeWinSize= 40

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic - Syntax Checker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'vim-syntastic/syntastic'
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
"
"let g:syntastic_cpp_compiler = "g++"
"let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
"let g:syntastic_cpp_checkers = ['syntastic-cpp-gcc']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Monokai - Sumblime Text Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sickill/vim-monokai'
syntax enable
colorscheme monokai

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A E S T H E T I C S
set t_Co=256                        " 256 colours
set cc=100                          " Set width bar
set number                          " Line numbers
set splitbelow                      " Open splits below the current pane
set splitright                      " Open vsplits to the right of the current pane
set list                            " Show trailing whitespace and tabs
set listchars=tab:→\ ,trail:▫       " Characters to show as above

" File settings
set autoread                        " Update open files
set updatetime=250                  " File update interval
au FileType * set fo-=c fo-=r fo-=o " Disable annoying vim comment after newline

" Tab settings
set tabstop=2                       " The width of a tab is set to 2.
set shiftwidth=2                    " Indents will have a width of 2
set softtabstop=2                   " Number of columns for a tab
set expandtab                       " Expand tabs to spaces

" Line wrapping
set wrap
set linebreak
set nolist

"Backup files. Stop annoying .swp, .bak files
set nobackup
set nowritebackup

"Fold
set foldlevel=99
set foldmethod=syntax

" GNU Formatting
setlocal cindent
setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
setlocal textwidth=79
setlocal fo-=ro fo+=cql

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically strip trailling white space on write
fun! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"Type :PlugInstall into vim
