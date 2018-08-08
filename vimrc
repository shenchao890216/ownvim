" Configuration file for vim
set modelines=0   " CVE-2007-2438
set nocompatible  " Use Vim defaults instead of 100% vi compatibility

" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'yggdroot/indentline'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'raimondi/delimitmate'
Plugin 'elzr/vim-json'
Plugin 't9md/vim-choosewin'
Plugin 'chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dracula/vim'
Plugin 'posva/vim-vue'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'w0rp/ale'
" Plugin 'wakatime/vim-wakatime'
call vundle#end()
filetype plugin indent on

" set termguicolors
" 设置快捷键前缀
let mapleader="\<Space>"
" 设置行号.
set number
set relativenumber
" 开启语法高亮.
syntax enable
syntax on
" 设置不备份文件.
set nobackup
set backupcopy=yes
set noswapfile
" 设置缩进.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
" molokai设置.
" let g:molokai_original = 1
" jlet g:rehash256 = 1
" 设置配色256.
set t_Co=256
" 设置配色.
" colorscheme molokai
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None
if !has("gui_running")
  highlight LineNr ctermfg=grey ctermbg=237
endif
" 突出当前行.
set cursorline
" 自动切换到当前目录.
" set autochdir
" 自动读取文件.
set autoread
" 搜索忽略大小写.
set ic
" 自动搜索第一处.
set incsearch
" 设置换行编码
set fileformats=unix,dos,mac
" 设置Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等
set encoding=utf-8
" 设置保存编码.
set fileencoding=utf-8
set fileencodings=utf-8
" 设置复制剪切自动复制到系统剪贴板.
set clipboard=unnamed
" 在vim中可以使用鼠标.
set mouse=a
" 设置不折行
set nowrap
" set paste
" 设置vim计算为十进制.
set nrformats=
" 不知道macvim为啥json文件不显示双引号.
let g:vim_json_syntax_conceal = 0
" 解决命令行vim延迟问题.
set noesckeys
" 代码折叠问题.
set foldmethod=indent
" vim启动时关闭折叠.
set nofoldenable
" 快速高亮搜索结果.
noremap <Leader> h :set hlsearch! hlsearch?<CR>

" easymotion配置.
map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>l <Plug>(easymotion-lineforward)

" choosewin设置.
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" 设置emmet
autocmd FileType html,css,scss,sass EmmetInstall
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" airline设置.
set laststatus=2
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#tabline#buffer_nr_show = 0

" autoformat设置.
noremap <F2> :Autoformat<CR>
let g:autoformat_verbosemode=1

" 设置nerdtree
map <F5> :NERDTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore = ['\._\.DS_Store', '\.DS_Store', '\.git', '\.idea', '\.sass-cache']
" 显示所有文件（包括隐藏文件）.
" let NERDTreeShowHidden = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 关闭时如果只有nerdtree，就关闭它
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 设置ag的快捷键
map <F3> :Ag<space>
let g:ag_working_path_mode="r"

" 设置ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_map='<F4>'
" map <leader>f :CtrlPMixed<CR>
map <leader>f :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>

" 配置ale.
" 始终开启标志列.
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" let g:ale_linters = {'javascript': ['standard']}
" let g:ale_fixers = {'javascript': ['standard']}
" let g:ale_linters = {'javascript': ['eslint','standard']}
" let g:ale_fixers = {'javascript': ['eslint','standard']}
" <Leader>s 触发/关闭语法检查.
" nmap <Leader>s :ALEToggle<CR>
" <Leader>d 查看错误或警告的详细信息.
" nmap <Leader>d :ALEDetail<CR>
" <Leader>f 修复.
" nmap <Leader>r <Plug>(ale_fix)

" 配置macvim
if has("gui_running")
  " 隐藏左侧滚动条
  set guioptions-=L
  " 隐藏右侧滚动条
  set guioptions-=r
  " 设置gui的字体
  " set guifont=Literation_Mono_Powerline:h18
  set guifont=Source_Code_Pro_for_Powerline:h16
  " set background=dark
  " colorscheme solarized
endif

" python使用4个空格.
if has("autocmd")
  autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
endif

" 指定phtml为html.
" au BufNewFile,BufRead *.phtml set filetype=html

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
