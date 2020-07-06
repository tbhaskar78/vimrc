" VIM Configuration File
" Description: created for C/C++ development, but is useful for other things as well
" Author: Bhaskar Tallamraju
" Last updated: July 06 2020

" I like the desert theme the best
color desert
" turn syntax highlighting on
set t_Co=256
syntax on
" set the hightlight for search, with background black and red font
set hlsearch
hi Search ctermbg=black
hi Search ctermfg=Red

" Set no backup, avoids creating extra files by vim
set nobackup

"folding settings  
" zc folds at the current place
" zM folds everything
" zR unfolds everything
" za toggle folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=2         "this is just what i use

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible
"enable filetype
filetype plugin on
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is no longer the norm
set textwidth=120
" turn line numbers on
set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

"enable python syntax
let python_highlight_all = 1

" Auto complete using clang_complete
" 1. Install libclang-dev
" 2. Ensure python 2 support is enabled in vim (otherwise build vim with it)
" 3. Install clang_complete from here https://www.vim.org/scripts/script.php?script_id=3302 
" 4. Install libclang1 in ubuntu or libclang in other distro; ensure libclang.so is available
let g:clang_user_options="-std=c++0x"

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Smith  <John@test.com>"

" Enhanced keyboard mappings
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Build gcc, g++ or python code from here <Shift F8>
autocmd FileType c nnoremap <buffer> <S-F8> :update<bar>!gcc % && ./a.out<CR>
autocmd FileType cpp nnoremap <buffer> <S-F8> :update<bar>!g++ % && ./a.out<CR>
autocmd FileType python nnoremap <buffer> <S-F8> :update<bar>!sudo python3 %<CR>

" Auto build using make with <F5>
map <F5> :make<CR>
" Auto build using make with <S-F7>
map <S-F9> :make clean all<CR>
" recreate tags file with <F7>, needs ctags installed
map <F7> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment with <F6>
map <F6> :Dox<CR>
" goto definition with F12
map <S-F12> <C-]>

if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif
