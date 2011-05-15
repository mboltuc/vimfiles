set nocompatible                  " Must come first because it changes other options.
filetype off
autocmd!

silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

syntax on                         " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching parens

set autoread                      " Set to auto read when a file is changed from the outside

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set relativenumber                " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set lbr                           " modifies when Vim wraps text
set scrolloff=3                   " Show 3 lines of context around the cursor.

let g:syntastic_enable_signs = 1  " mark syntax errors with :signs

set vb t_vb=                      " Disable bell.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs
set softtabstop=2
set autoindent

set title                         " Set the terminal's title
set guioptions-=T                 " No toolbar 
set guioptions-=m                 " No menu
set guifont=Consolas:h13:cANSI   

colorscheme vividchalk
colorscheme moria

if has("gui_mac") || has("gui_macvim")
  set transparency=0
endif

if has("gui_win32") || has("gui_win32s")
  source $VIMRUNTIME/mswin.vim
  behave mswin
  let g:ruby_path = 'c:\Ruby192\bin'
endif

" ===== STATUS INFORMATION ====
set laststatus=2                 " Show the status line all the time

set statusline=%f
set statusline+=\ [%{&ff}]\ %y
set statusline+=\ (%(%l/%L-%c)%)

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

" ===== WINDOW SPLITTING =====
set splitbelow   " Open new horizontal split windows below current
set splitright   " Open new vertical split windows to the right
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999


" ====== NERDTree Configuration ======
let NERDChristmasTree = 1           " Enable nice colors
let NERDTreeHighlightCursorline = 1 " Make it easy to see where we are
let NERDTreeShowBookmarks = 1       " Show bookmarks visible
let NERDTreeShowHidden = 1          " Show hidden files
let NERDTreeHijackNetrw = 0         " Don't hijack NETRW
let NERDTreeIgnore = ['\.$', '\~$']
nmap <F2> :NERDTreeToggle<CR>

" map leader to ,
let mapleader = ","

"switch between the last two files
nnoremap <leader><leader> <c-^> 

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>  
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

"Custom rails-specific Command-T mappings
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" jump out of insert mode with jk kj bash
imap jk <Esc>l
imap kj <Esc>

" spell check settings 
set spelllang=en_us
nmap <silent><leader>s :set spell!<CR>

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  
  " setup C# building
  autocmd BufNewFile,BufRead *.cs compiler devenv

  " setup folding
  autocmd BufNewFile,BufRead *.cs set foldmethod=syntax

	" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
	"autocmd BufNewFile,BufRead *_spec.rb compiler rspec
	"autocmd BufWritePre * :%s/\s\+$//e " Kill trailing spaces when exiting a file
endif
