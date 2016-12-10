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

" Indent by filetype
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2

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


"-------------NERDTree--------------"
nmap <C-b> :NERDTreeToggle<cr>


"-------------Ctrl-P--------------"
nmap <C-r> :CtrlPBufTag<cr>
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

set wildignore+=*/vendor/**
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"-------------Powerline--------------"
" Airline (Fancy thingy at bottom stuff)
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
let g:gitgutter_async = 0
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = ''
let g:airline_theme = 'bubblegum'
let g:airline#extensions#branch#enabled = 1


"-------------Tagbar--------------"
nmap <D-r> :TagbarOpenAutoClose<CR>

"-------------Import PHP Namespaces--------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"-------------Vdebug--------------"
let g:vdebug_options={}
let g:vdebug_options["break_on_open"] = 0
if filereadable("./vdebug.vim")
       so ./vdebug.vim
endif

"-------------Greplace--------------"
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"-------------PHP CS Fixer--------------"
"let g:php_cs_fixer_level = "symfony"
nnoremap <silent><leader>af :call PhpCsFixerFixFile()<CR>


"-------------Golang--------------"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1

"-------------Syntastic--------------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "v-']
let g:syntastic_html_tidy_ignore_errors=[
    \"proprietary attribute" ,
    \"trimming empty <",
    \"unescaped &" ,
    \"lacks \"action",
    \"is not recognized!",
    \"discarding unexpected",
    \"lacks value",
    \"attribute name \"(",
    \"attribute name \"[",
    \"attribute name \"*",
    \"allowed in <head>"
\]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
"let g:syntastic_quiet_messages = { "type": "style"  }

"-------------Docblocks--------------"
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"-------------Auto-Complete--------------"
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,blade setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
