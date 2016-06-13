" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

if exists('$TMUX')
	set term=screen-256color
endif

" pathogen设置
execute pathogen#infect()
" 主题设置
syntax enable
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme Tomorrow-Night-Bright

set guifont=Monaco:h14

if has("gui_running")
	"隐藏左侧滚动条.
	set guioptions-=L
	"隐藏右侧滚动条.
	set guioptions-=r
	"全屏时用.
	"set lines=9999
endif

set number
set noswapfile
set nobackup
syntax on
filetype plugin indent on

" 自动读取文件
set autoread
" 自动浏览第一处搜索
set incsearch

" call togglebg#map("<F5>")
" map <F5> :NERDTreeToggle<CR>
map <F5> <plug>NERDTreeTabsToggle<CR>
map <F6> <C-w>h
map <F7> <C-w>l
map <F9> <C-w>j
map <F10> <C-w>k

" 调节窗口大小
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize +3<CR>
nmap w. :vertical resize -3<CR>

" 缩进设置.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set foldlevelstart=99
"ruby使用2个空格
if has("autocmd")
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 
endif
"ctrlp的设置
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<F4>'
let g:ctrlp_cmd = 'CtrlP'

"tab 竖线
set list
set lcs=tab:\|\ ,nbsp:%,trail:-
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/

" ejs文件html高亮.
au BufNewFile,BufRead *.ejs set filetype=html

" set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" These lines setup the environment to show graphics and colors correctly.
set t_Co=256
 
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
 
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
 
set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup
