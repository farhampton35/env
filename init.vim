"" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

""" 配置tab键
set tabstop=4        "number of visual spaces per TAB
set softtabstop=4    "number of spaces in TAB when editing
set expandtab        "TABS are spaces
set shiftwidth=4     "使用每层缩进的空格数

set nocompatible              " be iMproved, required
filetype off                  " required

"""UI设置
set laststatus=2     "Always show status line
set wildmenu         "visual autocomplete for command menu
set lazyredraw       "redraw only whn we need to
"set showmatch        "highlight macthing [{()}]
set ruler
filetype indent on   "load filetype-specific indent file.

"""快捷键
let mapleader=" "
nnoremap q :q<CR>
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
nnoremap <Leader>t :NERDTree<CR>
nnoremap <Leader>m :TagbarToggle<CR>
nnoremap <Leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
set pastetoggle=<F12>

""" 安装并配置Bundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'neomake/neomake'
Plugin 'majutsushi/tagbar'
Plugin 'ap/vim-css-color'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'sheerun/vim-polyglot'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'axiaoxin/vim-json-line-format'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:syntastic_go_checkers = ['golint', 'errcheck']
let g:vim_json_syntax_conceal = 0
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

""" 配置插件 neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 1
let g:neomake_sh_shfmt_maker = {'exe': 'shfmt', 'args': ['-w', '-i', '4', '-s']}
let g:neomake_sh_enabled_makers=['shfmt', 'sh']
let g:neomake_go_enabled_makers = [ ]
augroup neomake_hooks
  au!
  autocmd User NeomakeJobFinished :checktime
augroup END

nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

""" 设置颜色
syntax on
colorscheme onedark
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

""" Common programming settings
set colorcolumn=100
highlight ColorColumn ctermbg=4
set autoread
