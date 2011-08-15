" Thomas Shanks (tshanks@gatech.edu) c.vim config
" Available at github.com/tshanks/dotvim.git
" All rights reserved.  Not for redistribution.  Eat your vegetables.

"setlocal formatoptions=croql "already the default
setlocal cindent
setlocal nowrap

"setlocal comments=sr:/*,mb:*,el:*/,://

" Automatic "folding" in C code.  This is cool.
syntax sync fromstart
setlocal foldenable
setlocal foldmethod=syntax 
setlocal foldminlines=5
"setlocal foldcolumn=0
"syn region Block start="{" end="}" transparent fold

" C only
"syn region Comment start="/\*" end="\*/" fold

setlocal tw=79

" Some (especially comments) from 
" http://www.mattrope.com/computers/conf/vimrc.html

" Programming Keys:
"   F9  = Make
"   F10 = Next Error
"   F11 = Prev Error
inoremap <F9> <Esc>:make<CR>
inoremap <F10> <Esc>:cnext<CR>
inoremap <F11> <Esc>:cprev<CR>
noremap <F9> <Esc>:make<CR>
noremap <F10> <Esc>:cnext<CR>
noremap <F11> <Esc>:cprev<CR>

set tags=./tags,./../tags,tags,../tags,~/.findctagshere/tags,$TAGS

" Cscope settings
if has("cscope")
	" quickfix window usage
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	" :tag and the like use :cstag
	set cscopetag
	" first search cscope, than tags file
	set cscopetagorder=0
	set nocsverb
	" add any database in file's directory, current directory, or one
	" directory above either.
	if filereadable("./cscope.out")
		cs add ./cscope.out
	elseif filereadable("./../cscope.out")
		cs add ./../cscope.out
	elseif filereadable("cscope.out")
		cs add cscope.out
	elseif filereadable("../cscope.out")
		cs add ../cscope.out
	elseif filereadable("~/.findcscopehere/cscope.out")
		cs add ~/.findctagshere/cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

" Make tab perform keyword/tag completion if we're not following whitespace
inoremap <tab> <c-r>=pumvisible() ? "\<lt>c-p>"  : InsertTabWrapper()<cr>

function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>\<c-n>"
	endif
endfunction
