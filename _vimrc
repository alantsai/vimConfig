" Start the plugin Pathogen
call pathogen#infect()

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"-------------------
"Below are my setting to the vimrc, I put it at bottom
"because I think the later it is, it takes the precedient over the top
"
"Alan 10-Jul-2012(Tue): 23:04
"-------------------

"Setting this allow a dollar sign($) to be shown when doing c command.
set cpoptions+=$

"Allow cursor to move in to no character area
"set virtualedit=all

"Disable the beep noise and the flashing when pressing Esc in normal mode etc.
"Found from site: http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Setting so chinese is readable
"info from: http://edyfox.codecarver.org/html/vim_for_beginners.html
set encoding=utf8
set fileencodings=ucs-bom,utf-8,big5,cp936,gb18030,euc-jp,euc-kr,latin1
set ambiwidth=double "this allow puncuation such as quote (") to show two space.





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim7.1在windows下的編碼設置。By Huadong.Liu
"
" 想使用搜狗輸入法做為我主要的輸入法，但是當選擇以「繁體中文」為
" 輸出的時候，不知到爲什麽會變成亂碼，去網路上搜索一下，查到了
" 這設定，試了一下沒有出現亂碼了。
"
" 這方法有問題，如果以下設定的話，我使用搜狗輸出的是沒有亂碼，但其他
" 設定會出現問題，譬如我上面那個set cpoptions+=$就沒有效果了。
" 因此這編碼設定應該需要我在查一下。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding=utf-8
"set fileencodings=utf-8,chinese,latin-1
"if has("win32")
"set fileencoding=chinese
"else
"set fileencoding=utf-8
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Below are some bare minimum suggestion by Derek Wyatt
"
"From:
"http://www.derekwyatt.org/vim/the-vimrc-file/the-absolute-bare-minimum/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Forget being compatible with good ol' vi
set nocompatible

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Why is this not a default
" 
" This one means allow you to close a window of a buffer without having to
" save it first.
set hidden

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Here are some more Derek setting, this one set status bar to how Derek is

" Set the status line the way i like it
"
" Original was like this:
"
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" However, the I can not find the function in the middle, hence I delete that
" part.
"==============================================================================
" I have modified it to my needs, everythy value is followed by a space using
" "\ "
set stl+=%f\ 				"Path to the file name
set stl+=[%{&ff},%{&fileencoding},%Y]\ 	"Which os the file is created, encoding of file, file type to vim
set stl+=[Buf:#%n]\ 			"Buffer number.
set stl+=%m\ 				"Show Modiffer [+] for changed.
set stl+=%r\ 				"Attribute [RO] show read only.
set stl+=%=\ 				"This will make the following value to the right of the status bar.
set stl+=Line:%l/%L[%p%%]\ 		"Show currentLine / Maximum Line and percentage of file.

set stl+=Col:%3.3v\ 			"Coloum No. pad value using number 0 to fill the space of width,
					"Maximum and minimum set to width of 3.
					
set stl+=[%5.5b][0x%4.4B]		"Shows bytes of a curosr character. Max and Min set to 5. 
					"Bytes in Hex, prefix with 0x and max/mim width 4.  "Reason of 
					"setting large width is because of using Unicode value, which is 2 
					"to power of 16.

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=DejaVu_Sans_Mono:h12:cANSI
