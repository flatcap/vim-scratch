# scratch.vim

Create a temporary workspace.

## Introduction

Sometimes it's useful to create a scratchpad in Vim -- a temporary buffer where you can work on some data, then throw it away.
Vim-Scratch simply creates a new buffer which has no filename, no swapfile, no buffer listing and no lifespan.
The moment you close the window the information is lost.

## Workflow

Vim-Scratch allows you to manipulate data without cluttering the undo-history of the document.

A typical workflow might be:

1. I need a list of files in my document
2. Create a temporary workspace
3. List some files: `:r! ls -l directory`
4. Perform some Vim magic to tidy the listing
5. Copy the data: `:%y`
6. Close the temporary workspace: `:q`
7. Paste the data: `p`

## Saving

If you change your mind and want to save the data, then `:write` or `:saveas`.
Vim will do the Right Thing&#8482;.

```viml
:w new-filename.txt

:sav another-file.txt
```

A Vim `autocmd` automatically changes the settings to make the buffer into a normal file.

## Mappings

By default, Vim-Scratch has two &lt;Plug&gt; mappings for you to use:

```viml
<Plug>ScratchHorizontal
<Plug>ScratchVertical
```

To use them add a line to your `.vimrc`
e.g.

```viml
nmap <F3> <Plug>ScratchHorizontal
nmap <F4> <Plug>ScratchVertical

nmap <Leader>sh <Plug>ScratchHorizontal
nmap <Leader>sv <Plug>ScratchVertical
```

Alternatively, you can call the plugin from a script:

```viml
" Create Horizontal split
call scratch#CreateBuffer(0)

" Create Vertical split
call scratch#CreateBuffer(1)
```

## Configuration

This plugin has no configurable parts.

## License

Copyright &copy; Richard Russon (flatcap).
Distributed under the GPLv3 <http://fsf.org/>

## See also

- [flatcap.org](https://flatcap.org)
- [GitHub](https://github.com/flatcap/vim-scratch)

