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
