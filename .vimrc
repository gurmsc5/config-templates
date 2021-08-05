syntax on

"Helpful settings
set noswapfile
set number
set ru
set autoindent
set ignorecase
set nocompatible

"Look for lines over 80 characters
map L /.\{81,}


if has ("autocmd")
  augroup makefiles
    "No tabs in makefiles
    au BufRead Makefile set noexpandtab
    au BufEnter Makefile set noexpandtab
    au BufLeave Makefile set expandtab
  augroup END

  augroup newcode
    "Update copyright messages when a file is modified
    au BufWritePre *.h,*.cpp,*.pl,*.java,*.py,Makefile
    \ if &modified |
    \    exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y") |
    \ endif
  augroup END

  augroup code
    au BufRead *.pl,*.sh,*.bashrc*,*.vimrc set smartindent
    au BufRead *.pl,*.h,*.cpp,*.py,*.java set tabstop=2
    au BufRead *.pl,*.h,*.cpp,*.py,*.java set autoindent
    au BufRead *.pl,*.h,*.cpp,*.py,*.java set cindent
    au BufRead *.pl,*.h,*.cpp,*.py,*.java set expandtab
    au BufRead *.pl,*.h,*.cpp,*.py,*.java set shiftwidth=2
    au BufRead *.pl,*.h,*.cpp,*.py,*.java,*.sh,*.bashrc* set softtabstop=2
    au BufRead *.pl,*.h,*.cpp,*.py,*.java,*.sh,*.bashrc* set tabstop=2
    au BufEnter *.pl,*.h,*.cpp,*.py,*.java,*.sh,*.bashrc* set tabstop=2
    au BufEnter *.pl,*.h,*.cpp,*.py,*.java,*.sh,*.bashrc* set softtabstop=2
    au BufEnter *.pl,*.h,*.cpp,*.py,*.java set autoindent
    au BufEnter *.pl,*.h,*.cpp,*.py,*.java set cindent
    au BufEnter *.pl,*.h,*.cpp,*.py,*.java set expandtab
    au BufEnter *.pl,*.h,*.cpp,*.py,*.java set shiftwidth=2

  augroup END
endif

"Jump to last known position in a file just after opening it,
" if the '" mark is set:
"
:au BufReadPost * if line("'\"") > 1 && line("'\"") <=line("$") | exe "normal!g'\"" | endif


autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
