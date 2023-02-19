let mapleader = "\<Space>"
set ignorecase
set smartcase
set nofixendofline
set noswapfile "swapファイルを作らない
set binary noeol "ファイルの終わりに改行しない
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set hls
set rnu nu "相対と絶対の行数を表示
set termguicolors
set cursorline "カーソルのラインを強調
colorscheme molokai

call plug#begin()
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jiangmiao/auto-pairs' "（の閉じも一緒に作成
Plug 'vim-airline/vim-airline' "theme
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox' "theme
Plug 'preservim/nerdtree'
"Plug 'mattn/vim-goimports' "format
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"JS
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

"C++
Plug 'kana/vim-operator-user'
call plug#end()

"my
nnoremap <leader>f :nohlsearch<CR>
noremap . $
noremap , ^
nnoremap <Leader>m :%s/<C-r><C-w>//g<LEFT><LEFT>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>w :w<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-s> :call coc#rpc#restart()<Enter>
command! -nargs=0 Format :call CocAction('format')
"nmap <silent> ff :call CocAction('format')<Enter>
try
nmap <silent> tj :call CocAction('diagnosticNext')<cr>
nmap <silent> tk :call CocAction('diagnosticPrevious')<cr>
endtry

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"nerdtree
let NERDTreeShowHidden=1 "show dot file
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <silent><C-n> :NERDTree<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent><C-f> :NERDTreeFind<CR>