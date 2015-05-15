" Make Vim more useful
set nocompatible

" Enhance command-line completion
" set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Add the g flag to search/replace by default
set gdefault

" For regular expressions turn magic on
set magic

" disable spelling
set nospell

" Centralize backups, swapfiles and undo history
" backups:
set backup
set backupdir=~/.vim/tmp
" swaps:
set directory=~/.vim/tmp
set writebackup
" undo:
set undofile
set undodir=~/.vim/tmp
set undolevels=1000
set undoreload=10000
" auto cleanup on startup:
silent execute '!rm ~/.vim/tmp/* &> /dev/null'

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set pastetoggle=<F2>
set clipboard=unnamed

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Format the status line
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Mouse and backspace
" set mouse=a  " on OSX press ALT and click
" set bs=2     " make backspace behave like normal again

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
" vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on

" Showing line numbers and length
" set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

highlight OverLength ctermbg=0 ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
highlight ColorColumn ctermbg=0
set colorcolumn=80

" Set Gutter colors
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
set ignorecase
" When searching try to be smart about cases if the search contains upper case
set smartcase

" Always show the status line
set laststatus=2

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile

" Highlight current line
set cursorline

" Show “invisible” characters
set list "display spaces
set lcs=tab:▸\ ,trail:· ",eol:¬,nbsp:_ "everything else

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.pyc,.git\*,.hg\*,.svn\*,*/target/*     " Linux/MacOSX

" Height of the command bar
" set cmdheight=2

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" Better line-height
set linespace=2

" cursor-blinking off
set guicursor=a:blinkon0

" favorite fileformats
set fileformats=unix,dos,mac

" set default-encoding to utf-8
set encoding=utf-8

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
let g:pathogen_disabled = ["vim-autoclose", "vim-minibufexpl", "vim-bufferline"]
call pathogen#infect()

" Execute flake8 every save of a python  file / default key F7
" autocmd BufWritePost *.py call Flake8()

" Autopep8 default key F8
autocmd FileType python map <buffer> <F10> :call Autopep8()<CR>

" Statusbar tricks
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

" Supertab completion options
" au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Let pydoc open in new window / <leader>pw
" let g:pydoc_open_cmd = 'tabnew'

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
        return "\<C-N>"
        elseif a:action == 'k'
        return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Now we just enable the menu and pydoc preview to get the most useful
set completeopt=menuone,longest,preview

" gundo
nnoremap <F5> :GundoToggle<CR>

" ctrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>b :CtrlPBuffer<CR>

" Nerdtree options
" Open automaticaly if no file is especified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <leader><F3> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" Close vim if the only vwindow open is Nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Jedi Vim
" pip install jedi or git submodule update --init inside the submodule
" directory
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "2"
let g:jedi#popup_select_first = 0

let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions['python'] = 'jedi#completions'
let g:jedi#popup_on_dot = 0

" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ %{fugitive\#statusline()}


""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""
" let g:airline_enable_branch     = 1
" let g:airline_enable_syntastic  = 1
"

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" omnicompletion : words
" inoremap <leader>, <C-x><C-o>
" omnicompletion : filenames
" inoremap <leader>: <C-x><C-f>
" omnicompletion : lines
" inoremap <leader>= <C-x><C-l>

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_cursor_hold_i = 1

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Insert single char
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  set ttymouse=xterm2
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" reload vimrc
noremap <silent> <leader>r :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Toggle git gutter
nnoremap <leader>g :GitGutterToggle<CR>

" Strip whitespace
nnoremap <leader><space> :StripWhitespace<CR>

" Tagbar toggle
nmap <F7> :TagbarToggle<CR>

" TList toggle
map <F12> :TlistToggle<CR>

" Toggle Maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" XML formatter
function! DoFormatXML() range
    " Save the file type
    let l:origft = &ft

    " Clean the file type
    set ft=

    " Add fake initial tag (so we can process multiple top-level elements)
    exe ":let l:beforeFirstLine=" . a:firstline . "-1"
    if l:beforeFirstLine < 0
        let l:beforeFirstLine=0
    endif
    exe a:lastline . "put ='</PrettyXML>'"
    exe l:beforeFirstLine . "put ='<PrettyXML>'"
    exe ":let l:newLastLine=" . a:lastline . "+2"
    if l:newLastLine > line('$')
        let l:newLastLine=line('$')
    endif

    " Remove XML header
    exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

    " Recalculate last line of the edited code
    let l:newLastLine=search('</PrettyXML>')

    " Execute external formatter
    exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

    " Recalculate first and last lines of the edited code
    let l:newFirstLine=search('<PrettyXML>')
    let l:newLastLine=search('</PrettyXML>')
    
    " Get inner range
    let l:innerFirstLine=l:newFirstLine+1
    let l:innerLastLine=l:newLastLine-1

    " Remove extra unnecessary indentation
    exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

    " Remove fake tag
    exe l:newLastLine . "d"
    exe l:newFirstLine . "d"

    " Put the cursor at the first line of the edited code
    exe ":" . l:newFirstLine

    " Restore the file type
    exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>
