set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


execute pathogen#infect()
color koehler
syntax on

" line indentation and tab spacing
filetype indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set ruler
set laststatus=2
set hlsearch
set ignorecase
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
"set guifont=Lucida_Console
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
if has("gui_running")
	" GUI is running or is about to start.
	set lines=50 columns=175
endif

function! FixWebArticle()
	%s/\|/--/g
	%s/\|/'/g
	%s/\|/"/g
	%s/^$/<\/p><p>/g
	%s/\%^/<p>/
	%s/\%$/<\/p>/
	%s/\(Want more from Matt Walsh?\)\|\(Follow Matt on Facebook\)\|\(Follow Matt on Twitter\)//g
	g/(AP)/d
	g/(AP Photo\//d
	g/(Photo by /d
	g/Getty Images)/d
	g/^\s*$/d
	w! $userprofile/Desktop/readme.htm
endfunc

function! ConvertDdlToLaravelMigration()
	%s/^.\[\(.*\)\] \[varchar\](\(\d\+\)) /\$table->string('\1', \2)/gi
	%s/^.\[\(.*\)\] \[int\] /\$table->integer('\1')/gi
	%s/^.\[\(.*\)\] \[tinyint\] /\$table->integer('\1')/gi
	%s/^.\[\(.*\)\] \[datetime\] /\$table->dateTime('\1')/gi
	%s/^.\[\(.*\)\] \[numeric\](\(.*\)) /\$table->decimal('\1', \2)/gi
	%s/NOT NULL,\=$/;/gi
	%s/NULL,\=$/->nullable();/gi
endfunc

function! FormatSkyConversation()
	g/\(AM\|PM\)$/-1j
	g/^\s*$/d
	%s/^\(.\{-} \d\d:\d\d \)\(AM\|PM\)/\r\1\2/gi
	:1d
endfunc
