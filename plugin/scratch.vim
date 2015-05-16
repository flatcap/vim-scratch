" scratch.vim

let s:index = 0

function! s:save_file()
	if (!exists ('b:scratch'))
		" Don't interfere with others' buffers
		return
	endif

	let old = expand('%')
	let new = expand('<afile>')

	if ((old !~# '^__scratch__') || (new =~# '^__scratch__'))
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

	let s:index += 1
	let name = '__scratch__' . s:index

	if (vertical)
		execute 'vnew ' . name
	else
		execute 'new ' . name
	endif

	setlocal buftype=nofile
	setlocal bufhidden=delete
	setlocal nobuflisted
	setlocal noswapfile

	let b:scratch = s:index
endfunction

augroup Scratch
	autocmd!
	autocmd BufNew * call <SID>save_file()
augroup END

nmap <silent> <S-F5> :<C-U>call CreateScratch(1)<CR>

