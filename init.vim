let mapleader = ","
" let maplocalleader = ","


" Plugins
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Ack
Plug 'mileszs/ack.vim'
" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Autopairs
Plug 'jiangmiao/auto-pairs'
" Bookmark
Plug 'MattesGroeger/vim-bookmarks'
" Buffergator
Plug 'jeetsukumaran/vim-buffergator'
" Calendar
Plug 'mattn/calendar-vim'
" CTRL-P
Plug 'kien/ctrlp.vim'
" Deoplete (autocompletion)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Ditto
Plug 'dbmrq/vim-ditto'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Emmet
Plug 'mattn/emmet-vim'
" Fugitive
Plug 'tpope/vim-fugitive'
" Git-Gutter
Plug 'airblade/vim-gitgutter'
" Goyo
Plug 'junegunn/goyo.vim'
" Gundo
Plug 'sjl/gundo.vim'
" Hybrid
Plug 'w0ng/vim-hybrid'
" Latex
Plug 'lervag/vimtex'
" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
" NERDCommenter
Plug 'scrooloose/nerdcommenter'
" NERDTree
Plug 'scrooloose/nerdtree'
" Obsession (restore nvim after restoring tmux)
Plug 'tpope/vim-obsession'
" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Pencil
Plug 'reedes/vim-pencil'
" Super-Tab
Plug 'ervandew/supertab'
" Surround
Plug 'tpope/vim-surround'
"Syntastic
Plug 'scrooloose/syntastic'
" Tabular
Plug 'godlygeek/tabular'
" Tagbar
Plug 'majutsushi/tagbar'
" Taskwarrior
Plug 'blindFS/vim-taskwarrior'
" Plug 'tbabej/taskwiki'
" Targets
Plug 'wellle/targets.vim'
" Trailing whitespace
Plug 'bronson/vim-trailing-whitespace'
" UltiSnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Unimpaired (switching buffers)
Plug 'tpope/vim-unimpaired'
" VimWiki
Plug 'vimwiki/vimwiki'
" Voom
Plug 'vim-voom/VOoM'

" Languages
" HTML5
Plug 'othree/html5.vim'
" JavaScript
Plug 'pangloss/vim-javascript'
" Ledger
Plug 'ledger/vim-ledger'
" Markdown
Plug 'tpope/vim-markdown'
" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 't9md/vim-ruby-xmpfilter'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Tagbar
"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Initialize plugin system
call plug#end()


" ================
" General Settings
" ================

" Spell Checking
set spelllang=de,en
" Automatisch in Text-Dateien
autocmd FileType latex,tex,md,markdown setlocal spell

" Indention
filetype indent on

" Relative Line Numbers
set relativenumber
set number

" Cursorline
set cursorline

" Allow switching between unsafed buffers
set hidden

" Remember the line when reopening the file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Soft word wrap
set wrap
set lbr

" Format inner paragraph
nnoremap « gwip
nnoremap » vipJ

" Soft and Hard tabs
set softtabstop=2
" set tabstop=4
set shiftwidth=2
set expandtab
set smarttab
set copyindent

" time stamps
cab datum <C-R>=strftime("%Y-%m-%d")<CR>
cmap <F3> <C-R>=strftime("%Y-%m-%d")<CR>

" Show tabs and white space
set listchars=tab:▸\ ,trail:·
set list

" Persistend undo
set undofile

" ===============
" Plugin Settings
" ===============

" Ack, use ag instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Airline
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#buffer_min_count = 0
" Zeigt nur den Dateiname
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme='base16'
" set termguicolors

" Bufforgator
let g:buffergator_viewport_split_policy = "B"

" Calendar
let g:calendar_wruler = 'So Mo Di Mi Do Fr Sa'
let g:calendar_monday = 1

" CTRL-P
" MRU and Files
map <C-P> :CtrlPMixed<cr>
" Opens buffer list
map <C-B> :CtrlPBuffer<cr>

" Deoplete enable at startup
let g:deoplete#enable_at_startup = 1

" Ditto
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>dt <Plug>ToggleDitto      " Turn it on and off
nmap <leader>dn <Plug>DittoNext        " Jump to the next word
nmap <leader>dp <Plug>DittoPrev        " Jump to the previous word
nmap <leader>dg <Plug>DittoGood        " Ignore the word under the cursor
nmap <leader>db <Plug>DittoBad         " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" Goyo
" function! s:goyo_enter()
"   AirlineToggle
" endfunction
"
" function! s:goyo_leave()
"   AirlineToggle
" endfunction
"
" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Git and Fugitive
nmap <leader>gs :Gstatus<cr>
nmap <leader>gp :Gpush origin master<cr>

" Hybrid Color Theme
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid

" Ledger
let g:ledger_maxwidth = 63        " Max width when folded
let g:ledger_decimal_sep = ','    " Comma for the currency
let g:ledger_align_at = 60        " Align the amount
let g:ledger_commodity_before = 0 " Configuration of the currency
let g:ledger_default_commodity = '€'
let g:ledger_commodity_sep = ' '
" Erlaubt Autocomplete mit <Tab> auch für die Beträge und Währungen
au FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
au FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
" Tabstops und Shiftwidth betragen 4 Leerzeichen
autocmd FileType ledger setlocal ts=4
autocmd FileType ledger setlocal sw=4

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NERDTree
map <leader>f :NERDTreeFind<cr>
map <leader>n :NERDTreeToggle<cr>

" Pencil
" let g:airline_section_x = '%{PencilMode()}'
let g:pencil#map#suspend_af = 'K'

" Tagbar
let g:tagbar_expand = 1
nmap <F8> :TagbarToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Trailing Whitespace
let g:extra_whitespace_ignored_filetypes = ['calendar'] " Not in Calendar

" UltiSnips and snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"  " Defaults c-b
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" " Defaults c-z
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mySnippets"]

" Vimtex
" let g:vimtex_latexmk_progname = 'nvr'  " Needs the remote server of neovim
let g:tex_flavor = 'latex'
"let g:vimtex_mappings_enabled = 1
map <leader>lt :VimtexTocToggle<CR>
map <leader>lc :VimtexCompile<CR>
map <leader>lv :VimtexView<CR>
map <leader>ls :VimtexStop<CR>
let g:vimtex_compiler_latexmk = {
\ 'backend' : 'nvim',
\ 'background' : 1,
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'executable' : 'latexmk',
\ 'options' : [
\   '-pdf',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}


" Vimwiki
let g:vimwiki_list = [{'path': '~/Documents/VimWiki/personal.wiki', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Journal'}, {'path': '~/Documents/VimWiki/work.wiki', 'syntax': 'markdown', 'ext': '.md', 'diary_header': 'Arbeitsjournal'}]
" autocmd FileType vimwiki setlocal fo+=a
let g:vimwiki_diary_months = {
      \ 1: 'Januar', 2: 'Februar', 3: 'März',
      \ 4: 'April', 5: 'Mai', 6: 'Juni',
      \ 7: 'Juli', 8: 'August', 9: 'September',
      \ 10: 'Oktober', 11: 'November', 12: 'Dezember'
      \ }

" Voom
let g:voom_tree_placement = "right"
let g:voom_ft_modes = {'markdown': 'markdown', 'md': 'markdown', 'liquid': 'markdown', 'pandoc': 'markdown', 'tex': 'latex', 'html': 'html', 'vimwiki': 'markdown'}
nnoremap <leader>v :Voom<CR>

" xmpfilter for ruby
nmap <buffer> <F5> <Plug>(xmpfilter-run)
xmap <buffer> <F5> <Plug>(xmpfilter-run)
imap <buffer> <F5> <Plug>(xmpfilter-run)

nmap <buffer> <F4> <Plug>(xmpfilter-mark)
xmap <buffer> <F4> <Plug>(xmpfilter-mark)
imap <buffer> <F4> <Plug>(xmpfilter-mark)


