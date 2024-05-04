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
colorscheme tokyonight

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ap/vim-css-color'
  Plug 'leshill/vim-json'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'kassio/neoterm'
  Plug 'othree/html5-syntax.vim'
  Plug 'tomasr/molokai'
  Plug 'wolf-dog/nighted.vim'
  Plug 'ale-cci/aqua-vim'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'valloric/youcompleteme'
  Plug 'Eliot00/git-lens.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'theRealCarneiro/hyprland-vim-syntax'
call plug#end()

nnoremap <C-a> :NERDTreeFocus<CR>
inoremap <C-a> <Esc>:NERDTreeFocus<CR>
nnoremap <C-e> :NERDTree<CR>
nnoremap <C-q> :NERDTreeToggle<CR>
nnoremap <C-g> :NERDTreeRefresh<CR>
inoremap <C-g> <Esc>:NERDTreeRefresh<CR>
nnoremap <C-p> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
inoremap <C-p> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-d> :tabclose<CR>
inoremap <C-d> <Esc>:tabclose<CR>
nnoremap <C-x> :term<CR>
inoremap <C-x> <Esc>:term<CR>
nnoremap <C-l> :call ToggleGitLens()<CR>
inoremap <C-l> <Esc>:call ToggleGitLens()<CR>
