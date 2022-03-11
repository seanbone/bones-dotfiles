set encoding=utf-8

" Automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


""" Vim-plug plugins
call plug#begin('~/.config/nvim/plugged')
	" Fuzzy finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" Matlab
	Plug 'daeyun/vim-matlab'
	" onehalfdark color scheme
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	" Status bar
	"Plug 'itchyny/lightline.vim'
    "Plug 'glepnir/spaceline.vim'
    "Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
	" Git
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" Auto-detect indentation settings
	Plug 'SeanBone/vim-sleuth'
	Plug 'editorconfig/editorconfig-vim'
	" Easy commenting with <leader>ci
    Plug 'preservim/nerdcommenter'
    " NERDTree file navigation
    "Plug 'preservim/nerdtree'
    Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'
    " Code completion using CoC.vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " JSON with comments syntax highlighting
    Plug 'neoclide/jsonc.vim'
    " Dashboard on startup
    Plug 'glepnir/dashboard-nvim'
    " Spaces-based indentation indicators
    Plug 'Yggdroot/indentLine'
    " Auto-save feature
    Plug '907th/vim-auto-save'
    "Plug 'itchyny/vim-gitbranch'
    "if has('nvim') || has('patch-8.0.902')
    "  Plug 'mhinz/vim-signify'
    "else
    "  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
    "endif
    "Plug 'xolox/vim-misc'
    "Plug 'xolox/vim-session'
call plug#end()

syntax on
set t_Co=256


" NERDCommenter plugin options
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



" Prevent concealment in JSON and Markdown files
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0


" AutoSave plugin options
let g:auto_save = 1 " Enable auto-save on startup
let g:auto_save_write_all_buffers = 1  " write all open buffers as if you would use :wa

" Map ö to open fzf file search -- :GFiles ignores files in .gitignore
" Full command: git ls-files -o --exclude-standard && git ls-files
" This adds newly created files to the list, but not ones excluded by .gitignore
map ö :GFiles -o --exclude-standard && git ls-files<CR>

" Map keys for better navigation
" <C-i> corresponds to Ctrl-tab
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nmap <C-i> gt 
nmap > :bp<CR>
nmap < :bn<CR>
nmap <C-w> :bd<CR>
nmap <C-q> :qa<CR>

" Leader key
"let mapleader = "-"
let g:mapleader="\<Space>"

" Tell fzf to open files in a new tab
let g:fzf_action = {
      \ 'enter': 'edit',
      \ 'ctrl-o': 'edit',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
  \ }

" Enable mouse use
set mouse=a
" Show line numbers on startup
set number
" Show ruler on startup
set ruler

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
"set list lcs=tab:\\ 
set list listchars=tab:\▏\ ,trail:·,extends:»,precedes:«
let g:indentLine_char = '▏'
 
" Custom build/run/test/clean keybinds
" These defer to respective targets in vim.makefile
map <F4> :!gnome-terminal --full-screen -e 'bash -c "make -f vim.makefile _vim_build; read line"'<CR>
map <F5> :!gnome-terminal --full-screen -e 'bash -c "make -f vim.makefile _vim_run; read line"'<CR>
map <F6> :!gnome-terminal --full-screen -e 'bash -c "make -f vim.makefile _vim_test; read line"'<CR>
map <F9> :!make -f vim.makefile _vim_clean<CR>


" Vim-matlab configuration
let g:matlab_auto_mappings = 0
"nnoremap <buffer>         <leader>rn :MatlabRename
"nnoremap <buffer><silent> <leader>fn :MatlabFixName<CR>
"vnoremap <buffer><silent> <C-m> <ESC>:MatlabCliRunSelection<CR>
"nnoremap <buffer><silent> <C-m> <ESC>:MatlabCliRunCell<CR>
"nnoremap <buffer><silent> <C-h> :MatlabCliRunLine<CR>
"nnoremap <buffer><silent> ,i <ESC>:MatlabCliViewVarUnderCursor<CR>
"vnoremap <buffer><silent> ,i <ESC>:MatlabCliViewSelectedVar<CR>
"nnoremap <buffer><silent> ,h <ESC>:MatlabCliHelp<CR>
"nnoremap <buffer><silent> ,e <ESC>:MatlabCliOpenInMatlabEditor<CR>
"nnoremap <buffer><silent> <leader>c :MatlabCliCancel<CR>
"nnoremap <buffer><silent> <C-l> :MatlabNormalModeCreateCell<CR>
"vnoremap <buffer><silent> <C-l> :<C-u>MatlabVisualModeCreateCell<CR>
"inoremap <buffer><silent> <C-l> <C-o>:MatlabInsertModeCreateCell<CR>


" Airline configuration
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1

colorscheme onehalfdark
let g:airline_theme='onehalfdark'
"let g:spaceline_seperate_style = 'arrow'
"let g:spaceline_colorscheme = 'dracula'
" lightline
"let g:lightline = {
"  \ 'colorscheme': 'onehalfdark', 
"  \ 'active': {
"  \   'left': [
"  \     [ 'mode', 'paste' ],
"  \     [ 'gitstatus', 'readonly', 'filename' ],
"  \   ],
"  \   'right':[
"  \     [ 'lineinfo' ],
"  \     [ 'percent' ],
"  \     [ 'filetype', 'fileencoding' ]
"  \   ],
"  \ },
"  \ 'component_function': {
"  \   'filename': 'LightlineFilename',
"  \   'gitstatus': 'LightlineGitStatus',
"  \   'gitbranch': 'gitbranch#name'
"  \ }
"\ }

"function! LightlineGitStatus() abort
"    return get(g:, 'coc_git_status', '')
"endfunction

"function! LightlineFilename()
"  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
"  let modified = &modified ? ' +' : ''
"  return filename . modified
"endfunction

" NERDTree custom mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



" Dashboard custom mappings
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]


" ############## CoC custom settings mappings ##############
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-clangd']

" Based on example given at https://github.com/neoclide/coc.nvim

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `<leader>g` and `<leader>G` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>G <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" ############## END CoC custom settings ##############
