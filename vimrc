" VIM Configuration File
" Description: created for C/C++ development, but is useful for other things as well
" Author: Bhaskar Tallamraju
"

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

" 1. Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" 2. Install ctags
" 3. Download and Install std C++ tags from here https://www.vim.org/scripts/script.php?script_id=2358 
set nocp
filetype plugin on
" This offers intelligent C++ completion when typing ‘.’ ‘->’ or <C-o>
" Load standard tag files
set tags=~/.vim/tags
set tags+=~/.vim/tags/cpp

" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="Joe Smith  <JoeSmith@test.com>"

" Enhanced keyboard mappings
" took this from Gerhard Gappmeier's vimrc
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F7> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment with <F6>
map <F6> :Dox<CR>
" build using makeprg with <F5>
map <F5> :make<CR>
" build using makeprg with <S-F7>
map <S-F10> :make clean all<CR>
" goto definition with F12
map <F11> <C-]>
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

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
