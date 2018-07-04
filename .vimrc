call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'

" vim Syntastic
Plug 'vim-syntastic/syntastic'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/vim-js-pretty-template'
" Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/unite.vim'
Plug 'Quramy/vim-dtsm'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

syntax on
filetype plugin indent on
set sessionoptions-=options
set tabstop=2
set shiftwidth=2
set expandtab

setlocal indentkeys+=0

" escape
set timeoutlen=1000 ttimeoutlen=0

" syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_signs = 1

""""""""" typescript settings
" tsuquyomi with syntastic 
" let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_typescript_checkers = ['tslint', 'tsc'] " see tslint output
" let g:tsuquyomi_disable_quickfix = 1
" autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
" autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
" set ballooneval
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
" autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" 
" autocmd FileType typescript setlocal completeopt+=menu,preview
" autocmd FileType typescript setlocal completeopt-=menu,preview
" let g:tsuquyomi_completion_detail = 0
autocmd FileType typescript syn clear foldBraces
let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
autocmd FileType typescript JsPreTmpl markdown
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
 let g:ycm_semantic_triggers['typescript'] = ['.']
