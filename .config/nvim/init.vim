" Autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Install plugins
call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'
call plug#end()

" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set cmdheight=1
set mouse=a " Copy selected text with mouse to system clipboard
"set undofile " Save undos after file closes
set wildmode=longest:list,full " Complete longest common string, then each full match
set updatetime=250 " If this many milliseconds nothing is typed the swap file will be written to disk
set visualbell " Turn off the audio bell (no beeps)
set gdefault " Always do global substitutions
set title " Set terminal title
set whichwrap+=<,>,[,]
set shiftwidth=4
set softtabstop=2
set undolevels=1000
set smartindent " Indentation
set shortmess=Ia " Disable startup message
set fileencoding=utf-8 " Encoding when written to file
set fileformat=unix " Line endings
set timeout timeoutlen=1000 ttimeoutlen=10 " TODO: ?
set autowrite " Automatically save before :next, :make etc
set ignorecase " Search case insensitive:
set smartcase " .. but not when search pattern contains upper case characters
set nocursorcolumn
set number " See line numbers
set wrap
set textwidth=79
set formatoptions=qrn1
set notimeout
set ttimeout
set ttimeoutlen=10
set nobackup " Don't create annoying backup files
set path=+** " Search down into subfolders

" Tabs size
set expandtab " Transforms tabs into spaces.
set shiftwidth=2 " Number of spaces for indentation.
set tabstop=2 " Number of spaces for tabs.

" Color support
" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
set foldmethod=syntax
set foldignore=""
set nofoldenable

" Buffers
set hidden

" Searching
set wrapscan
set ignorecase
set smartcase

" UI
set cursorline  " Highlight current line
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors " Enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True color
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

:autocmd InsertEnter,InsertLeave * set cul! " Notify on mode change visually

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

set viewoptions=cursor,slash,unix

" Bufferline
let g:bufferline_echo = 0

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<C-P>'
au filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'} " Don't autocomplete in vim

" Vim session
let g:session_autosave="no"
let g:session_autoload="no"

" Command mappings
cabbrev rp Rp

" CTRL mappings
nnoremap <C-L> :Files<CR>

" Space mappings
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"
nnoremap <leader>= yypVr=

" Space q
nmap <Leader>q    :q<CR>

" Space w
" Save
nmap <Leader>w :w<CR>

" Space y
" Copy whole file
nnoremap <Leader>y :%y<CR>

" Space i
nnoremap <Leader>ii :PlugInstall<CR>
" Update plugins
nnoremap <Leader>iu :PlugUpdate<CR>
" Check vim health
nnoremap <Leader>ih :CheckHealth<CR>

" Space a
nnoremap <Leader>a :wq<CR>

" Space s
" Source vimrc
nnoremap <Leader>s :source ~/.dotfiles/nvim/init.vim<CR>

" Space d
nmap <Leader>d :bd<CR>

" Space f
nmap <Leader>f :source ~/.dotfiles/nvim/init.vim<CR>

" Auto commands
au FileType dirvish call fugitive#detect(@%)
au FocusLost * :wa " Auto save everything

" Remaps - Search and replace
xnoremap gs y:%s/<C-r>"//g<Left><Left>

" Copy line
nnoremap Y y$

" Other
set guicursor=n-v-c:hor20,i-ci:ver20 " Make cursor block in insert mode and underline in normal mode
autocmd VimLeave * set guicursor=a:ver25-blinkon25 " Make cursor block when leaving to shell

" Testing
set signcolumn=yes
set foldcolumn=0 " Remove sidebar column

let g:ale_fixers = {
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
