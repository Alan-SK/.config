 "__  ____   __  _   ___     _____ __  __ ____   ____ 
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |    
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___ 
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
                                                     
" ===
" === System Set
" ===
set showcmd
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
set hlsearch
" ===
" === Plug section
" ===
call plug#begin('~/.config/nvim/plugged')
" 美化
Plug 'vim-airline/vim-airline' " airline(状态栏)
Plug 'vim-airline/vim-airline-themes' " airline主题
Plug 'rakr/vim-one' "主题
Plug 'dracula/vim' " airline主题
Plug 'liuchengxu/space-vim-theme' " 一款全局主题
Plug 'theniceboy/vim-deus' " 主题:deus
Plug 'mkitt/tabline.vim' " 状态栏(不会用啊啊啊)
Plug 'flazz/vim-colorschemes' " vim主题包
" MarkDown
Plug 'suan/vim-instant-markdown',{'for': 'markdown'} "MarkDown预览
Plug 'dhruvasagar/vim-table-mode' " MarkDown表格工具
" 工具
Plug 'MattesGroeger/vim-bookmarks' " 书签
Plug 'airblade/vim-gitgutter' " git状态查询
Plug 'voldikss/vim-floaterm' " 浮动终端
Plug 'preservim/nerdcommenter' " 注释工具
Plug 'easymotion/vim-easymotion' " 简单的移动
Plug 'preservim/nerdtree' " 文件树
Plug 'farmergreg/vim-lastplace' " 回到上次预览的位置
" 代码预览
Plug 'lfv89/vim-interestingwords' " 代码颜色高亮(<leader>k)
Plug 'frazrepo/vim-rainbow' " 彩色括号(写json就看出来了)
Plug 'itchyny/vim-cursorword' " 单词下划线
Plug 'Yggdroot/indentLine' " 缩进提示
" 代码补全
Plug 'kshenoy/vim-signature' " 忘了
Plug 'ferranpm/vim-autopairs' " 自动括号补全
Plug 'honza/vim-snippets' " 代码块大全
Plug 'SirVer/ultisnips' " 代码块主程序
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc代码补全
" 文件寻找
Plug 'junegunn/fzf' " 模糊文件查找
" 笔记
Plug 'vimwiki/vimwiki' " 使用<leader>ww
call plug#end()

" ===
" === Map部分
" ===
noremap <leader><leader> <Esc>:nohlsearch<Cr>
noremap <leader>r <Esc>:term ranger<Cr>
noremap <leader>R <Esc>:set splitbelow<Cr>:sp<Cr>:term ranger<Cr>
noremap ; :
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
" === Source部分
" ===
source ~/.config/nvim/CocConfig.vim
source ~/.config/nvim/md-snippets.vim
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
" ===
" === 代码编译器
" ===
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
	elseif &filetype == 'markdown'
		:InstantMarkdownPreview<Cr>

	endif
endfunction
" ===
" === Tabline
" ===
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
" ===
" === InstantMarkdownPreview
" ===
let g:instant_markdown_browser = "firefox --new-window"
let g:instant_markdown_port = 8888
" ===
" === 全局美化
" ===
set termguicolors
hi NonText ctermfg=gray guifg=grey10
source ~/.config/nvim/plugged/vim-deus/colors/deus.vim
let g:airline_theme='dracula'
