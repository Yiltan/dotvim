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
" Vim Monokai - Sumblime Text Colours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'sickill/vim-monokai'
syntax enable
silent! colorscheme monokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A E S T H E T I C S
set t_Co=256                        " 256 colours
set cc=120                          " Set width bar
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

" clang-format integration for C/C++
" Uses -style=file, which searches up from the file's path for the nearest
" .clang-format, so each project's own style is respected.
autocmd FileType c,cpp setlocal formatprg=clang-format\ -style=file\ -assume-filename=%
autocmd FileType c,cpp nnoremap <buffer> <leader>cf :%!clang-format -style=file -assume-filename=%<CR>
autocmd FileType c,cpp vnoremap <buffer> <leader>cf :!clang-format -style=file -assume-filename=%<CR>

" Line wrapping
set wrap
set linebreak

"Backup files. Stop annoying .swp, .bak files
set nobackup
set nowritebackup

"Fold
set foldlevel=99
set foldmethod=syntax

" Other Settings
set modifiable

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

" Run clang-format on C/C++ buffers before writing, but only if the buffer
" actually has unsaved changes (skip on a no-op :w).
fun! <SID>ClangFormatBuffer()
   if &modified && executable('clang-format')
      let view = winsaveview()
      execute '%!clang-format -style=file -assume-filename=' . shellescape(expand('%'))
      call winrestview(view)
   endif
endfun

autocmd FileType c,cpp autocmd! BufWritePre <buffer> call <SID>ClangFormatBuffer()

"Type :PlugInstall into vim
