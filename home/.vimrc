if has("autocmd")
  autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Misc
set nocompatible                            " be iMproved, required
filetype off
set wrap                                    " Wrap lines...
set linebreak                               " ... whole words ...
set nolist                                  " .. but disables linebreak
set number                                  " Show line numbers
set t_Co=256                                " Support for xterm with 256 colors
set ruler                                   " Show ruler
set noswapfile                              " Don't create annoying *.swp files
set scrolloff=5                             " Start scrolling the file 5 lines before the end of the window
set spelllang=en_uk                         " Set default spelling language to English
set wildmenu                                " Make tab completion act more like bash
set wildmode=list:longest                   " Tab complete to longest common string, like bash
set showcmd                                 " Display an incomplete command in the lower right corner
set showmode                                " Show current mode down the bottom
set laststatus=2                            " Always show the status line
set history=1000
set autoread
set cursorline
set backspace=indent,eol,start              " Make backspace behave rationally

" Change the invisible characters
set listchars=trail:.,tab:▸\ ,eol:¬,extends:❯,precedes:❮

" Searching
set hlsearch                                " Highlight searches
set incsearch                               " Highlight search results instantly
set ignorecase                              " Ignore case
set smartcase                               " Override 'ignorecase' option if the search contains upper case characters.

" Indentation
set shiftwidth=2                            " Number of spaces to use in each autoindent step
set tabstop=2                               " Two tab spaces
set softtabstop=2                           " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                               " Spaces instead of tabs for better cross-editor compatibility
set autoindent                              " Keep the indent when creating a new line
set smarttab                                " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                                 " Recommended seting for automatic C-style indentation
set autoindent                              " Automatic indentation in non-C files

let g:is_posix = 1                          " Better highlighting of shell files

filetype plugin indent on                   " Enable automatic filetype detection, filetype-specific plugins/indentation

" Colorscheme
syntax enable
set background=dark

source ~/.vimrc.plugins
source ~/.vimrc.bepo
