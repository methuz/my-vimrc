syntax enable

let mapleader=","

colorscheme what
hi Search ctermfg=black ctermbg=white

if &diff
    colorscheme hybrid
endif

set ruler

set incsearch
set ignorecase
set hlsearch

set expandtab

set tabstop=2
set shiftwidth=2

set wrap

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kana/vim-arpeggio'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'scrooloose/nerdtree.git'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'moll/vim-node'
Plugin 'scrooloose/syntastic'
Plugin 'millermedeiros/vim-esformatter'

"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
map <c-f> :Esformatter<cr>
map <C-e> :NERDTreeToggle<CR>

function! SetupChord()
  Arpeggio inoremap jk <ESC>
  Arpeggio xnoremap jk <ESC>
  Arpeggio nnoremap jk :noh<CR><CR>
  Arpeggio nnoremap er oif(err){callback(null, err);return;}<ESC>
  Arpeggio nnoremap ip ^iconsole.log("<ESC>A");<ESC>
  Arpeggio nnoremap io diWIconsole.log("<ESC>pA = ", JSON.stringify(<ESC>pa, null, 4));<ESC>
  Arpeggio nnoremap ir diWIconst <ESC>pA = require('<ESC>pA');<ESC>
  Arpeggio nnoremap pro oreturn new Promise(function(fulfill, reject) {<ESC>o<CR>})<ESC>k
  Arpeggio nnoremap ij ggVGJ:%s/\ //g<CR>
  Arpeggio nnoremap rt :!mocha <C-R>=expand("%:p")<cr><cr>
endfunction

autocmd VimEnter * call SetupChord()

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

set pastetoggle=<leader>p

vmap <Leader><Leader>h :<C-U>!hg blame -fnu <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

vnoremap // y/<C-R>"<CR>

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufWritePost * if &diff == 1 | diffupdate | endif
map <C-p> :set ft=javascript <CR>:set paste <CR>:set nonumber <CR>:r !pbpaste <CR><C-f>

set splitright

map <Leader> <Plug>(easymotion-prefix)

"NEW
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { "mode": "active" }
let g:syntastic_javascript_checkers = ['eslint']
map <C-l> :SyntasticReset<cr>
map <C-j> ggIa=<ESC><C-f>0dt{
map <leader>l :SyntasticToggleMode<cr>

"=====================================================

//autocmd BufWritePre *.js :Esformatter

"=================== shotcut ======================
vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>
