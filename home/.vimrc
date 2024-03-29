if has("autocmd")
  autocmd! bufwritepost .vimrc source ~/.vimrc
  autocmd! bufwritepost .vimrc.plugins source ~/.vimrc
endif

" Misc
let mapleader=','
set nocompatible                            " be iMproved, required
filetype off
set wrap                                    " Wrap lines...
set linebreak                               " ... whole words ...
set nolist                                  " .. but disables linebreak
set noswapfile                              " Don't create annoying *.swp files
set scrolloff=5                             " Start scrolling the file 5 lines before the end of the window
set spelllang=en,fr                         " Set default spelling language to English and French
set showcmd                                 " Display an incomplete command in the lower right corner
set showmode                                " Show current mode down the bottom
set laststatus=2                            " Always show the status line
set history=1000
set autoread
set backspace=indent,eol,start              " Make backspace behave rationally
set number relativenumber

set hidden

" Buffers
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>r :bnext<CR>
" Move to the previous buffer
nmap <leader>c :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Cool autocompletion
set wildmode=longest,list,full
set wildignore+=*.retry
set wildmenu

" Searching
set nohlsearch                              " Do not hightlight search result
set incsearch                               " Highlight search results instantly
set ignorecase                              " Ignore case
set smartcase                               " Override 'ignorecase' option if the search contains upper case characters.

" Indentation
set shiftwidth=2                            " Number of spaces to use in each autoindent step
set tabstop=2                               " Two tab spaces
set softtabstop=2                           " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                               " Spaces instead of tabs for better cross-editor compatibility
set smarttab                                " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                                 " Recommended seting for automatic C-style indentation
set autoindent                              " Keep the indent when creating a new line

" Spell checking
augroup writing
  autocmd!
  au BufRead,BufNewFile *.md,*.bib,*.tex,*.txt setlocal spell spelllang=en,fr
  au BufRead,BufNewFile *.md,*.bib,*.tex,*.txt set complete+=kspell
  au BufRead,BufNewFile *.md,*.bib,*.tex,*.txt set spellsuggest=best,5
augroup END

" Syntax coloring
augroup gdb
  autocmd!
  au BufRead,BufNewFile *.gdb,*.rr setf gdb
augroup END

augroup sage
  autocmd!
  au BufRead,BufNewFile *.sage set syntax=python
  au BufRead,BufNewFile *.sage set shiftwidth=4
  au BufRead,BufNewFile *.sage setf python
augroup END

augroup zest
  autocmd!
  au BufRead,BufNewFile *.zst set syntax=json
augroup END

let g:is_posix = 1                          " Better highlighting of shell files

filetype plugin indent on                   " Enable automatic filetype detection, filetype-specific plugins/indentation

source ~/.vimrc.plugins
source ~/.vimrc.bepo

" Colorscheme
syntax enable
set t_Co=256
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

if !empty(glob('~/.vim/plugged/oceanic-next'))
  colorscheme OceanicNext
endif

hi CursorLine cterm=NONE

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='oceanicnext'

"Ctrlp
let g:ctrlp_user_command = {
\ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
  \ },
\ 'fallback': 'find %s -type f'
\ }

" GitGutter
nmap gs <Plug>(GitGutterPrevHunk)
nmap gt <Plug>(GitGutterNextHunk)

" Vim-markdown
let g:vim_markdown_toc_autofit = 1

" CamelCaseMotion for bépo
map <silent> é <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap é
sunmap b
sunmap e
