" This is the template .vimrc
"
" Some defaults to start off with
" F2 = toggle line numbering
" F3 = toggle showing invisible characters
" F4 = previous color scheme
" F5 = next color scheme

let mapleader = ","
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required

"PLUGINS
Plugin 'gmarik/Vundle.vim'

"Git
Plugin 'tpope/vim-fugitive.git'

"NERDTree
Plugin 'scrooloose/nerdtree'
autocmd vimenter * NERDTree
nnoremap <Leader>nrt :NERDTreeToggle<cr>

"Fuzzy File Search ctrlP
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ZoomWin'
nnoremap <Leader>wo :ZoomWin<CR>

"buffer explorer
Plugin 'fholgado/minibufexpl.vim'
Plugin 'rbgrouleff/bclose.vim' "for closing buffer without closing window or split
nnoremap <Leader>bd :Bclose<CR>


"for ctags
Plugin 'craigemery/vim-autotag'
set tags=tags,./tags

Plugin 'bling/vim-airline'

"autocomplete
Plugin 'neocomplcache'
nnoremap <Leader><Tab> :NeoComplCacheEnable<CR>
nnoremap <Leader><S-Tab> :NeoComplCacheDisable<CR>

Plugin 'vim-perl/vim-perl'

"color theme
Plugin 'pthk/vim-luna'

Plugin 'hzchirs/vim-material'

"editing parentheses
Plugin 'tpope/vim-surround'

"auto close parentheses
Plugin 'cohama/lexima.vim'
Plugin 'kien/rainbow_parentheses.vim'

Plugin 'tyru/current-func-info.vim'
let &statusline .= ' [%{cfi#format("%s", "")}]'
nnoremap <leader>cf :echo cfi#format("%s", "")<CR>

call vundle#end()            " required
filetype plugin indent on    " required

source ~/.vim/cyclecolor.vim
set t_Co=256
set background=dark
"colo xoria256
colorscheme luna-term
syntax enable
highlight clear

"GENERAL
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"set mouse=a
set expandtab                   " Make a tab to spaces, num of spaces set in tabstop
set shiftwidth=4                " Number of spaces to use for autoindenting
set tabstop=4                   " A tab is four spaces
set smarttab                    " insert tabs at the start of a line according to
set list                        " show invisible characters
set listchars=tab:>Â·,trail:Â·    " but only show tabs and trailing whitespace
set number                      " Enable line numbers
set numberwidth=3               " Line number width
set pastetoggle=<Leader>p

"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"highlight NonText ctermfg=8 guifg=gray


"" SEARCHING and REPLACING
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nnoremap <leader><space> :noh<cr>
"select current word for replace
:nnoremap <Leader>rc :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
:nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>


" The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
"
" " All of your Plugins must be added before the following line

"MAPPINGS
"Misc
nmap <f2> :set number! number?<cr>
nmap <f3> :set list! list?<cr>
" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"normal! as typing letter in normal mode, so this will make a new line without
"entering insert mode
nnoremap <leader>nl :normal! o<cr>

"\r is <cr>   ,  <c-u> clearing any commands (like in terminal), \\ because
"inside string (escape character), g_ move to the last non-blank character of
"the current line. We use this instead of $ because $ would highlight the
"newline character as well, and this isn't what we want.
:onoremap ret :<c-u>execute "normal! /return.\*;\r:nohlsearch\r"<cr>

"window navigation
:nnoremap <Leader>w <C-w>

"VimDiff
nnoremap <Leader>df :diffthis<cr>
nnoremap <Leader>dfo :diffoff<cr>
nnoremap <Leader>dfp :diffput<cr>
nnoremap <Leader>dfg :diffget<cr>

"Booking Stuff
:nnoremap <Leader>bpc :!booking-perl ./%<CR>
:nnoremap <Leader>bp :!booking-perl
" work around booking shit
let g:syntastic_puppet_validate_disable = 1
let g:syntastic_puppet_lint_disable = 1

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
