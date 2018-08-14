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
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
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
set nocompatible

setlocal indentkeys+=0

" escape
set timeoutlen=1000 ttimeoutlen=10

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

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1

" syntax highlighting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

let g:jsx_ext_required = 1

" JsDoc
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1

" protobuf settings
" augroup filetype
"    au! BufRead,BufNewFile *.proto setfiletype proto
" augroup end
" 
" if version < 600
"   syntax clear
" elseif exists("b:current_syntax")
"   finish
" endif
" 
" syn case match
" 
" syn keyword pbTodo       contained TODO FIXME XXX
" syn cluster pbCommentGrp contains=pbTodo
" 
" syn keyword pbSyntax     syntax import option
" syn keyword pbStructure  package message group oneof
" syn keyword pbRepeat     optional required repeated
" syn keyword pbDefault    default
" syn keyword pbExtend     extend extensions to max reserved
" syn keyword pbRPC        service rpc returns
" 
" syn keyword pbType      int32 int64 uint32 uint64 sint32 sint64
" syn keyword pbType      fixed32 fixed64 sfixed32 sfixed64
" syn keyword pbType      float double bool string bytes
" syn keyword pbTypedef   enum
" syn keyword pbBool      true false
" 
" syn match   pbInt     /-\?\<\d\+\>/
" syn match   pbInt     /\<0[xX]\x+\>/
" syn match   pbFloat   /\<-\?\d*\(\.\d*\)\?/
" syn region  pbComment start="\/\*" end="\*\/" contains=@pbCommentGrp
" syn region  pbComment start="//" skip="\\$" end="$" keepend contains=@pbCommentGrp
" syn region  pbString  start=/"/ skip=/\\./ end=/"/
" syn region  pbString  start=/'/ skip=/\\./ end=/'/
" 
" if version >= 508 || !exists("did_proto_syn_inits")
"   if version < 508
"     let did_proto_syn_inits = 1
"     command -nargs=+ HiLink hi link <args>
"   else
"     command -nargs=+ HiLink hi def link <args>
"   endif
" 
"   HiLink pbTodo         Todo
" 
"   HiLink pbSyntax       Include
"   HiLink pbStructure    Structure
"   HiLink pbRepeat       Repeat
"   HiLink pbDefault      Keyword
"   HiLink pbExtend       Keyword
"   HiLink pbRPC          Keyword
"   HiLink pbType         Type
"   HiLink pbTypedef      Typedef
"   HiLink pbBool         Boolean
" 
"   HiLink pbInt          Number
"   HiLink pbFloat        Float
"   HiLink pbComment      Comment
"   HiLink pbString       String
" 
"   delcommand HiLink
" endif
" 
" let b:current_syntax = "proto"
