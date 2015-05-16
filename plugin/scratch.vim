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

function! s:save_file()
	if (!exists ('b:scratch'))
		" Don't interfere with others' buffers
		return
	endif

	let name = expand ('<afile>')
	if (name == '')
		return
	endif

	execute 'file ' . name
	unlet b:scratch

	" Set state to global defaults
	setlocal buftype<
	setlocal bufhidden<
	setlocal buflisted<
	setlocal swapfile<
endfunction


function! CreateScratch (...)
	let vertical = (a:0 > 0) ? a:1 : 0
	if (vertical)
		vertical new
	else
		new
	endif

	" Make the buffer invisible
	setlocal buftype=nofile
	setlocal bufhidden=delete
	setlocal nobuflisted
	setlocal noswapfile

	let b:scratch = 1
endfunction


augroup Scratch
	autocmd!
	autocmd BufNew * call <SID>save_file()
augroup END

nnoremap <silent> <S-F5> :<C-U>call CreateScratch(1)<CR>

