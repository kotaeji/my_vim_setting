" Modeline and Notes
"   This is my personal .vimrc, I don't recommend you copy it, just
"   use the "   pieces you want(and understand!).  When you copy a
"   .vimrc in its entirety, weird and unexpected things can happen.
"
"   If you find an obvious mistake hit me up at:
"   http://robertmelton.com (many forms of communication)


" Startup
    let s:running_windows = has("win16") || has("win32") || has("win64")
    let s:colorful_term = (&term =~ "xterm") || (&term =~ "screen")
    let g:erlangHighlightBif = 1
    let g:erlangHighLightOperators = 1

" Basics
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set background=dark" we plan to use a dark background
    set fenc=utf-8 " UTF-8
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor between joined lines
    "             |||||||+-- When a new match is created (showmatch) pause for .5
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
    "             |||+-- Searching continues at the end of the match at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    let g:skip_loading_mswin=1 " Just in case :)

" Newish
    set history=9999 " big old history
    set timeoutlen=300 " super low delay (works for me)
    set formatoptions+=n " Recognize numbered lists
    set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
    set viminfo+=! " Store upper-case registers in viminfo
    set nomore " Short nomore
" General
    filetype plugin indent on " load filetype plugins/indent settings
    "set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set clipboard+=unnamed " share windows clipboard
    if s:running_windows
        set backupdir=~/vimfiles/backup " where to put backup files
        set directory=~/vimfiles/temp " directory to place swap files in
    else
        set backupdir=~/.vim/backup " where to put backup files
        set directory=~/.vim/temp " directory to place swap files in
    endif
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    set iskeyword+=_,$,@,%,# " none of these are word dividers
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png " ignore these list file extensions
    set wildmode=list:longest " turn on wild mode huge list
    let html_number_lines = 0
    let html_use_css = 0
    let use_xhtml = 0
    let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'Bookmark':{}, 'Tag':{}, 'TaggedFile':{}}

" Vim UI
    set incsearch       " BUT do highlight as you type you search phrase
    set laststatus=2    " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows
    set list " we do what to show tabs, to ensure we get them out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing
    set matchtime=5 " how many tenths of a second to blink matching brackets for
    " set nohlsearch " do not highlight searched for phrases
    set hlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    "set statusline=%F%m%r%h%w[%{CTagInStatusLine()}[%L][%{&ff}]%y[%p%%][%04l,%04v]
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer

" Text Formatting/Layout
    set completeopt=menuone " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with set list on

" Folding
    set foldenable " Turn on folding
    set foldmethod=manual " Fold on the indent (damn you python)
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    "set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
    "set foldtext='<<<.HERE_ARE_FOLDS.>>>.....' " Custom fold text function (cleaner than default)
    set foldtext='>>' " Custom fold text function (cleaner than default)

" Plugin Settings
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars inside strings
    let tlist_aspjscript_settings = 'asp;f:function;c:class'
    let tlist_aspvbs_settings = 'asp;f:function;s:sub'
    let tlist_php_settings = 'php;c:class;d:constant;f:function'
    let tlist_vb_settings = 'asp;f:function;c:class'
    let NERDTreeIgnore = ['\.beam', '\.pyc', 'ebin']
    let NERDChristmasTree = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 0

" Mappings
    " hit f11 to paste
    set pastetoggle=<f11>
    " space / shift-space scroll in normal mode
    noremap <S-space> <C-b>
    noremap <space> <C-f>
    " fuzzymaps
    nmap <leader>f :FufFileWithCurrentBufferDir<CR>
    nmap <leader>ff :FufFile<CR>
    nmap <leader>b :FufBuffer<CR>
    nmap <leader>t :FufBufferTag<CR>
    nmap <leader>tt :FufBufferTagAll<CR>
    nmap <tab> :FufBufferTag<CR>
    " make arrow keys useful
    map <left> <ESC>:NERDTree<RETURN>
    map <right> <ESC>:TagbarToggle<RETURN>
    map <up> <ESC>:bp<RETURN>
    map <down> <ESC>:bn<RETURN>

" Autocommands
    " ruby standard 2 spaces, always
    au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
    au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " Override types
    au BufNewFile,BufRead *.ahk set filetype=ahk
    au BufNewFile,BufRead *.ps1 set filetype=ps1
    au BufNewFile,BufRead *.md set filetype=markdown
    au BufNewFile,BufRead *.dtl set filetype=htmldjango
    " Rainbow Parens
    "au VimEnter * RainbowParenthesesToggle
    "au Syntax * RainbowParenthesesLoadRound
    "au Syntax * RainbowParenthesesLoadSquare
    "au Syntax * RainbowParenthesesLoadBraces
    " Remember everything (position, folds, etc)
    "au BufWinLeave * mkview
    "au BufWinEnter * silent loadview

" GUI Settings
if has("gui_running")
    " Basics
    colorscheme molokai
    set guifont=Consolas:h10 " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +-- use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
    map <F8> <ESC>:set guifont=Consolas:h8<CR>
    map <F9> <ESC>:set guifont=Consolas:h10<CR>
    map <F10> <ESC>:set guifont=Consolas:h12<CR>
    map <F11> <ESC>:set guifont=Consolas:h16<CR>
    map <F12> <ESC>:set guifont=Consolas:h20<CR>
endif

" Term Settings
if s:colorful_term
    "256 color --
    let &t_Co=256
"    colorscheme molokai
    " restore screen after quitting
    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
endif

" Odds n Ends
set ttymouse=xterm2 " makes it work in everything

" cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim-----------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:-
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:-
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...-
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out . -C
    " else add the database pointed to by environment variable-
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose--


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.--
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>------
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>------
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>------
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>------
    " nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>------
    nmap <C-\>f :cs find f-
    nmap gf :cs find f-
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>------


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>------

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>-----
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>-----
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>-----
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>-----
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>-----
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>-----
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>---
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>-----


    " Hitting CTRL-space *twice* before the search type does a vertical-
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>---
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>-
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    set notimeout-
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout-
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

set autochdir

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    " call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    call vundle#begin('~/.vim/bundle')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    "Plugin 'Toggle-Window-Size'
    "
    Plugin 'taglist.vim'
    Plugin 'The-NERD-tree'

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    Plugin 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'
    " Git plugin not hosted on GitHub
    Plugin 'git://git.wincent.com/command-t.git'
    " git repos on your local machine (i.e. when working on your own plugin)
    "Plugin 'file:///home/gmarik/path/to/plugin'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Avoid a name conflict with L9
    " Plugin 'user/L9', {'name': 'newL9'}

    Plugin 'Tab-Name'
    Plugin 'justincampbell/vim-eighties'
    " Plugin 'Toggle-Window-Size'
    Plugin 'Window-Sizes'
    Plugin 'resizewin'
    Plugin 'Visual-Mark'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " To ignore plugin indent chAnges, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
    "

let g:eighties_enabled = 1
let g:eighties_minimum_width = 60
let g:eighties_extra_width = 0 " Increase this if you want some extra room-
let g:eighties_compute = 0 " Disable this if you just want the minimum + extra

let &winheight = &lines * 7 / 10
let &winwidth = &columns * 7 / 10

nmap <C-\>h :tabprevious<CR>
nmap <C-\>l :tabnext<CR>
nmap <C-l> :noh<CR>
noremap <F7> zh
noremap <F8> zl
"noremap <ESC>yj <C-e>
"noremap <ESC>k <C-y>

map <F9> <ESC>:TlistToggle<CR>
map <F10> <ESC>:TlistShowPrototype<CR>
map <F11> <ESC>:NERDTreeToggle<CR>
map <F12> <ESC>:NERDTree<CR>

"highlight Search guibg='DarkBlue' guifg='NONE'
highlight Search ctermbg=801818 ctermfg=white guibg=grey guifg=RoyalBlue3
highlight Visual ctermbg=8FFE9F ctermfg=white guibg=grey guifg=RoyalBlue3

nnoremap _ :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

set guioptions+=a
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
"vnoremap <silent> <F8> :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>
"vnoremap <silent> + :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hls<CR>
"
