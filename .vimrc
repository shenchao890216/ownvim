" Configuration file for vim
set modelines=0		" CVE-2007-2438
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
" vundle设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 让vundle管理插件
Plugin 'VundleVim/Vundle.vim'
" 要安装的插件
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'ap/vim-css-color'
Plugin 'altercation/vim-colors-solarized'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
" 你所有的插件都要在下面执行前添加
call vundle#end()
filetype plugin indent on
" 设置行号
set number
" 突出显示当前行
set cursorline
" 开启语法高亮
syntax enable
syntax on
" 指定配色为256色
set t_Co=256
" 设置搜索时忽略大小
set ignorecase
" 设置在vim中可以使用鼠标
set mouse=a
" 设置不备份文件
set nobackup
set noswapfile
" 设置相对行号
set relativenumber
" 设置缩进
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" 设置空格代替tab
set expandtab
" 设置gui的字体
" set guifont=Literation_Mono_Powerline:h16
set guifont=Roboto_Mono_Light_for_Powerline:h15
" 设置配色
" set background=dark
colorscheme Tomorrow-Night
" colorscheme solarized
" 自动读取文件
set autoread
" 自动搜索第一处搜索
set incsearch
" 设置剪贴板
set clipboard=unnamed
" 设置快捷键前缀
let mapleader=";"
set modifiable
set fileformat=unix
set fileformats=unix,dos,mac
set fileencoding=utf-8
set matchpairs=(:),{:},[:],<:>

" 配置macvim
if has("gui_running")
	" 隐藏左侧滚动条
	set guioptions-=L
	" 隐藏右侧滚动条
	set guioptions-=r
endif

" 快速导航buffer
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>

" 设置nerdtree
map <F5> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowBookmarks=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 关闭时如果只有nerdtree，就关闭它
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <F6> <C-w>h
map <F7> <C-w>l
map <F8> <C-w>j
map <F9> <C-w>k

" 设置emmet
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" 设置ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
			\'dir': '\v[\/]\.(git|hg|svn)$',
			\'file': '\v\.(exe|so|dll|jpg|png|jpeg)$'
			\}
let g:ctrlp_map='<F4>'
let g:ctrlp_cmd='CtrlP'

" 设置vim-airline
set laststatus=2
let g:airline_theme="powerlineish"
" let g:airline_theme="luna"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"YCM
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

"Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"vim-javascript
let javascript_enable_domhtmlcss = 1

"vim-jsx
let g:jsx_ext_required = 0

"scss-syntax
autocmd FileType scss set iskeyword+=-
autocmd BufRead,BufNewFile *.scss set filetype=scss.css

" 设置ejs文件html高亮
au BufNewFile,BufRead *.ejs set filetype=html

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
