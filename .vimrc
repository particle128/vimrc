if has("gui_running")
    colorscheme desert
else
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS> 
endif

" let backspace can delete anything
set backspace=indent,eol,start

" folding
" zo: fold open, zc: fold close, za: fold toggle, zf: fold, zd: delete fold
set fdm=marker

" highlight of popup menu
hi Pmenu     ctermfg=lightgrey ctermbg=darkred     guifg=grey60   guibg=darkred 
hi PmenuSel  ctermfg=white     ctermbg=darkgrey  guifg=white    guibg=grey40

" search without escaping characters
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch

" for diff
nnoremap <F7> [c
nnoremap <F8> ]c

" for move between vertical split
nnoremap H <C-W>h
nnoremap L <C-W>l
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k

" for jump to previous/next buffer
nnoremap ˙ :bp<CR>
nnoremap ¬ :bn<CR>

" for jump to previous/next quickfix window 
nnoremap ˚ :cp<CR>
nnoremap ∆ :cn<CR>

" for vimgrep the word under cursor
nnoremap <A-S> :vim <C-R><C-W>

" hightlight of the search part
hi Search term=bold cterm=bold ctermfg=3 ctermbg=9
hi MatchParen term=reverse ctermbg=1 guibg=DarkRed

" Encoding Setting. termencoding = encoding = utf-8, fileencoding = one of {ucs-bom,utf-8,cp936,big5,latin1}
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,latin1

nnoremap <F9> <Esc>:!ctags -R --fields=+lS *<CR>
set tags=tags;/

set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set expandtab
filetype indent on
set smartindent

" set cursorline
set ignorecase
set smartcase

nmap <C-B> :bnext<CR>
nmap <C-S-B> :bprevious<CR>

autocmd FileType python set expandtab

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Go the first line of the current function ... [[ ]] ][ []
nmap [[ ?{<CR>w99[{
nmap ][ /}<CR>b99]}
nmap ]] j0[[%/{<CR>
nmap [] k$][%?}<CR>

syntax on
" set ruler
set hlsearch
set wildignorecase
set autochdir
set nu
set nobackup
set noswapfile


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'mattn/emmet-vim'
Plugin 'a.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugin nerdtree
nnoremap <C-N> :NERDTree<CR>

" Plugin ctrlp
let g:ctrlp_root_markers = ['dirs']
" use Ctrl+U to clear typo in ctrlp command line. Since Backspace doesn't work in windows console.

" Plugin airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Plugin ycm
let mapleader = ";"
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>jt :YcmCompleter GetType<CR>
nnoremap <leader>jT :YcmCompleter GetTypeImprecise<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>
let g:ycm_global_ycm_extra_conf = '~/_ycm_extra_conf.py' 
let g:ycm_confirm_extra_conf = 0  " do not prompt to use a certain ycm_extra_conf file
" let g:ycm_show_diagnostics_ui = 1
" let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0 " no highlight for error info


"Plugin vim-go
let g:go_fmt_command = "goimports"
let g:go_version_warning = 0
inoremap <C-O> <C-X><C-O>
