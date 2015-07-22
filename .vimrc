
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set nocompatible
set nocompatible

" Vundle

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Vundles
Plugin 'Hackerpilot/DCD', {'rtp': 'editors/vim'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'rdnetto/YCM-Generator'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

set omnifunc=syntaxComplete#complete

let g:dcd_importPath=['/usr/share/dmd/src/phobos/','/usr/share/dmd/src/druntime/import']

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :wall!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number

" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu
set wildmode=list:longest,full

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase


set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" show white chars
"set list listchars=tab:. ,trail:.
set list
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< 
set listchars=tab:>-,trail:~,extends:>,precedes:<,nbsp:-

" scroll
set scrolloff=3

" command: show command when typing
set showcmd


" Mouse
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key


set report=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers

" Search result will be focused on the center of the screen
map N Nzz
map n nzz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set cindent
set wrap "Wrap lines

set formatoptions=tcrqn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
syntax enable "Enable syntax hl

" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash

colorscheme ron
set background=dark

set encoding=utf8
try
    lang en_US
catch
endtry
set fileencodings=utf8,gbk

set ffs=unix,dos,mac "Default file types

" Set off the other paran
highlight MatchParen ctermbg=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...

" set nobackup
" set nowb
" set noswapfile


"Persistent undo
try
    set undodir = ~/.vim_runtime/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""
" => Statusline
" """"""""""""""""""""""""""""""
" " Always hide the statusline
set laststatus=2

" Format the statusline

"Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ @%r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE MODE] '
    else
        return ''
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""
" => Editing
""""""""""""""""""""""""""""""""""""""""""""

" Create blank new line and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>


""""""""""""""""""""""""""""""""""""""""""""
" => Command Related
""""""""""""""""""""""""""""""""""""""""""""

" Swap : and ; so that we can use :command faster
nnoremap ; ;
nnoremap ; :


""""""""""""""""""""""""""""""""""""""""""""
" => Language Specific
""""""""""""""""""""""""""""""""""""""""""""

" D and Jade
augroup jd
  autocmd!
  autocmd FileType jade set tabstop=4
  autocmd FileType jade set sw=4
augroup END

augroup d
  autocmd!
  autocmd FileType d set tabstop=4
  autocmd FileType d set shiftwidth=4
augroup END



"""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""

" easymotion
map <Leader> <Plug>(easymotion-prefix)

" Run current file as a script
nnoremap <Leader>r <Esc>:w<CR>:!./%<CR>

" Quick close without save
nnoremap QQ <Esc>:q!<CR>
nnoremap <leader>q :wall<CR>:qa<CR>
nnoremap <leader>Q :qa!<CR>

" buffers
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-j> 6j
nnoremap <C-k> 6k<CR>
nnoremap u :bp<CR>
nnoremap i :bn<CR>

" movement
nnoremap j 6j
nnoremap k 6k
nnoremap h 10h
nnoremap l 10l
nnoremap a ^
nnoremap ; $

nnoremap f <C-f>
nnoremap b <C-b>
nnoremap n <C-f>
nnoremap p <C-b>
nnoremap <C-n> <C-f>
nnoremap <C-p> <C-b>

" number
nnoremap <F2> :set nonumber!<CR>


" paste
nnoremap <F3> :set paste!<CR>



" md
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.md.html set filetype=markdown


" nerdtree
map <C-t> :NERDTreeToggle<CR>

" YCM
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'


