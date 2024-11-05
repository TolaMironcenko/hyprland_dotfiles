set number
syntax on
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldcolumn=2
set mouse=a
set encoding=utf8
set guifont=JetBrains\ Mono\ Nerd\ Font\ 11

"-------- colorcolumn ------------------
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
"---------------------------------------

"-------------------- plugins ------------------------
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ap/vim-css-color'
  Plug 'leshill/vim-json'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'othree/html5-syntax.vim'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'Eliot00/git-lens.vim'
  Plug 'pangloss/vim-javascript'
call plug#end()
"-----------------------------------------------------

"--------- keybinds -------------------------
nnoremap <C-a> :NERDTreeFocus<CR>
inoremap <C-a> <Esc>:NERDTreeFocus<CR>
nnoremap <C-e> :NERDTree<CR>
nnoremap <C-z> :NERDTreeToggle<CR>
inoremap <C-z> :NERDTreeToggle<CR>
nnoremap <C-g> :NERDTreeRefresh<CR>
inoremap <C-g> <Esc>:NERDTreeRefresh<CR>
"------------ tabs -----------------------
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-p> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-d> :tabclose<CR>
inoremap <C-d> <Esc>:tabclose<CR>
"-----------------------------------------
"----------------- term --------
nnoremap <C-x> :term<CR>
inoremap <C-x> <Esc>:term<CR>
"-------------------------------
"------------- gitlens -----------------------
nnoremap <C-l> :call ToggleGitLens()<CR>
inoremap <C-l> <Esc>:call ToggleGitLens()<CR>
"---------------------------------------------
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
"------------- vim-plug --------------
nnoremap <C-i> :PlugInstall<CR>
inoremap <C-i> <Esc>:PlugInstall<CR>
"-------------------------------------
nnoremap <C-u> :so%<CR>
inoremap <C-u> <Esc>:so%<CR>
"--------------------------------------------
