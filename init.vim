 "__  ____   __  _   ___     _____ __  __ ____   ____ 
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |    
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___ 
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
                                                     
" ===
" === System Set
" ===
set splitbelow
set nohlsearch
set scrolloff=5
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
Plug 'farmergreg/vim-lastplace'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
Plug 'mkitt/tabline.vim'
Plug 'easymotion/vim-easymotion'
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
call plug#end()

" ===
" === Map Section
" ===
noremap sk :set nosplitbelow<Cr>:split<Cr>
noremap sj :set splitbelow<Cr>:split<Cr>
noremap sh :set nosplitright<Cr>:vsplit<Cr>
noremap sl :set splitright<Cr>:vsplit<Cr>
noremap <leader>h :%TOhtml<Cr>
noremap <leader>n <Esc>/<++><Cr>:nohlsearch<Cr>vllllxa
noremap <leader>zv a<++><Space>
noremap <Up> :res +5<Cr>
noremap <Down> :res -5<Cr>
noremap <Left> :vertical resize-5<Cr>
noremap <Right> :vertical resize+5<Cr>
noremap nt :tabe<Cr>
noremap th :-tabnext<Cr>
noremap tl :+tabnext<Cr>
inoremap <A-l> <Esc>$a
inoremap <A-o> <Esc>o
noremap <A-l> <Esc>$a
noremap <A-o> <Esc>o
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap H 0
noremap J 5j
noremap K 5k
noremap L $
noremap R :source ~/.config/nvim/init.vim<Cr>
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
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue
let g:tablineclosebutton=1
" ===
" === easymotion
" ===
nmap ss <Plug>(easymotion-s2)
" ===
" === BookMark
" ===
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '⚑'
let g:bookmark_highlight_lines = 1
" ===
" === Airline
" ===
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
