"automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

set nocompatible              " be iMproved, required
filetype off                  " required

au BufNewFile,BufRead *.fun,*.pks,*.pkb,*.sql,*.pls,*.plsql set filetype=plsql

 " Better copy & paste
 " When you want to paste large blocks of code into vim, press F2 before you
 " paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

call plug#begin('~/.vim/autoload')

Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go'
Plug 'chriskempson/base16-vim'
"Plug 'Shougo/neocomplete.vim'
Plug 'itchyny/lightline.vim'
"Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
"Javascript Development
Plug 'Pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
"Plug 'ternjs/tern_for_vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Completion integration with nvim-completion-manager.
Plug 'roxma/nvim-completion-manager'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
" Initialize plugin system
call plug#end()

" Mouse and backspace
 set mouse=a " on OSX press ALT and click
 set bs=2 " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
" inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows


"bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" "Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
"
"
" " easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>
imap jj  <Esc>

" imap [[ []<esc>ha
" imap {{ {}<esc>ha
" imap (( ()<esc>ha
" imap << <><esc>ha
" imap <c-m> <esc>%%a
"
" " then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim
" http://www.vim.org/scripts/download_script.php?src_id=13400
"set t_Co=256
" "color wombat256mod
"colorscheme base16-google-dark
" Enable syntax highlighting
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
syntax on
highlight goType cterm=italic ctermfg=cyan
highlight GoSignedInts cterm=italic ctermfg=cyan
highlight goUnsignedInts cterm=italic ctermfg=cyan
highlight goFloats cterm=italic ctermfg=cyan
highlight goComplexes cterm=italic ctermfg=cyan
" Showing line numbers and length
  set number " show line numbers
  set tw=79 " width of document (used by gd)
  set nowrap " don't automatically wrap on load
  set fo-=t " don't automatically wrap text when typing
  set colorcolumn=80
  highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

set laststatus =2

"Neocomplete
let g:neocomplete#enable_at_startup = 1

"Vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FIleType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>gd <Plug>(go-doc)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
set updatetime=100

let g:go_fmt_command = "goimports"
"delimitMate config
let g:delimitMate_expand_cr=1
"JS stuff
"let g:jsx_ext_required = 0
let g:javascript_conceal_arrow_function = "⇒"
"enable keyboard shortcuts
let g:tern_map_keys=1
"show argument hints
let g:tern_show_argument_hints='on_hold'


" Automatically start language servers.
let g:LanguageClient_autoStart = 1
