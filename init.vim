" ===
" === System Set
" ===
set splitbelow
set nohlsearch
set hlsearch
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
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'frazrepo/vim-rainbow'
Plug 'kshenoy/vim-signature'
Plug 'ferranpm/vim-autopairs'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'flazz/vim-colorschemes'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'rakr/vim-one'
Plug 'vimwiki/vimwiki'
Plug 'theniceboy/eleline.vim'
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
noremap tx :r !figlet
noremap tt :NERDTreeToggle<Cr>
" ===
" === Source Section
" ===
source ~/.config/nvim/CocConfig.vim
source ~/.config/nvim/md-snippets.vim
source ~/.config/nvim/plugged/vim-colorschemes/colors/molokai.vim
source ~/.config/nvim/_machine_specific.vim

" ===
" === Snippets
" ===
let g:UltiSnipsExpandTrigger="<tab>" 
let g:UltiSnipsJumpForwardTrigger="<c-j>" 
let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
" ===
" === Vimwiki
" ===
let g:vimwiki_list = [{'path': '~/.vimwiki/','syntax': 'markdown', 'ext': '.md'}]
" ===
" === vim-rainbow
" ===
au FileType c,cpp,objc,objcpp,py,sh,fish,md,json,ts,js,html call rainbow#load()
" ===
" === indentLine
" ===
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

noremap r :call CompileRunText()<Cr>
func! CompileRunText()
	exec "w"
	if &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunction
