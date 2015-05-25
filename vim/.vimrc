set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'davidhalter/jedi-vim'
Bundle 'junegunn/vim-easy-align'
Bundle 'vim-scripts/cscope.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'fatih/vim-go'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'esneider/YUNOcommit.vim'
Bundle 'zah/nimrod.vim.git'
"Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax enable
colorscheme molokai

"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

set nu
set ic
set foldmethod=syntax
set foldenable
set foldnestmax=10
set foldlevel=1

set background=dark
set smarttab
set autoindent
set copyindent
set shiftwidth=4
set expandtab
set smartcase
set incsearch
set hlsearch
set guioptions-=T
set guioptions-=m

set backupdir=~/.vim/backups
set directory=~/.vim/backups

set nobackup
set nowritebackup

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.pyc

let mapleader=","

nmap <leader>n :NERDTreeToggle <CR>
map <silent> <F1> :nohlsearch <CR>

" CtrlP options
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

set laststatus=2

" move like a human on wrapped lines
nnoremap j gj
nnoremap k gk

" save some keystrokes
nnoremap ; :

" quick navigation on split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vertical split of current file
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" forgot sudo? :w!!
cmap w!! w !sudo tee >/dev/null %

" Avoid the :ex pit
nnoremap Q <nop>

" Y U NO commit threshold
let g:YUNOcommit_after = 5

" Show trailing whitespaces and tabs

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" load closetag.vim on html,xml
autocmd Filetype html,xml,xsl source ~/.vim/plugin/closetag.vim
"
"
" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
    endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Handlebars as html
au BufNewFile,BufRead *.handlebars set filetype=html
