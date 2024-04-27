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

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ap/vim-css-color'
call plug#end()

nnoremap <C-w> :NERDTreeFocus<CR>
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
