" Set leader as ,
let mapleader = ','
let g:mapleader = ','
let maplocalleader = ','


"{{{ Global Settings

" Python Path
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
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/

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
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ \(%P\):%c:%l/%L%)
"显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"启动时不显示 捐赠提示
set shortmess=atl
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

"the config about the vimrc
if has("unix")
    set fileformats=unix,dos,mac
    nmap <leader>e :e $HOME/.vimrc<cr>
    let $VIMFILESNAME = '.vimrc'
    let $VIMFILEFLODER = $HOME.'/.vim'
    let $VIMFILES = $HOME."/".$VIMFILESNAME
else
    set fileformats=dos,unix,mac
    nmap <leader>e :e $HOME/_vimrc<cr>
    let $VIMFILESNAME = '_vimrc'
    let $VIMFILEFLODER = $HOME.'/vimfiles'
    let $VIMFILES = $HOME."/".$VIMFILESNAME
endif

"设定doc文档目录
let helptags=$VIMFILEFLODER."/doc"
set helplang=cn
"}}}

"plugin for vundle {{{
"more script see: http://vim-scripts.org/vim/scripts.html
set nocompatible
filetype off
set rtp+=$VIMFILEFLODER/bundle/Vundle.vim
call vundle#begin()
let g:bundle_dir = $VIMFILEFLODER.'/bundle'
"let Vundle manage Vundle {{{
"required!
Plugin 'gmarik/Vundle.vim'
" }}}

"Color {{{
Plugin 'molokai'
Plugin 'altercation/vim-colors-solarized'
" }}}

"Syntax {{{
Plugin 'xml.vim'
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

" GUndo Plugin {{{
Plugin 'sjl/gundo.vim'
nnoremap <F5> :GundoToggle<CR>
" }}}

" {{{ The-NERD-tree 文件管理器
" Plugin 'The-NERD-tree'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
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
let NERDTreeWinPos='right'
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
" 使用多余的空格
let NERDSpaceDelims=1
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

" {{{ vim-easytags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
" }}}

" {{{ majutsushi/tagbar 代码导航
Plugin 'majutsushi/tagbar'
if has("unix")
    "let g:tagbar_ctags_bin = '/usr/bin/ctags'
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
else
    let g:tagbar_ctags_bin = $VIMFILEFLODER.'/ctags.exe'
endif
let g:tagbar_autofocus = 0
let g:tarbar_width = 30
let g:tagbar_left = 1
nmap <leader>tl :TagbarToggle<CR>
"StartUp with Tagbar
if has('gui_running')
    " autocmd VimEnter * nested :TagbarOpen
endif
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'd:macros:1',
            \ 'g:enums',
            \ 't:typedefs:0:0',
            \ 'e:enumerators:0:0',
            \ 'n:namespaces',
            \ 'c:classes',
            \ 's:structs',
            \ 'u:unions',
            \ 'f:functions',
            \ 'm:members:0:0',
            \ 'v:global:0:0',
            \ 'x:external:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ }
            \ }
" Tagbar open with supported files.
"autocmd VimEnter * nested :call tagbar#autoopen(1)
" Also open tagbar in a existing vim.
"autocmd BufEnter * nested :call tagbar#autoopen(0)
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
" Plugin 'mikeage/ShowMarks'
" let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" let showmarks_ignore_type = "hqm"
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
" nmap <silent> <leader>hl <plug>MarkSet
" vmap <silent> <leader>hl <plug>MarkSet
" nmap <silent> <leader>hh <plug>MarkClear
" vmap <silent> <leader>hh <plug>MarkClear
" nmap <silent> <leader>hr <plug>MarkRegex
" vmap <silent> <leader>hr <plug>MarkRegex
" 你可以在高亮文本上使用“,#”或“,*”来上下搜索高亮文本。在使用了“,#”或“,*”后，就可以直接输入“#”或“*”来继续查找该高亮文本，直到你又用“#”或“*”查找了其它文本。
" <silent>* 当前MarkWord的下一个     <silent># 当前MarkWord的上一个
" <silent>/ 所有MarkWords的下一个    <silent>? 所有MarkWords的上一个
" hi MarkWord1  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
" hi MarkWord2  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
" hi MarkWord3  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
" hi MarkWord4  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
" hi MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
" hi MarkWord6  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
"}}}

" Git Gutter Plugin {{{
Plugin 'airblade/vim-gitgutter'
"Plugin 'mhinz/vim-signify'
"let g:signify_vcs_list = [ 'git', 'hg' ]
" }}}

" Auto Fix Python PEP8 Errors {{{
Plugin 'tell-k/vim-autopep8'
let g:autopep8_disable_show_diff=1
" }}}

" UltiSnips {{{
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" Markdown Preview Plugin {{{
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_browser='Google Chrome'
"let vim_markdown_preview_temp_file=1
let vim_markdown_preview_toggle=2
Plugin 'suan/vim-instant-markdown'
" }}}

" Markdown Syntax Plugin {{{
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" }}}

" Status Bar Plugin {{{
Plugin 'bling/vim-airline'
" }}}

" Jedi for Python Doc {{{
Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"

let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"
" }}}

" Python Mode {{{
Plugin 'klen/python-mode'
autocmd FileType python let g:pymode = 1
" Disable pylint checking every save
"let g:pymodeLlint_write = 0
" Disable code completion support, use youcompleteme instead.
let g:pymode_rope_completion = 0
nmap <silent> <S-F> :PymodeLintAuto<CR> :PymodeLint<CR>
" Set key 'R' for run python code
"let g:pymode_run_key = 'R'
"let g:pymode_paths = [$HOME.'/anaconda/lib/python2.7/site-packages/']
" }}}

"Plugin You Complete me, code auto complete. {{{
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"}}}

" color_coded {{{
Plugin 'jeaye/color_coded'
" }}}

" YCM-Generator {{{
Plugin 'rdnetto/YCM-Generator'
" }}}

"排名前100的配色方案 {{{
Plugin 'Colour-Sampler-Pack'
" }}}

"语法高亮 Plugin {{{
Plugin 'TagHighLight'
" }}}

"Eclimd configuration {{{
"let g:EclimValidateSortResults = 'severity'
"取消eclim中用户自定义补全时多出的窗口
"set completeopt-=preview
" }}}

" Spell Check Plugin {{{
Plugin 'Engspchk'
" }}}

" delimitMate Plugin {{{
Plugin 'Raimondi/delimitMate'
" }}}

" easymotion Plugin {{{
Plugin 'easymotion/vim-easymotion'
" }}}

" vim-template Plugin {{{
Plugin 'aperezdc/vim-template'
let g:templates_user_variables = [
            \   ['AUTHOR', 'GetAuthor'],
            \   ['EMAIL', 'GetEmail'],
            \ ]

function! GetAuthor()
    return 'Peng Liu'
endfunction
function! GetEmail()
    return 'liupeng@imscv.com'
endfunction
let g:email='liupeng@imscv.com'
let g:license='GNU GPL3'
" }}}

" C++ {{{
let &path.="../include, src/include,/usr/include/AL,"
Plugin 'a.vim'
Plugin 'indexer.tar.gz'
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" Dependencies of the indexer.tar.gz Plugin.
Plugin 'DfrankUtil'
Plugin 'vimprj'

Plugin 'Mizuchi/STL-Syntax'

" Indent Line
Plugin 'Yggdroot/indentLine'
" let g:indentLine_char='︙'
" let g:indentLine_char='┆'
let g:indentLine_char='¦'
" Vim
let g:indentLine_color_term = 239
"GVim
let g:indentLine_color_gui = '#A4E57E'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

Plugin 'derekwyatt/vim-protodef'
" Dependencies of vim-protodef Plugin.
Plugin 'derekwyatt/vim-fswitch'

Plugin 'dyng/ctrlsf.vim'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '30%'
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
" nnoremap <Leader>sp :CtrlSF<CR>
" vnoremap <Leader>sp <Plugin>CtrlSFVwordExec<CR>
" nnoremap <Leader>swp <Plugin>CtrlSFCwordExec<CR>
nnoremap     <Leader>sp :CtrlSF<CR>
" vmap     <Leader>f <Plug>CtrlSFVwordPath
vnoremap     <Leader>sp <Plug>CtrlSFVwordExec
nnoremap     <Leader>swp <Plug>CtrlSFCwordPath
" nmap     <Leader>p <Plug>CtrlSFPwordPath
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kshenoy/vim-signature'

" Plugin 'gcmt/wildfire.vim'
" This selects the next closest text object.
map <SPACE> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

" Plugin 'Chiel92/vim-autoformat'
" au BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>
let g:formatdef_clangformat_objc = '"clang-format -style=file"'
let g:autoformat_verbosemode = 1
"}}}

" {{{ Session Plugin
Plugin 'tpope/vim-obsession'
" }}}

" {{{ Project Plugin
Plugin 'tqmz/project.tar.gz'
" init project environment variables
let g:proj_path=expand("`pwd`")
let g:proj_file=expand(g:proj_path.".vimproject")
" }}}

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
" }}}

" Alt-W切换自动换行"{{{
noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>
" }}}

" 复制粘贴 "{{{
if has('unix')
    " 复制选中文本到系统剪贴板
    vnoremap <leader>yo "+y
    " 从系统剪贴板粘贴内容
    nnoremap <leader>po "+p
    " 选中模式 Ctrl+c 复制选中的文本
    vnoremap <c-c> "+y
    " 普通模式下 Ctrl+c 复制文件路径
    nnoremap <c-c> :let @+ = expand('%:p')<cr>
else
    " 复制选中文本到系统剪贴板
    vnoremap <leader>yo "*y
    " 从系统剪贴板粘贴内容
    nnoremap <leader>po "*p
    " 选中模式 Ctrl+c 复制选中的文本
    vnoremap <c-c> "*y
    " 普通模式下 Ctrl+c 复制文件路径
    nnoremap <c-c> :let @* = expand('%:p')<cr>
endif
" }}}

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
set guifont=Source\ Code\ Pro\ 9
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
" move cursor in Insert Mode
"inoremap <C-h> <C-o>h
"inoremap <C-j> <C-o>j
"inoremap <C-k> <C-o>k
"inoremap <C-l> <C-o>l
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
autocmd FileType vim set foldmethod=marker
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
autocmd FileType cpp set tabstop=4 shiftwidth=4 expandtab foldmethod=syntax nofoldenable cc=80
" }}}

" {{{全文搜索选中的文字
vnoremap <silent> <leader>f y/<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
vnoremap <silent> <leader>F y?<c-r>=escape(@", "\\/.*$^~[]")<cr><cr>
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

" {{{ Close Window
nnoremap <C-W> :close<CR>
" }}}

" {{{ self-define configuration


" 打开语法高亮
syntax enable
syntax on

" 打开对文件类型插件的支持
filetype indent on
filetype plugin on
filetype plugin indent on

" {{{ Some Configuration in order to get vim to Python IDE
" Python Folding
autocmd Filetype python set foldmethod=indent
" }}}

" VDebug Plugin {{{
Plugin 'joonty/vdebug'
" }}}

" 设定配色方案"{{{
"syntax enable
set background=dark
if has('gui_running')
    set background=dark
else
    " set background=light
endif
colorscheme solarized
if has('gui_running')
    " colorscheme molokai
    " colorscheme solarized
    set background=dark
else
    " set background=light
    colorscheme elflord
endif
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

" }}}

" Use h and l to wrap line in normal mode {{{
set whichwrap+=h,l
" }}}

" Some UI config {{{
set cursorline
set showcmd
set lazyredraw
nnoremap <leader><space> :nohlsearch<CR>
" move to beginning/end of line
noremap B ^
noremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" }}}

" Pyclewn Settings {{{
let g:pyclewn_terminal = "xterm, -e"
let pyclewn_args="--window=left"
"let g:pyclewn_terminal = "tmux,split-window"
"let g:pyclewn_python = "python"
" }}}
