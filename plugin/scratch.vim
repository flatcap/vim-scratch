" scratch.vim - Temporary work space
" Author:       Rich Russon (flatcap) <rich@flatcap.org>
" Website:      https://flatcap.org
" Copyright:    2012-2015 Richard Russon
" License:      GPLv3 <http://fsf.org/>
" Version:      1.0

if (exists ('g:loaded_scratch') || &cp || (v:version < 700))
	finish
endif
let g:loaded_scratch = 1

nnoremap <silent> <Plug>ScratchHorizontal :<C-U>call scratch#CreateBuffer(0)<CR>
nnoremap <silent> <Plug>ScratchVertical   :<C-U>call scratch#CreateBuffer(1)<CR>

