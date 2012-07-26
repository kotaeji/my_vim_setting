set background=dark
set hlsearch
set ic
set smartcase
set incsearch
set nu
set tabstop=4
set ls=2
set expandtab

nnoremap <silent> <F8> :TlistOpen<CR>
nnoremap <silent> <F7> :TlistToggle<CR>
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map   <F5> :ls<CR>:e #

" Mapping cscope functions to keys
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Tips to save and restore sessions
nmap ms :mksession 
nmap rs :source 

nmap <C-_><C-_> :call SmartTag#SmartTag("goto")<CR>
nmap <C-_><C-W> :call SmartTag#SmartTag("split")<CR>
nmap <C-_><C-T> :call SmartTag#SmartTag("tab")<CR>
nmap <C-_><C-D> :call SmartTag#SmartTag("debug")<CR>


nmap <Home> :0 <CR>
nmap <End> :$ <CR>
nmap <F3> :Sexplore <CR>
nmap <F4> :Vexplore <CR>
nmap gf :cs find f 

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out $PWD -C
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB $PWD -C
    endif
    set csverb
endif

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <silent> _ :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" let mapleader = ","
runtime plugin/mark.vim

let g:netrw_altv = 1

" set tagfunc=SmartTag#SmartTagFunc
