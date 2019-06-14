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

" Change the invisible characters
set listchars=trail:.,tab:▸\ ,eol:¬,extends:❯,precedes:❮

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

augroup sage
  autocmd!
  au BufRead,BufNewFile *.sage set syntax=python
  au BufRead,BufNewFile *.sage set shiftwidth=4
  au BufRead,BufNewFile *.sage setf python
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
colorscheme OceanicNext

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:elm_syntastic_show_warnings = 1

let g:syntastic_javascript_checkers = ['standard']

" Vim-markdown
let g:vim_markdown_toc_autofit = 1

" CamelCaseMotion for bépo
map <silent> é <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap é
sunmap b
sunmap e
