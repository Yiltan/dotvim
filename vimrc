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
" yegappan/lsp - Language Server Protocol client
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'yegappan/lsp'

call plug#end()

" Register language servers here, e.g.:
" let lspServers = [#{
" \   name: 'clangd',
" \   filetype: ['c', 'cpp'],
" \   path: '/usr/bin/clangd',
" \   args: ['--background-index']
" \ }]
" autocmd VimEnter * call LspAddServer(lspServers)

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

"Type :PlugInstall into vim
