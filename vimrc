" set up vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" BundleInstall to install the plugin
Plugin 'gmarik/Vundle.vim' " For easily installing VIM Plugin
Plugin 'tpope/vim-fugitive' " git plugin
Plugin 'gregsexton/gitv' " git plugin for review commit
Plugin 'bling/vim-airline' " beautify VIM
Plugin 'skammer/vim-css-color' " css color
Plugin 'kien/ctrlp.vim' " fuzzy search for moving to other files
Plugin 'terryma/vim-multiple-cursors' " multiple selection
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim' " easy comment
Plugin 'mileszs/ack.vim' " quick seach pattern and select
Plugin 'scrooloose/nerdtree' " tree that can select
Plugin 'majutsushi/tagbar' "  browse the tags of the current file (Ex: functions, variables)
Plugin 'vim-syntastic/syntastic' " code checking
Plugin 'tpope/vim-obsession' " keep the current state of Vim
Plugin 'pangloss/vim-javascript' " javascript plugin
Plugin 'mxw/vim-jsx' " javascript plugin
Plugin 'Valloric/YouCompleteMe' "autocomplete for C, C++, etc
Plugin 'rdnetto/YCM-Generator' " YCM generator for YouCompleteMe
Plugin 'fcamel/gj' " CLI and Vim plugin to search codes instantly
Plugin 'rhysd/vim-clang-format'   " clang-format for setting coding style
Plugin 'MattesGroeger/vim-bookmarks'   " bookmarks
Plugin 'editorconfig/editorconfig-vim' " editor config


" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'ervandew/supertab'
" Plugin 'Raimondi/delimitMate'  "  automatic closing of quotes, parenthesis, brackets, etc.
" Plugin 'garbas/vim-snipmate' " snippet
" Plugin 'MarcWeber/vim-addon-mw-utils' " vim-snipmate use
" Plugin 'tomtom/tlib_vim' " vim-snipmate use

call vundle#end()

" ================= remember position of cursor ===============================
if filereadable($VIMRUNTIME . "/vimrc_example.vim")
	so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
	so $VIMRUNTIME/macros/matchit.vim
endif

" ================= Encodings =================================================
set encoding=utf-8
set fileencoding=utf-8          " big5/utf8/taiwan(before 6.0)
set termencoding=utf-8		" utf8/big5
"let $LANG="zh_TW.UTF-8"	" locales => zh_TW.UTF-8
if ($LANG == "zh_TW.big5")
	set fileencoding=big5
	set termencoding=big5
elseif ($LANG == "zh_TW.utf-8")
	set fileencoding=utf8
	set termencoding=utf8
endif
set fileencodings=utf-8,big5,gb2312
" more options {{{
" charset detect list. ucs-bom must be earlier than ucs*.
" e.g. big5,ucs-bom,utf-8,gb2312,korea,sjis,gb18030,latin1
" e.g. latin,big5,ucs-bom,utf-8,sjis,big5
" e.g. ucs-bom,utf-8,sjis,big5,latin1
" set fileencodings=gb2312,big5,utf-8
" }}}

" ================= syntax on =================================================
syntax on			" syntax on/off/enable

" ================= Vim Settings (:set show current settings) =================
set wildmenu
set backupdir=~/.tmp		" op=,.,/var/tmp/vi.recover,/tmp " bdir: backup directory
set directory=~/.tmp		" op=,.,/var/tmp/vi.recover,/tmp " dir to save swp files
set undodir=~/.tmp
set backup			" backup: keep a backup file
set ruler			" show the cursor position all the time
set cursorline
set showmode			" show mode. show filename size when open file
set bs=2			" allow backspacing over everything in insert mode
set ai				" autoindent: always set autoindenting on
set showmatch			" Show matching parenthese.
"set nohls			" nohlsearch: no hight light search. 'set hls!' to switch
set incsearch			" move to target when search
set wrapscan			" return to top of file when search hit buttom
set fileformat=unix		" fileformat: EOL(end of line: unix=\n dos=\r\n) format when write
set fileformats=unix		" fileformats: input file format is unix file
set viminfo='20,\"50		" read/write a .viminfo file,
                                " don't store less than 50 lines of registers 20 commands
set showcmd			" display incomplete commands
set laststatus=2		" Display a status-bar.
set mouse=n			" Use mouse function in normal mode
set ignorecase			" ignore case when search
set smartcase			" mactch icase only if all lowercase
"set listchars=tab:→⋅		" set listchars=tab:→⋅,eol:♮
"set listchars=tab:>.
set listchars=tab:\|\      " > is shown at the beginning, - throughout"
set modeline
set tabpagemax=200
set scrolloff=4
" more options {{{
set t_Co=256
" set compatible		" set to vi compatible, don't use vim extension functions. default: off
" set wb			" writebackup: back up after write
" set swapfile			" have swap space or total load into memory
" set autowrite			" auto write when update
" set confirm
" set textwidth=78		" insert EOL when char more than textwidth
" set wrapmargin=1		" the same as textwidth, but count from rigth
" set wrap 			" warp but not insert EOL
set nu			" number: show line number. 'set nu!' to switch
set list			" EOL=>$ TAB=>^T. 'set list!' to switch
" set cmdheight=2		" number of line of status bar
" set statusline=		" set format of status bar (:h stl)
" set cin			" cindent: indent when write c/cpp language
"set background=light		" dark/light, settings on /usr/share/vim/vim63/syntax/synload.vim
" }}}
set ts=4 sw=4 sts=0 expandtab " set 4 space in defualt

" try
" 	colorscheme molokai
" catch
" endtry
set nowrap

autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype cpp setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype c setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype sh setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype groovy setlocal ts=4 sw=4 sts=0 expandtab

autocmd Filetype cpp ClangFormatAutoEnable

set hidden
nmap <leader>t :enew<cr>
nmap gt :bnext<CR>
nmap g<S-t> :bprevious<CR>
nmap gp :bprevious<CR>
nmap gd :bp <BAR> bd #<CR>
nmap gl :buffers<CR>:b<Space>

" sometimes need tab
nmap bt :tabnext<CR>
nmap b<S-t> :tabprevious<CR>
nmap bp :tabprevious<CR>
nmap bd :tabclose<CR>


" ================= Set path and tags =========================================
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" omnicomplete:
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|pclose|endif

filetype plugin on


" ================= Fold Settings (:h fold , :h fold-foldtext) ================
" set nofoldenable
set foldmethod=syntax
set foldlevel=2
" let g:sh_fold_enabled = 7
" let g:perl_fold = 1
" let perl_nofold_packages = 1
" let php_folding = 2
" let g:vimsyn_folding = 'afpPrtm'

" more options {{{
" set foldnestmax=1
" set foldcolumn=1
" set foldlevel=1
" fold by syntax:
" syn region myFold start="{" end="}" transparent fold
" syn sync fromstart<CR>
" set foldmethod=syntax<CR>
" set fdl=100<CR>
" }}}

" ================= KeyBoard Mappings (:h key-notation) =======================
map <space> /<C-R>=expand("<cword>")<CR><CR>
map <C-a> :Ack! <cword><CR>
if has("unix")
	let s:uname = system("uname -s")
	if s:uname == "Darwin\n"
		vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
		nmap <C-p> :call setreg("\"",system("pbpaste"))<CR>gp
	else
		vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>
		nmap <C-p> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>gp
	endif
endif

" === <F2>(i) insert something {{{
imap <F2>t <C-R>=strftime("%Y.%m.%d %H:%M")<CR>
imap <F2>d <C-R>=strftime("%Y-%m-%d")<CR><cr>==========<cr>
imap <F2>c <ESC>0y$$a = <C-R>=<C-R>0<CR>
imap <F2>l <C-R>='console.log("in:'.expand("%").':'.line(".").'");'<CR>
imap <F2>f <C-R>='fprintf(stderr, "[%s:%d %s] orz %s\n", __FILE__, __LINE__, __func__, "...");'<CR>
imap <F2>s <C-R>='syslog(LOG_ERR, "[%s:%d %s] orz %s", __FILE__, __LINE__, __func__, "...");'<CR>
imap <F2>e <C-R>='echo "in:'.expand("%").':'.line(".").'";'<CR>
imap <F2><F2> <ESC>:echo "insert code template - t:time, c:calculate, l:console.log, f:fprintf, s:syslog, e:echo"<CR>

" change split view size
nmap + <C-w>+
nmap - <C-w>-
nmap >  <C-w>>
nmap <  <C-w><
nmap <C-o> <C-w>o

" ================= Display Colors (:h hi, group-name cterm-colors) ====================================
hi Comment      ctermfg=26
hi Folded       ctermfg=DarkGray ctermbg=16
"hi Folded      ctermfg=DarkBlue ctermbg=16
hi FoldColumn       ctermbg=236

hi DiffAdd      ctermbg=Black
hi DiffDelete       ctermbg=16 ctermfg=DarkGray
hi DiffChange       term=reverse ctermbg=236
hi DiffText     ctermbg=DarkBlue
"hi DiffText        ctermbg=Blue ctermfg=White

hi NonText      ctermfg=DarkGray
hi SpecialKey   ctermfg=DarkGray ctermbg=none
hi Visual       ctermfg=Blue ctermbg=White

"set cursorline
" hi CursorLine     ctermbg=Black term=NONE cterm=NONE

hi ExtraWhitespace ctermbg=Black

hi Pmenu        cterm=none ctermfg=White ctermbg=236
hi PmenuSel     cterm=none ctermfg=236 ctermbg=36
hi PmenuSbar    cterm=none ctermfg=none ctermbg=Green
hi PmenuThumb   cterm=none ctermfg=36 ctermbg=36
hi Search       cterm=NONE ctermfg=125 ctermbg=yellow
hi LineNr                  ctermfg=241 ctermbg=none

hi Normal                              ctermbg=232
hi CursorLine   cterm=none             ctermbg=234
hi CursorLineNr cterm=none ctermfg=162
hi Visual                              ctermbg=237
hi VisualNOS                           ctermbg=240
hi Directory    cterm=bold ctermfg=154

hi ColorColumn                 ctermbg=236

match ExtraWhitespace /\s\+$/

if exists('+colorcolumn')
    "" in vim 7.3
    set colorcolumn=80
    " hi ColorColumn    ctermbg=Black
    "hi ColorColumn ctermfg=Red
else
"highlight OverLength   ctermbg=DarkGray guibg=#592929
"match OverLength /\%81v.\+/
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/


" vim:ft=vim:fdm=marker:foldcolumn=2
"

" close the preview
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" set up pymode argument
" ---python-mode
" let g:pymode_indent = 1
" let g:pymode_motion = 1
" let g:pymode_rope = 0
" let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pylint'] "au CompleteDone * pclose
" let g:pymode_options_max_line_length = 100
" let g:pymode_lint_cwindow = 0
" let g:pymode_rope = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_syntax_print_as_function = 1
" let g:pymode_indent = 0
" let g:pymode_python = 'python3'

" airline
let g:airline#extensions#tabline#enabled = 1

" easy-motion
let EasyMotion_leader_key=","

" set ctags
" set tags=/Users/Ping/workspace/samba-4.5.3/tags

" add cscope
nmap <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
hi SpellBad ctermbg=red
hi SpellCap ctermbg=red

let g:syntastic_c_compiler_options = "-Wall -Wextra -Wpedantic"
let g:syntastic_cpp_compiler_options = "-Wall -Wextra -Wpedantic"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_standard_generic = 1

let g:syntastic_python_checkers = ['flake8']

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['python', 'javascript'], 'passive_filetypes': [] }
nnoremap <F6> :SyntasticCheck<CR> :SyntasticToggleMode<CR>


" tagbar and nerdtree
nmap <C-l>	:TagbarToggle<CR>
nmap <C-k>	:NERDTreeToggle<CR>

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-y>'
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

let g:ycm_confirm_extra_conf=0

" vim-jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

if executable('ag')
        let g:ackprg = 'ag --vimgrep'
endif

" Gitv
set lazyredraw

" YCM
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=menu,menuone
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_cache_omnifunc = 0
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "sh":1,
            \ "zsh":1,
            \ "javascript":1,
            \ "python":1,
            \ }


" CLANG


" add ctags path
" add personal tags here
" set tags+=/source/tags/libabccdef

2match ErrorMsg /reviewed/
