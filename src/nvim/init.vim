" NEO-VIM CONFIGURATION
" ===================== [ VIMPLUG PACKAGE LISTS] =========================="
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'terryma/vim-multiple-cursors'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'neomake/neomake'
Plug 'ludovicchabant/vim-gutentags'
Plug 'othree/yajs.vim'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'nathanaelkane/vim-indent-guides'
"-------------------- [AUTO COMPLETE PACKAGES] ---------------------------"
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' } "Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
"---------------------------- [ JSX ] ------------------------------------"
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"-------------------------------------------------------------------------"
call plug#end()
"========================================================================="


"=========================== [ AUTO COMPLETE ] ==========================="
let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" - persistent"]
command ACE silent! execute 'call deoplete#enable()'
command ACD silent! execute 'call deoplete#disable()'
"========================================================================="



"============================ [ CODE SNIPPET ] ==========================="
"Javascript
map <C-f>fn ifunction(){}<ESC> F)
map <C-f>ff i() => {}<ESC> F)
map <C-f>cc iconsole.log(``)<ESC> F`
"========================================================================="



" ======================= [ VIM CONFIGURATION ] =========================="
" PRIMAL
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
set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
"========================================================================="
" TERMINAL NEW MAP FOR NEOVIM
tnoremap <Esc> <C-\><C-n>:q!<CR>
"========================================================================="
" CREATE SESSION STATE
command SessionSaveState silent! execute 'mksession! session.vim'
command SSS silent! execute 'mksession! session.vim'
"========================================================================="
" WINDOW SPILT SIZE
map <C-w>= :vertical res +50<CR>
map <C-w>- :vertical res -50<CR>
"========================================================================="
" SILENT KEYS
set visualbell
set noerrorbells
"========================================================================="
" FILE ENCODE
set encoding=utf-8
set fileencoding=utf-8
"========================================================================="
" REMOVE SREACH HIGHLIGHT
noremap <SPACE> :nohlsearch<CR>
"========================================================================="
" CLEAR ALL BUFFER
command BuffClear silent! execute '%bd|e#|bd#'
command BC silent! execute '%bd|e#|bd#'
"========================================================================="
" TAB BAR
" TAB BAR COLOR
:hi TabLineSel ctermfg=White
" TAB CLOSE
cmap tcs tabclose
" TAB SWITCH
map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
"========================================================================="
" TAB SPACE
" SPACE SIZE
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces

" MARKING TAB SPACE
" [1] Manual Marking
" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4
" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4
" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4
" [2] Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
"========================================================================="
" OPEN TERMINAL
" map <C-j> :term<CR>
"========================================================================="
" MAP LEADER KEY
let mapleader='\'
set timeout timeoutlen=1500
"========================================================================="
" DISABLE ARROW CURSOR
inoremap  <Up> <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up> <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
"========================================================================="

" ===================== [ PLUGIN CONFIGURATION ] ========================="
" [1] NERD TREE
map <C-n> :NERDTreeToggle<CR>
" open NERDTree automatically when vim starts up
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open a NERDTree automatically when vim starts up if no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
"========================================================================="
" [2] MULTIPLE CURSORS
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_quit_key='<Esc>'
"========================================================================="
" [3] AIRLINE
" [3.1] Bubbble Gum
"let g:airline_theme='simple'
"let g:airline_theme='bubblegum'
"let g:airline#extensions#tabline#enabled = 1
" [3.2] One
let g:airline_theme='one'
"========================================================================="
" [4] NERD TREE GIT
let g:NERDTreeShowIgnoredStatus = 1
"========================================================================="
" [6] COLOR SCHEME
" [6.1] One Dark
" colorscheme onedark
" [6.2] Jelly Beans
" colorscheme jellybeans
" [6.3] Vim One
colorscheme one
set background=dark
"========================================================================="
" [7] NERD COMMENTER
let g:NERDSpaceDelims = 1
"========================================================================="
" [8] NEOMAKE config eslint
let g:neomake_javascript_enabled_makers = ['eslint']
"========================================================================="
" [9]
let g:jsx_ext_required = 1
"========================================================================="

