" scratch.vim

function! s:save_file()
	if (!exists ('b:scratch'))
		" Don't interfere with others' buffers
		return
	endif

	let name = expand('<afile>')
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


function! CreateScratch(...)
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

