" Thomas Shanks vimrc file (tshanks@cc.gatech.edu) 2:0.1
" All rights reserved.  Not for redistribution.  Eat your vegetables.

set nocompatible	" Use Vim defaults (much better!)

set backup		" keep a backup file
			" Put all backups in the same place
set backupdir=~/vimbackups

" Version 6.0-specific stuff
if version >= 600
	syntax enable
	set hlsearch
	filetype on
	filetype plugin on
	filetype indent on
else
	syntax on
endif

set showfulltag		" Get function usage help automatically
set showcmd		" Show current vim command in status bar

set visualbell		" kill the beeps! (visible bell)
set wildmenu		" use a scrollable menu for filename completions

set incsearch		" incremental search
set showmatch		" see matching {} ()
set backspace=2		" allow backspacing over everything in insert mode
set autoindent		" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set ruler		" show the cursor position all the time
set nowrap		" let it run off the screen
set ls=1		" puts seperate filename/linenum at bottom
set showmode
set nosol		" try to stay in the same column when jumping
set gdefault		" assume the /g flag on :s substitutions

" case insensitive searches unless something is capitalized
set ignorecase smartcase 

set sidescroll=4

"behave xterm

set suffixes-=.h		" Don't give .h low priority
set suffixes+=.aux
set suffixes+=.log
set wildignore+=*.dvi
set suffixes+=.bak
set suffixes+=~
set suffixes+=.swp
set suffixes+=.o
set suffixes+=.class

if has("gui_running")
	" gvim windows will use this
	colorscheme murphy
else
	" my terminals all have black backgrounds
	"set background=dark
endif

" Don't use Ex mode, use Q for formatting
map Q gq

if has("autocmd")
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
		\   exe "normal g'\"" |
		\ endif
	
	" When vim is used in a console window, set the title bar to the
	" name of the buffer being editted.
	if !has("gui_running")
		auto BufEnter * let &titlestring="VIM on ". hostname() . 
								\ ":" . expand("%:p")
	endif
endif

""if &term=="xterm"
""	set t_Co=8
""	set t_Sb=^[4%dm
""	set t_Sf=^[3%dm
""endif

" Disable ZZ (too dangerous, might be typed when all I meant was zz)
map ZZ :" ZZ is disabled.<CR>

"map <F9>  :w!<CR>:!aspell --lang=en -c %<CR>:e! %<CR>
command! Indent4Spaces setlocal tabstop=8 shiftwidth=4 expandtab softtabstop=4 shiftround
command! Indent2Spaces setlocal tabstop=8 shiftwidth=2 expandtab softtabstop=2 shiftround
command! IndentTabs setlocal tabstop=8 shiftwidth=8 noexpandtab softtabstop=0 noshiftround
"NO! tabstop should NEVER equal 4! "command! Indent4Tabs setlocal tabstop=4 shiftwidth=4 noexpandtab softtabstop=0 noshiftround

" Move text, but keep highlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Allow the . to execute once for each line in visual selection
vnoremap . :normal .<CR>

" Make ' function behave like ` usually does and then change ` to replay
" recorded macro a (as if @a was typed).  In visual mode, ` (which now acts
" like @a) should function on all selected lines.
noremap ' `
nnoremap ` @a
vnoremap ` :normal @a<CR>

" Buffer Switching:
"   F2 = next buffer
"   F3 = previous buffer
inoremap <F2> <Esc>:bn<CR>
inoremap <F3> <Esc>:bp<CR>
noremap <F2> <Esc>:bn<CR>
noremap <F3> <Esc>:bp<CR>

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Search files for modelines
set modeline

" Scan first 5 lines for modelines
set modelines=5
 
" We don't want no trojan horsies
set secure
