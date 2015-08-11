
" Set leader as ,
let mapleader = ','
let g:mapleader = ','
let maplocalleader = ','


"{{{ Global Settings

"Close vi compatible mode
set nocompatible
"The 5 lines below solves the error problem with the gVim menu and right
"click bar
set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Auto Syntax Highlight
syntax on
syntax enable
"Filetype detect
filetype on
"Filetype plugin detect
filetype plugin on
"不设定在插入状态无法用退格键和 Delete 键删除回车符
"Config to let the Backspace and Delete Key can be used in Insert Mode
set backspace=indent,eol,start
"Config extend key to let the cursor move to next line or previous line when
"the cursor is at the start or the end of a line.
set whichwrap+=<,>,h,l
"display the row number
set number
""The number of the context row previous and behind the cursor
set scrolloff=6
"The Configuration about the indent (tab and space)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
"Set cmdline-history
set history=1024

set nocursorline

set nobackup

set autochdir
"Ignore Case when searching
set ignorecase
set smartcase
set nowrapscan
set incsearch
set hlsearch

"Close the sound of the error
set noerrorbells
set novisualbell
set t_vb=

"How many tenths of a second to blink when matching brackets
set mat=2
"允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"Allow to change the buffer when there are unsaved changes, at this moment
"the changes will be saved by vim
set hidden
"smart and auto indent
set smartindent
set autoindent
"设定命令行的行数为 1
set cmdheight =2
"显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus =2
"显示括号配对情况
set showmatch

"解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline
"设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ \(%P\):%c:%l/%L%)
"显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

"the config about the vimrc
if has("unix")
	set fileformats=unix,dos,mac
	nmap <leader>e :tabnew $HOME/.vimrc<cr>
	let $VIMFILESNAME = '.vimrc'
	let $VIMFILEFLODER = $HOME.'/.vim'
	let $VIMFILES = $HOME."/".$VIMFILESNAME
else
	set fileformats=dos,unix,mac
	nmap <leader>e :tabnew $HOME/_vimrc<cr>
	let $VIMFILESNAME = '_vimrc'
	let $VIMFILEFLODER = $HOME.'/vimfiles'
	let $VIMFILES = $HOME."/".$VIMFILESNAME
endif

"设定doc文档目录
let helptags=$VIMFILEFLODER."/doc"
set helplang=cn
"}}}

"{{{ plugin for vundle
"more script see: http://vim-scripts.org/vim/scripts.html
set nocompatible
filetype off
set rtp+=$VIMFILEFLODER/bundle/Vundle.vim
call vundle#begin()
let g:bundle_dir = $VIMFILEFLODER.'/bundle'
"let Vundle manage Vundle
"required!
Plugin 'gmarik/Vundle.vim'

"Color
Plugin 'molokai'
Plugin 'altercation/vim-colors-solarized'


"Syntax

Plugin 'xml.vim'
"Plugin 'Markdown'

" {{{ asins/template.vim 文件模板
Plugin 'asins/template.vim'
let g:template_author = "Peng Liu"
" }}}

"{{{ tpope/vim-fugitive Git命令集合
Plugin 'tpope/vim-fugitive'
if executable('git')
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
endif
"}}}

" {{{ rst表格支持 需要python支持
Plugin 'yangzetian/RST-Tables'
",,c  ->  创建新的rst表格
",,f  ->  更新当前表格
" }}}

" {{{ MiniBufExpl
Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne=1
let g:miniBufExplBuffersNeeded = 1

" }}}

" {{{ bufexplorer.vim Buffers切换
Plugin 'bufexplorer.zip'
" \be 全屏方式查看全部打开的文件列表
" \bv 左右方式查看   \bs 上下方式查看
noremap <silent> <c-q> :BufExplorer<CR>
noremap <silent> <a-q> :BufExplorerHorizontalSplit<CR>
noremap <silent> <s-q> :BufExplorerVerticalSplit<CR>

let g:bufExplorerDefaultHelp=0      " 不显示默认帮助信息
let g:bufExplorerShowRelativePath=1 " 显示相对路径
let g:bufExplorerSortBy='mru'       " 使用最近使用的排列方式
let g:bufExplorerSplitRight=0       " 居左分割
let g:bufExplorerSplitVertical=1    " 垂直分割
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " 在新窗口中打开
autocmd BufWinEnter \[Buf\ List\] setl nonumber
" }}}

" {{{ The-NERD-tree 文件管理器
" Plugin 'The-NERD-tree'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1
" 让Tree把自己给装饰得多姿多彩漂亮点
let NERDChristmasTree=1
" 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeAutoCenter=1
" 指定书签文件
let NERDTreeBookmarksFile=$VIMFILEFLODER.'\NERDTree_bookmarks'
" 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeMouseMode=2
" 是否默认显示书签列表
let NERDTreeShowBookmarks=1
" 是否默认显示文件
let NERDTreeShowFiles=1
" 是否默认显示行号
let NERDTreeShowLineNumbers=0
" 窗口位置（'left' or 'right'）
let NERDTreeWinPos='left'
" 窗口宽度
let NERDTreeWinSize=31
nnoremap <Leader>tt :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w
"}}}

"{{{ The-NERD-Commenter 注释代码用的，以下映射已写在插件中
Plugin 'The-NERD-Commenter'
"<leader>ca 在可选的注释方式之间切换，比如C/C++ 的块注释和行注释//
"<leader>cc 注释当前行
"<leader>cs 以”性感”的方式注释
"<leader>cA 在当前行尾添加注释符，并进入Insert模式
"<leader>cu 取消注释
"<leader>cm 添加块注释
"}}}

" {{{ auto_mkdir 自动创建目录
Plugin 'auto_mkdir'
" }}}

" {{{ mru.vim 记录最近打开的文件
Plugin 'mru.vim'
let MRU_File = $VIMFILEFLODER."/_vim_mru_files"
let MRU_Max_Entries = 500
let MRU_Add_Menu = 0
nmap <leader>f :MRU<cr>
" }}}

" {{{ majutsushi/tagbar 代码导航
Plugin 'majutsushi/tagbar'
if has("unix")
	let g:tagbar_ctags_bin = '/usr/bin/ctags'
else
	let g:tagbar_ctags_bin = $VIMFILEFLODER.'/ctags.exe'
endif
let g:tagbar_autofocus = 0
let g:tarbar_width = 30
"let g:tagbar_left = 1
"let g:tagbar_vertical = 1
nmap <leader>tl :TagbarToggle<CR>
" }}}

" {{{ CmdlineComplete 命令行模式下自动补全
Plugin 'CmdlineComplete'
" Ctrl + p 向后切换
" Ctrl + n 向前切换
" }}}

" {{{ colorizer 颜色显示插件
Plugin 'colorizer'
" <leader>tc 切换高亮
" :ColorHighlight  - start/update highlighting
" :ColorClear      - clear all highlights
" :ColorToggle     - toggle highlights
" }}}

" {{{ asins/renamer.vim 文件重命名
Plugin 'asins/renamer.vim'
" :Renamer 将当前文件所在文件夹下的内容显示在一个新窗口
" :Ren 开始重命名
"}}}

" {{{ mikeage/ShowMarks 设置标记（标签）
Plugin 'mikeage/ShowMarks'
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let showmarks_ignore_type = "hqm"
" m{mark} 设置标记  '{mark} 移动到标记
"<Leader>mt   - 打开/关闭ShowMarks插件
"<Leader>mh   - 清除当前行的标记
"<Leader>ma   - 清除当前缓冲区中所有的标记
"<Leader>mm   - 在当前行打一个标记，使用下一个可用的标记名
"}}}

" {{{ ctrlp.vim 文件搜索
Plugin 'ctrlp.vim'
"set wildignore+=tmp,*.so,*.swp,*.zip  " MacOSX/Linux
set wildignore+=tmp\*,*.swp,*.zip,*.exe   " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_working_path_mode=1
"let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_cache_dir=$VIMFILEFLODER.'/_ctrlp'
let g:ctrlp_extensions=['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
nmap <a-p> :CtrlP D:/htdocs/tudou.com/<cr>
"<c-d> 切换完全/只文件名搜索
"<c-r> 切换搜索匹配模式：字符串/正则
" }}}

" {{{ matchit.zip 对%命令进行扩展使得能在嵌套标签和语句之间跳转
Plugin 'matchit.zip'
" % 正向匹配      g% 反向匹配
" [% 定位块首     ]% 定位块尾
"}}}

" {{{ Mark 给各种tags标记不同的颜色，便于观看调式的插件。
Plugin 'Mark'
" 这样，当我输入“,hl”时，就会把光标下的单词高亮，在此单词上按“,hh”会清除该单词的高亮。如果在高亮单词外输入“,hh”，会清除所有的高亮。
" 你也可以使用virsual模式选中一段文本，然后按“,hl”，会高亮你所选中的文本；或者你可以用“,hr”来输入一个正则表达式，这会高亮所有符合这个正则表达式的文本。
nmap <silent> <leader>hl <plug>MarkSet
vmap <silent> <leader>hl <plug>MarkSet
nmap <silent> <leader>hh <plug>MarkClear
vmap <silent> <leader>hh <plug>MarkClear
nmap <silent> <leader>hr <plug>MarkRegex
vmap <silent> <leader>hr <plug>MarkRegex
" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或“,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“*”查找了其它文本。
" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
hi MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
hi MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
hi MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
hi MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
hi MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
"}}}

"Plugin You Complete me, code auto complete.
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"}}}

"All of your Plugins must be added before the following line"{{{
call vundle#end()            "required
filetype plugin indent on    "required
"To ignore plugin indent changes, instead use:
"filetype plugin on

"Brief help
":PluginList          - list configured plugins
":PluginInstall(!)    - install (update) plugins
":PluginSearch(!) foo - search (or refresh cache first) for foo
":PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line"}}}


" Alt-W切换自动换行"{{{
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>

" 复制选中文本到系统剪贴板
vnoremap <leader>yo "*y
" 从系统剪贴板粘贴内容
nnoremap <leader>po "*p
" 选中模式 Ctrl+c 复制选中的文本
vnoremap <c-c> "+y
" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @+ = expand('%:p')<cr>"}}}

" 菜单栏"{{{
if has("gui_running")
	set guioptions-=m " 隐藏菜单栏
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	set guioptions-=r " 隐藏右侧滚动条
	set guioptions-=b " 隐藏底部滚动条
	set showtabline=0 " Tab栏
endif
"}}}

" Alt-Space is System menu"{{{
if has("gui")
  noremap <m-space> :simalt ~<cr>
  inoremap <m-space> <c-o>:simalt ~<cr>
  cnoremap <m-space> <c-c>:simalt ~<cr>
endif
"}}}

"set nobomb"{{{

"origin
" comment the below line will fix the path error with vim in cmd.
"set encoding=utf-8 "self-define for display chinese or special charater
if has('win32')
	set termencoding=chinese
endif
set fileencodings=ucs-bom,utf-8,gbk,cp936,cp950,latin1
set ambiwidth=double
set guifont=Source\ Code\ Pro\ 13
"console
if has("win32")
	language messages zh_cn.utf-8
endif
"}}}

" 删除所有行未尾空格"{{{
nnoremap <f12> :%s/[ \t\r]\+$//g<cr>
"}}}

" 窗口切换"{{{
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
"}}}
" Buffers/Tab操作快捷方式!"{{{
nnoremap <s-h> :bprevious<cr>
nnoremap <s-l> :bnext<cr>
nnoremap <s-j> :tabnext<cr>
nnoremap <s-k> :tabprev<cr>
"nnoremap F :tabe %
"}}}
" 插入模式下上下左右移动光标"{{{
inoremap <a-h> <left>
inoremap <a-l> <right>
inoremap <a-j> <c-o>gj
inoremap <a-k> <c-o>gk
"}}}
"{{{ Folding 折叠
"折叠相关的快捷键
"zR 打开所有的折叠
"zo 展开折叠
"zO 对所在范围内所有嵌套的折叠点展开
"zc 折叠
"[z 到当前打开的折叠的开始处。
"]z 到当前打开的折叠的末尾处。
"zj 向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
"zk 向上移动到前一折叠的结束处。关闭的折叠也被计入。
set foldenable
"设置语法折叠
"manual  手工定义折叠
"indent  更多的缩进表示更高级别的折叠
"expr    用表达式来定义折叠
"syntax  用语法高亮来定义折叠
"diff    对没有更改的文本进行折叠
"marker  对文中的标志折叠
set foldmethod=marker
"设置代码块折叠后显示的行数
set foldexpr=1
"设置折叠层数为
set foldlevel=0
"设置折叠区域的宽度
set foldcolumn=0
set switchbuf=usetab,newtab
"新建的文件，刚打开的文件不折叠
autocmd! BufNewFile,BufRead * setlocal nofoldenable
"自动运用设置
autocmd! bufwritepost $VIMFILESNAME silent source $VIMFILES
"}}}

" Several File Types {{{
autocmd Filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
autocmd FileType html,xhtml setlocal smartindent foldmethod=indent
autocmd FileType css setlocal smartindent foldmethod=indent
autocmd FileType css setlocal noexpandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.scss setl ft=scss
autocmd filetype css vnoremap <leader>co J:s/\s*\([{:;,]\)\s\1/g<CR>:let @/=''<cr>
autocmd filetype css nnoremap <leader>co :s/\s*\([{:;,]\)\s\1/g<CR>:let @/=''<cr>
autocmd BufRead,BufNewFile jquery.*.js setlocal ft=javascript syntax=jquery
autocmd BufRead,BufNewFile *.json setlocal ft=json
autocmd BufRead,BufNewFile *.twig set syntax=twig
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
" }}}

" {{{全文搜索选中的文字
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
" }}}

" {{{ Win平台下窗口全屏组件 gvimfullscreen.dll
" Ctrl + Enter 全屏切换
" Shift + t 降低窗口透明度
" Shift + y 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
if has('gui_running') && has('gui_win32') && has('libcall')
	"self-define 换用Vimtweak.dll来实现透明
	let g:MyVimLib =$VIMFILEFLODER.'/vimtweak.dll'
	let g:MyFullScreenState = 1
	"let g:MyVimLib = 'gvimfullscreen.dll'
	function! ToggleFullScreen()
		"let s:IsFullScreen = libcallnr("gvimfullscreen.dll", 'ToggleFullScreen', 0)
		"let s:IsFullScreen = libcallnr("gvimfullscreen.dll", 'ToggleFullScreen', 27 + 29*256 + 30*256*256)
		"if g:MyFullScreenState == 0
			"let g:MyFullScreenState = 1
		"else
			"let g:MyFullScreenState = 0
		"endif
		let g:MyFullScreenState = 1 - g:MyFullScreenState
		call libcallnr(g:MyVimLib, "EnableMaximize", g:MyFullScreenState)
		"call libcall(g:MyVimLib, 'ToggleFullScreen', 27 + 29*256 + 30*256*256)
	endfunction

	let g:VimAlpha = 245
	function! SetAlpha(alpha)
		let g:VimAlpha = g:VimAlpha + a:alpha
		if g:VimAlpha < 180
			let g:VimAlpha = 180
		endif
		if g:VimAlpha > 255
			let g:VimAlpha = 255
		endif
		call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
	endfunction

	let g:VimTopMost = 0
	function! SwitchVimTopMostMode()
		if g:VimTopMost == 0
			let g:VimTopMost = 1
		else
			let g:VimTopMost = 0
		endif
		call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
	endfunction
	"映射 Ctrl+Enter 切换全屏vim
	map <c-cr> <esc>:call ToggleFullScreen()<cr>
	"切换Vim是否在最前面显示
	nmap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
	"增加Vim窗体的不透明度
	nmap <s-t> <esc>:call SetAlpha(10)<cr>
	"增加Vim窗体的透明度
	nmap <s-y> <esc>:call SetAlpha(-10)<cr>
	"Vim启动的时候自动调用InitVim 以去除Vim的白色边框
	"由于安装了Eclimd，在Eclipse中启动gvim时不能运行这段透明代码。
	if !exists('g:vimplugin_running') "!eclim#EclimAvailable()
		"autocmd GUIEnter * call libcallnr(g:MyVimLib, 'InitVim', 0)
		" 默认设置透明
		autocmd GUIEnter * call libcallnr(g:MyVimLib, 'EnableMaximize', g:MyFullScreenState)
		autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
	endif
endif
" }}}

" {{{ 回车时前字符为{时自动换行补全
function! <SID>OpenSpecial(ochar,cchar)
	let line = getline('.')
	let col = col('.') - 2
	if(line[col] != a:ochar)
		if(col > 0)
			return "\<esc>a\<CR>"
		else
			return "\<CR>"
		endif
	endif
	if(line[col+1] != a:cchar)
		call setline('.',line[:(col)].a:cchar.line[(col+1):])
	else
		call setline('.',line[:(col)].line[(col+1):])
	endif
	return "\<esc>a\<CR>;\<CR>".a:cchar."\<esc>\"_xk$\"_xa"
endfunction
inoremap <silent> <CR> <C-R>=<SID>OpenSpecial('{','}')<CR>
" }}}

" {{{ Fast edit hosts file
function! FlushDNS()
	python import sys
	exe 'python sys.argv = ["ipconfig /flushdns"]'
endfunction
nmap <silent> <Leader>host :tabnew c:\windows\system32\drivers\etc\hosts<CR>
nmap <silent> <Leader>dns :!ipconfig /flushdns<CR><space>
"autocmd! bufwritepost hosts call FlushDNS()
" }}}


" {{{ self-define configuration

"self-define Bundle vim
"Bundle "calendar.vim"

" Vimwiki config
Plugin 'vimwiki'
Plugin 'vimcn/vimwiki.vim.cnx'
Plugin 'calendar.vim--Matsumoto'
" calendar
map <F12> :Calendar<cr>
" 打开语法高亮
syntax enable
syntax on

" 打开对文件类型插件的支持
filetype indent on
filetype plugin on
filetype plugin indent on

" ######### VimWiki 写作助手 ######## "

" 使用鼠标映射
let g:vimwiki_use_mouse = 1

" 不要讲驼峰词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

let g:vimwiki_list = [{
\ 'path': 'D:/Blog/wiki',
\ 'path_html' : 'D:/Blog/html/',
\ 'template_path' : 'D:/Blog/html/template/',
\ 'template_default': 'default',
\ 'template_ext': '.html',
\ 'auto_export' : 1
\}]
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,div,del,code,h1,h2,h3,h4,h5,h6,!--'
"let g:vimwiki_file_exts = 'jpg,pdf,txt,doc,rtf,xls,php,zip,rar,7z,html,gz'


"snipMate plugin
"Install dependencies:
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

"Install:
Plugin 'garbas/vim-snipmate'
imap <C-E> <Plug>snipMateNextOrTrigger
smap <C-E> <Plug>snipMateNextOrTrigger
let g:snips_email = 'myme5261314@gmail.com'
let g:snips_author = 'Peng Liu'
let g:snips_github = 'https://github.com/myme5261314/'
"let g:snips_trigger_key = '<C-E>'

"取消eclim中用户自定义补全时多出的窗口
set completeopt-=preview
"排名前100的配色方案
Plugin 'Colour-Sampler-Pack'
"语法高亮
"Bundle "https://bitbucket.org/abudden/taghighlight"
Plugin 'TagHighLight'
"StartUp with Tagbar
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"this command which is commented has conflict with the TagHighLight plugin
"autocmd FileType * nested :call tagbar#autoopen(0)
" Start tagbar in when vim startup no matter what.
if has('gui_running')
	autocmd VimEnter * nested :TagbarOpen
endif
" Tagbar open with supported files.
autocmd VimEnter * nested :call tagbar#autoopen(1)
" Also open tagbar in a existing vim.
autocmd BufEnter * nested :call tagbar#autoopen(0)


"Bundle "winmanager--Fox"
"""""""""""""""""""""""""""""""
"" winManager setting (desprecated)
"""""""""""""""""""""""""""""""
"设置界面分割
"Bundle "winmanager"
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
"let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
"let g:winManagerWindowLayout = "TagBar|NERDTree"
"let g:NERDTree_title = "[NERD Tree]"
"function! NERDTree_Start()
	"exec 'NERDTree'
"endfunction
"function! NERDTree_IsValid()
	"return 1
"endfunction
"设置winmanager的宽度，默认为25
"let g:winManagerWidth = 30
"定义打开关闭winmanager按键
"nmap <silent> <F8> :WMToggle<cr>

"Eclimd configuration
"let g:EclimValidateSortResults = 'severity'


" }}}

" {{{ Some Configuration in order to get vim to Python IDE

" Something fun
Plugin 'uguu-org/vim-matrix-screensaver'
" Spell Check
Plugin 'Engspchk'
" Doxygen
"Bundle 'doxygen-support.vim'

" Pydict"{{{
"Plugin 'rkulla/pydiction'
"let g:pydiction_location = $VIMFILEFLODER.'/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 20

"au BufNewFile,BufRead *.py,*.pyw setf python"}}}

" Python Indent indent/python.vim
"Bundle 'python.vim--Vasiliev'
"Bundle 'gg/python.vim'
"Bundle 'python.vim'
" Python Folding
autocmd Filetype python set foldmethod=indent
" Python Debugging
"Bundle 'VimPdb'
" Python Mode
Plugin 'klen/python-mode'
autocmd FileType python let g:pymode = 1
" Disable pylint checking every save
"let g:pymode_lint_write = 0

" Set key 'R' for run python code
"let g:pymode_run_key = 'R'
" }}}




"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType java set omnifunc=javacomplete#Complete
"if has("autocmd") && exists("+omnifunc")
	 "autocmd Filetype *
   "\ if &omnifunc == "" |
   "\   setlocal omnifunc=syntaxcomplete#Complete |
   "\ endif
"endif
"let g:rubycomplete_buffer_loading = 1
"let g:rubycomplete_classes_in_global = 1
""let g:rubycomplete_rails = 1

"if exists('+shellslash')
	"let shellslash = 1
"endif

" 设定配色方案"{{{
"syntax enable
if has('gui_running')
	set background=dark
else
	set background=light
endif
"set t_Co=16
"let g:solarized_termcolors=16
"colorscheme solarized
if has('gui_running')
	colorscheme molokai
else
	colorscheme elflord
endif
"colorscheme solarized
"colorscheme molokai"}}}

" GVIM进入时最大化"{{{
if(has("win32") || has("win95") || has("win64") || has("win16"))
	au GUIEnter * simalt ~x
else
	function! Maximize_Window()
		silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
	endfunction
endif

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif


"}}}

" Git Gutter Plugin {{{
Plugin 'airblade/vim-gitgutter'
" }}}

" Markdown Preview {{{
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_browser='Google Chrome'
"let vim_markdown_preview_temp_file=1
let vim_markdown_preview_toggle=2
" }}}

" Markdown Syntax {{{
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" }}}


" Status Bar {{{
Plugin 'bling/vim-airline'
" }}}

