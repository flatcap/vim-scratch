" scratch.vim

function! s:save_file()
	if (!exists ('b:scratch'))
		" Don't interfere with others' buffers
		return
	endif

	let old = expand('%')
	let new = expand('<afile>')

	if ((old != '') || (new == ''))
		return
	endif

	execute 'file ' . new
	unlet b:scratch

	" Set state to global defaults
	setlocal buftype<
	setlocal bufhidden<
	setlocal buflisted<
	setlocal swapfile<
endfunction


function! CreateScratch(...)
	let vertical = (a:0 > 0) ? a:1 : 0

	if (vertical)
		execute 'vnew '
	else
		execute 'new '
	endif

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

