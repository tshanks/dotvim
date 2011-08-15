" Thomas Shanks (tshanks@gatech.edu) vim pathogen config 
" Available at github.com/tshanks/dotvim.git
" All rights reserved.  Not for redistribution.  Eat your vegetables.

" Sourced at the beginning of vimrc during startup.

" Pathogen needs to run before plugin indent on
let s:filetypestate = &filetype
filetype off

" Prevent pathogen from self-sourcing
if !exists("g:pathogen_disabled")
	let g:pathogen_disabled = ['pathogen']
elseif count(g:pathogen_disabled, 'pathogen') < 1
	add(g:pathogen_disabled, 'pathogen')
endif

"call pathogen#runtime_append_all_bundles()
call pathogen#infect()

" Don't forget to set ignore = dirty on each .gitmodule so that you 
" can upgrade them without complaints about the help files being in the way
"
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

" Go find another bikeshed to hide behind; now it doesn't enable filetype if 
" it was off to begin with
if s:filetypestate
	filetype on
endif
