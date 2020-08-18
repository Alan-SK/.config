" ===
" === System Set
" ===
set number
set wrap
set relativenumber
set wildmenu
set hidden
set cursorline
syntax on
let mapleader = " "
set background=dark
let g:airline_theme='one'

" ===
" === Plug section
" ===
call plug#begin('~/.config/nvim/plugged')
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'flazz/vim-colorschemes'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'rakr/vim-one'
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
call plug#end()

" ===
" === Map Section
" ===
noremap H 0
noremap J 5j
noremap K 5k
noremap L $
noremap <leader>rc :e ~/.config/nvim/init.vim<Cr>
noremap S :w<Cr>
noremap Q :q<Cr>
noremap <C-l> :FloatermNew 
" ===
" === Source Section
" ===
source ~/.config/nvim/md-snippets.vim
source ~/.config/nvim/plugged/vim-colorschemes/colors/molokai.vim
source ~/.config/nvim/_machine_specific.vim

" ===
" === Snippets
" ===
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"

" ===
" === Vimwiki
" ===
let g:vimwiki_list = [{'path': '~/.vimwiki/','syntax': 'markdown', 'ext': '.md'}]
" ===

