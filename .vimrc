cal plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'

" vim Syntastic
Plug 'vim-syntastic/syntastic'

Plug 'jason0x43/vim-js-indent'

call plug#end()

syntax on
filetype plugin indent on
set sessionoptions-=options
set tabstop=2
set shiftwidth=2
set expandtab

setlocal indentkeys+=0

" use syntastic
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" reident 
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'

autocmd FileType typescript JsPreTmpl markdown
" escape
set timeoutlen=1000 ttimeoutlen=0
