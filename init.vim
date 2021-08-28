set nocompatible
set bg=dark

" set leader
let mapleader=","

" activates filetype detection
filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tomasr/molokai'
Plug 'puremourning/vimspector'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

call plug#end()

" NERDTree config
 map <F2> :NERDTreeToggle<CR>
 nn <silent><F3> :exec("NERDTree ".expand('%:h'))<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeHidden=0
let NERDTreeWinSize=32

"Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let NERDTreeAutoCenter=1
let NERDTreeWinSize=25

" ctrlp
noremap lf :CtrlP<CR>
noremap <space> :

" vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

let g:go_autodetect_gopath = 1

let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

" commond settings
set cursorline " highting the current line

" ignore these files when searching
set wildignore+=*/.git/*,
      \*/.hg/*,*/.svn/*,
      \*/cscope*,*/*.csv/,
      \*/*.log,*tags*,*/bin/*
set number
set numberwidth=4

" search enhancement
set incsearch
set hlsearch
set ignorecase

" delete mode
set backspace=2

" autoformat
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" tagbar
nmap <F5> :TagbarToggle<CR>

" coc-nvim
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" color theme
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" warning
let g:coc_disable_startup_warning = 1

let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
nmap <leader>vi <Plug>VimspectorBalloonEval
xmap <leader>vi <Plug>VimspectorBalloonEval

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go' ]

" coc config
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
