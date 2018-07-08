" --- [ VIM PLUG ] ---
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'posva/vim-vue'
call plug#end()

" --- [ VIM PRIMAL CONFIG] ---
set hidden
set nobackup
set nowritebackup
set noswapfile
set hlsearch
set ruler
set number
set cursorline
set backspace=indent,eol,start
set shell=/bin/zsh
set splitbelow
syntax enable
" SILENT KEYS
set visualbell
set noerrorbells
" FILE ENCODE
set encoding=utf-8
set fileencoding=utf-8
" REMOVE SREACH HIGHLIGHT
noremap <SPACE> :nohlsearch<CR>
" CLEAR ALL BUFFER
command BuffClear silent! execute '%bd|e#|bd#'
command BC silent! execute '%bd|e#|bd#'
" TAB BAR COLOR
:hi TabLineSel ctermfg=White
" TAB CLOSE
cmap tcs tabclose
" TAB SWITCH
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
" OPEN TERMINAL
map <C-j> :term<CR>
" TAB SPACE SIZE
"set autoindent
set shiftwidth=4
set textwidth=120
set expandtab
set tabstop=4
set softtabstop=4
" TAB MARKING
" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4
" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4
" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4
" MAP LEADER KEY
let mapleader='\'
set timeout timeoutlen=1500

" DISABLE ARROW CURSOR
inoremap  <Up> <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up> <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" --- [ VIM PLUGIN CONFIG ] ---
" [1] NERD TREE
map <C-n> :NERDTreeToggle<CR>
" open NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open a NERDTree automatically when vim starts up if no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" nerdtree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" [2] MULTIPLE CURSORS
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'
" [3] AIRLINE
"let g:airline_theme='simple'
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
" [4] NERD TREE GIT
let g:NERDTreeShowIgnoredStatus = 1
" [5] MOLOKAI
"colorscheme molokai
" [6] ONEDARK
colorscheme onedark
" [7] NERD COMMENTER
let g:NERDSpaceDelims = 1
" Uncomments the selected line
"<leader>cu |NERDComUncommentLine|
" Comment out the current line
"<leader>cc |NERDComComment|
" Comment nesting
"<leader>cn |NERDComNestedComment|
" Comments out the selected lines
"<leader>cs |NERDComSexyComment|
