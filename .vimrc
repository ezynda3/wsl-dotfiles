syntax enable
set t_Co=256

set background=dark
colorscheme material-theme

set nocompatible              " be iMproved, required
filetype off                  " required


"-------------Plugins--------------"
so ~/.vim/plugins.vim

"-------------General Settings--------------"
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ','                                                     "The default leader is \, but a comma is much better.
filetype plugin indent on
set number								                                "Let's activate line numbers.
set showmode                                                            " always show what mode we're currentlyediting in
set nowrap                                                              " don't wrap lines
set tabstop=4                                                           " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4                                                       " when hitting <BS>, pretend like a tab isremoved, even if spaces
set expandtab                                                           " expand tabs by default (overloadable perfile type later)
set shiftwidth=4                                                        " number of spaces to use for autoindenting
set shiftround                                                          " use multiple of shiftwidth when indentingwith '<' and '>'
set backspace=indent,eol,start                                          " allow backspacing over everything in insertmode
set autoindent                                                          " always set autoindenting on
set copyindent                                                          " copy the previous indentation onautoindenting
set ignorecase                                                          " ignore case when searching
set smartcase                                                           " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                                                          " don't beep
set noerrorbells                                                        " don't beep
set autowrite                                                           "Save on buffer switch
set pastetoggle=<F2>
set incsearch                                                           " Search while you type
set rnu                                                                 " Relative line numbers

" Indent by filetype
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

"-------------Search--------------"
set hlsearch
set incsearch


"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>f :tag<space>


"-------------Split Management--------------"
set splitbelow
set splitright

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"-----------Syntastic----------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_vue_eslint_exe = '$(npm bin)/eslint'

"-------------NERDTree--------------"
nmap <C-b> :NERDTreeToggle<cr>


"-------------Ctrl-P--------------"
nmap <C-r> :CtrlPBufTag<cr>
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

set wildignore+=*/vendor/**
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"-------------Powerline--------------"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
