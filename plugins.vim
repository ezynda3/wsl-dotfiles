" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'joonty/vdebug'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'othree/html5.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'fatih/vim-go'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'xsbeats/vim-blade'

call vundle#end()            " required
filetype plugin indent on    " required