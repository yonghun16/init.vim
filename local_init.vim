"-----------------------------------------------------------------------------
" Filename : local_init.vim
" Version : 2.2
" Writer :  song. Y. H
" Date : 2020. 9. 17
"-----------------------------------------------------------------------------
"
"*****************************************************************************
" init.vim (.config/nvim) 수정
"*****************************************************************************
"===== 추가 하기 =====
"Plug 'joshdick/onedark.vim' 

"===== 주석 처리 하기 =====
"Plug 'gko/vim-coloresque' 
"Plug 'jistr/vim-nerdtree-tabs' 

"===== .vimrc 및 init.vim 업데이트 명령어 =====
":VimBootstrapUpdate

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
""sidebar
Plug 'jlanzarotta/bufexplorer'
Plug 'wesleyche/SrcExpl'
Plug 'majutsushi/tagbar'    "$sudo apt-get install ctags

""syntax
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "need phyhon (pip3 install pynvim, pip3 install --upgrade pynvim)
Plug 'roxma/nvim-yarp'
Plug 'airblade/vim-gitgutter'                          
Plug 'preservim/nerdcommenter'

""etc
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tlib_vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'} 
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'

call plug#end()
filetype plugin indent on


"*****************************************************************************
"" Basic Setup
"*****************************************************************************
"" Encoding 
set enc=utf-8 			    " editor의 인코딩
set tenc=utf-8				" terminal의 인코딩
set fencs=ucs-bom,utf-8,cp949,latin1,euc-kr
set nobomb 	                " Byte Order Mark 사용하지 않음 (unix와의 인코딩 해결 문제)
let $LANG = 'ko_KR.UTF-8' 	" vim의 언어
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set fileformats=unix,dos,mac

" Editing
set backspace=indent,eol,start
syntax on 				" 구문 강조
sy enable 				" 파일 형식에 따른 신택스 하이라이팅 켜기
set nu 					" 행 라인 표시
set rnu                 " 상대 넘버 라인 표시
set ruler               " 화면 하단에 커서 위치 표시
set nocompatible		" be iMproved
filet plugin indent on	" 파일의 종류를 자동으로 인식
"set linespace=4         " 행 라인 간격 조정
set bs=2 				" 백스페이스 사용
set hi=100 				" 명령어 기록 갯수 100개
set sc					" 완성중인 명령을 보이게함
set sel=exclusive		" 비주얼 모드에서의 동작 설정
set wrap 				" 자동 줄바꿈 사용
set ru 					" 커서 위치 항상 보이기
set magic 				" 모든 정규식 문자를 사용 할 수 있게함
set ls=2 				" 항상 status 라인을 표시
set cursorline          " 커서라인 하이라이팅
set uc=10				" 몇 글자를 입력받으면 swap 파일을 쓸 것인지 설정
set belloff=all         " Bell off
"set sm 				" 새로 추가된 괄호 짝 보여주기
"set mps+=<:> 			" 괄호짝 찾기에서 <> 도 찾도록 추가하기 (HTML 작업시 유용)
set pastetoggle=<Ins>   " <Ins>키로 paste 사용
set ai 					" 자동 들여쓰기
set si 					" 스마트 들여쓰기
set tabstop=4           " 탭 크기 4로 하기
set softtabstop=0
set shiftwidth=4        " 들여쓰기를 4칸으로 
set expandtab           " 탭을 공백으로 바꿈
set hlsearch			" 검색어 하이라이트 
set incsearch           " 검색 시 대소문자 구별 안함.
set ignorecase
set smartcase           " 검색 시 똑똑한 대소문자 구별 기능 사용
set go+=c               " '간단한 선택' 다이얼로그가 새 창에서 뜨지 않도록...


"*****************************************************************************
"" Visual Settings
"*****************************************************************************
"컬러스킴(테마) 설정
colorscheme onedark
let g:airline_theme='onedark'
let g:rehash256 = 1

set guifont=D2coding:h11

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

ab fucntion function
ab calss class
ab functio function
ab dunction function
ab defalut default
ab defautl default
ab functuin function
ab dunction function
ab functuin function
ab functopn function
ab fumction function
ab vlass class
ab xlass class
ab classs class
ab forarch foreach
ab inser insert
ab insertt insert
ab quewrty query
ab ovject object
ab objectr object
ab evho echo
ab printr print_r
ab prit print
ab printnl println
ab prnitln println
ab fales false
ab treu true
ab teur true
ab nulll null
ab nuii null
ab retrun return
ab retunr return
ab htis this
ab erturn return
ab bcakground background
ab herf href


"*****************************************************************************
"" Commands
"*****************************************************************************
" 저장
function! Run() range
    execute ':w'
    if &filetype == "java"
        if has("win32") || has("win64")  
            execute ':! javac -d ../bin %<.java'
            execute ':! java -cp ../bin %<'
        elseif has("unix")
            execute ':! javac -encoding utf-8 -d ../bin %<.java'
            execute ':! java -cp ../bin %<'
        endif
    elseif &filetype =="c"
        if has("win32") || has("win64")  
            execute ':! gcc -o %< %<.c'
            execute ':! %<.exe'
        elseif has("unix")
            execute ':! gcc -o %< %<.c'
            execute ':! ./%<'
        endif
    endif
endfunction

" Debug Command (JAVA:현재폴더 컴파일, C: 디버거)
function! Debug() range
    execute ':w'
    if &filetype == "java"
        if has("win32") || has("win64")  
            execute ':! javac %<.java'
            execute ':! java %<'
        elseif has("unix")
            execute ':! javac -encoding utf-8 %<.java'
            execute 'j! java %<'
        endif
    elseif &filetype =="c"
        execute ':! gcc -g -o d_%< %<.c'
        execute ':! gdb d_%<'
    endif
endfunction

" 오토 하이라이팅 토글
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=1
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

"탭 토글
function! Tab_toggle()
    let @/ = ''
    if exists('#tab_toggle')
        au!
        set expandtab
        augroup! tab_toggle
        echo 'Tab = 4 or 2 spaces'
        return 0
    else
        augroup tab_toggle
            au!
            set noexpandtab
        augroup end
        echo 'Tab = block'
        return 1
    endif
endfunction


"*****************************************************************************
"" Plug setting
"*****************************************************************************
" NERD Tree
let NERDTreeWinPos = "left"			" NERDTree 왼쪽에 놓기
set autochdir						" 디렉토리 이동 시 자동으로 디렉토리 인덱스 변경
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 40
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"deoplete
let g:deoplete#enable_at_startup = 1

"BufExplorer
let g:bufExplorerSplitHorzSize=12   " BufExplorer 사이즈 12로 설정

"Source Explorer
let g:SrcExpl_winHeight = 12		" SrcExpl 윈도우 높이 지정
let g:SrcExpl_refreshTime = 100		" refreshing time = 100ms
let g:SrcExpl_isUpdateTags = 0		" tag file update = off
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"

"ale
let g:ale_linters = {}

"Tag bar
let g:tagbar_right = 1				" Tagbar 오른쪽에 놓기  
let g:tagbar_width = 40			    " 너비 40으로 설정
let g:tagbar_sort = 0				" 파일 안의 태그 순서대로 태그정렬
let g:tagbar_autoshowtag = 1
let g:tagbar_autofocus = 1

"ultisnips 
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"

" syntastic 
let g:syntastic_check_on_open=1	" 시작하자마자 구문을 체크함.

" FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|swp|class|pyc|orig)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'

" vim-airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline_left_sep          = '▶'
    let g:airline_left_alt_sep      = '»'
    let g:airline_right_sep         = '◀'
    let g:airline_right_alt_sep     = '«'
    let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
    let g:airline#extensions#readonly#symbol   = '⊘'
    let g:airline#extensions#linecolumn#prefix = '¶'
    let g:airline#extensions#paste#symbol      = 'ρ'
    let g:airline_symbols.linenr    = '␊'
    let g:airline_symbols.branch    = '⎇'
    let g:airline_symbols.paste     = 'ρ'
    let g:airline_symbols.paste     = 'Þ'
    let g:airline_symbols.paste     = '∥'
    let g:airline_symbols.whitespace = 'Ξ'
else
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif

" grep.vim
nmap <silent> <leader>g :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"gitgutter 설정
let g:gitgutter_grep_command = 'grep -e'
let g:gitgutter_async = 0
let g:gitgutter_enabled = 0
let g:gitgutter_signs = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_avoid_cmd_prompt_on_windows = 0

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '│'
let g:indentLine_faster = 1

" emmet-vim 설정
let g:user_emmet_leader_key='<C-m>'

"*****************************************************************************
"" Functions
"*****************************************************************************

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

"*****************************************************************************
"" Mappings
"*****************************************************************************
"ESC 키를 편하게 <Ctrl+f>로 변경
imap <C-f> <ESC>
cmap <C-f> <ESC>
vmap <C-f> <ESC>
smap <C-f> <ESC>
nmap <C-f> <ESC>
tmap <C-f> <C-\><C-n>

"화살표키를 <Alt + h,j,k,l>로 변경
imap <A-l> <Right>
imap <C-l> <RIGHT>
imap <A-h> <Left>
imap <A-k> <Up>
imap <A-j> <Down>

cmap <A-l> <Right>
cmap <A-h> <Left>
cmap <A-k> <Up>
cmap <A-j> <Down>

tmap <A-l> <Right>
tmap <A-h> <Left>
tmap <A-k> <Up>
tmap <A-j> <Down>

"빠른 커서 이동
nmap <A-j> <Plug>(easymotion-w)
nmap <A-k> <Plug>(easymotion-b)
nmap <A-h> <Plug>(easymotion-overwin-f2)
nmap <A-l> <Plug>(easymotion-overwin-line)

nmap <C-k> 3k
nmap <C-j> 3j
nmap <C-h> ^
nmap <C-l> $

vmap <C-k> 3k
vmap <C-j> 3j
vmap <C-h> ^
vmap <C-l> $

"빠른 화면 이동
nmap <C-n> <C-e><down><Up><C-e><down><up><C-e>
nmap <C-p> <C-y><up><down><C-y><up><down><C-y>

"터미널 버퍼 일 때 창 이동
tmap <ESC> <C-\><C-n>
tmap <C-q> <C-\><C-n>:q!<CR>
tmap <C-w>k <C-\><C-n><C-w>k
tmap <C-w>j <C-\><C-n><C-w>j
tmap <C-w>h <C-\><C-n><C-w>h
tmap <C-w>l <C-\><C-n><C-w>l 

"영역지정 시 <Shift + j,k> 키로 현재 라인을 위아래로 move 
vmap <S-j> :m '>+1<CR>gv 
vmap <S-k> :m '<-2<CR>gv 

"Shift-tab으로 back Tab
imap <S-Tab> <C-d>

"resize split window
nmap <C-Down> <C-W>2-
nmap <C-Up> <C-W>2+
nmap <C-Left> <C-W>2<
nmap <C-Right> <C-W>2>

"----------------------------------------------------------

" set leaderkey
let mapleader = ','

" C, Java 컴파일 및 실행
nmap <leader>a :call Run()<CR>
nmap <leader>d :call Debug()<CR>

"sidebar plugs
nmap <leader>h :NERDTreeToggle<CR>      
nmap <leader>j :SrcExplToggle<CR><C-W>k[i
nmap <leader>l :TagbarToggle<CR>

"" Buffer
nmap <leader>q :bp<CR>
nmap <leader>w :bn<CR>
nmap <leader><tab> :ToggleBufExplorer<CR>
nmap <C-i> <C-i>

"" 현재 창에 새 파일 열기
nmap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" 새 탭에 새 파일 열기
nmap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>


"" Git
nmap <Leader>ga :Gwrite<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gsh :Gpush<CR>
nmap <Leader>gll :Gpull<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gr :Gremove<CR>

"" Open current line on GitHub
nmap <Leader>o :.Gbrowse<CR>

" 상대 넘버 토글
nmap <leader>r :set rnu!<cr>

" FuzzyFinder 단축키
nmap <silent>sf		 :FufFile **/<CR>
nmap <silent>sb 	 :FufBuffer<CR>
nmap <silent>st 	 :FufTagWithCursorWord!<CR>
nmap <silent>s,      :FufBufferTag<CR>
nmap <silent>so      :FufJumpList<CR>
"nmap <silent>st 	   :FufTag<CR>

" session management
nmap <leader>so :OpenSession<Space>
nmap <leader>ss :SaveSession<Space>
nmap <leader>sd :DeleteSession<CR>
nmap <leader>sc :CloseSession<CR>

" terminal emulation
nmap <silent> <leader>sh :sp<CR><C-w>j<C-w>10_:terminal<CR>a

" 탭 공백 4칸 변경 on/off 토글
nmap <leader>t :if Tab_toggle()<Bar>set noexpandtab<Bar>endif<CR>

" Tag 관련
nmap <silent>tt :!ctags -R .<CR>
nmap <silent>ts :tselect<CR>
nmap <silent>tn :tnext<CR>
nmap <silent>tp :tprevious<CR>

" 파일 비교하기
nmap <leader>v :vert diffsplit 

"" Show History
nmap <leader>y :History:<CR>

" Prettier
nmap <Leader>p <Plug>(Prettier)

" 자동 하이라이팅
nmap <leader>/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

"" Set working directory
nmap <leader>. :lcd %:p:h<CR>

"" Clean search (highlight)
nmap <silent> <leader><space> :noh<cr>

" 영역지정 시 들여쓰기/내어쓰기. 
vmap >> >gv 
vmap << <gv 


"*****************************************************************************
"" Custom configs
"*****************************************************************************
" vuejs
autocmd Filetype vue setlocal ts=2 sw=2 expandtab

"*****************************************************************************

" 홈 디렉토리가 존재할 때에만 사용할 수 있는 기능 정의
if exists("$HOME")

    " 특정 시스템에서는 홈 디렉토리 경로 끝에 / 또는 \ 문자가 붙어 있기 때문에, 그것들을 제거한다.	
    let s:home_dir = $HOME	
    let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)	
    if s:temp == "/" || s:temp == "\\"	
        let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)	
    endif

    " 경로 설정
    let s:dir_tmp = s:home_dir."/.vim/tmp"
    let s:dir_backup = s:home_dir."/.vim/backup"

    " 임시 디렉토리 설정
    if isdirectory(s:dir_tmp)
        set swf
        let &dir = s:dir_tmp
    else
        set noswf
        set dir=.
    endif

    " 백업 디렉토리 설정
    if isdirectory(s:dir_backup)
        set bk
        let &bdir = s:dir_backup
        set bex=.bak
    else
        set nobk
    endif
endif
