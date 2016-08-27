" Make Vim more useful
set nocompatible

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
silent execute '!find $HOME/.vim/tmp/ -not -name .gitignore -type f -delete'

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set pastetoggle=<F2>

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

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

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv
vnoremap > >gv

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
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

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

" Highlight current line
set cursorline

" Show “invisible” characters
set list "display spaces
set lcs=tab:▸\ ,trail:· ",eol:¬,nbsp:_ "everything else

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*~,*.pyc,.git\*,.hg\*,.svn\*,*/target/*     " Linux/MacOSX


" Better line-height
set linespace=2

" favorite fileformats
set fileformats=unix,dos,mac

" set default-encoding to utf-8
set encoding=utf-8

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe

" Setup Pathogen to manage your plugins
let g:pathogen_disabled = ["vim-autoclose", "vim-minibufexpl", "vim-bufferline", "ultisnips" ]
call pathogen#infect()

" Autopep8 default key F8
autocmd FileType python map <buffer> <F10> :call Autopep8()<CR>

" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers = []
let g:syntastic_python_flake8_args='--ignore=E501'

" Supertab completion options
let g:SuperTabDefaultCompletionType = "context"

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

""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
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

" Code folding in JS
au FileType javascript call JavaScriptFold()

" Code folding coffee script
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable shiftwidth=2 expandtab

" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Add the proper PEP8 indentation
au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" Add js / html / css indentation
au BufNewFile,BufRead *.js setlocal tabstop=4 softtabstop=4 shiftwidth=4 foldlevel=99 expandtab fileformat=unix
au BufNewFile,BufRead *.css,*.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yaml,*.yml,*.json setlocal expandtab ts=2 sw=2 ai

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" remap snipmate trigger. <tab> is used by YCM
imap <C-\> <esc>a<Plug>snipMateNextOrTrigger
smap <C-\> <Plug>snipMateNextOrTrigger
