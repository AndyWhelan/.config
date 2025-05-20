"  System settings {{{
:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif
"   }}}   
"  Arista-specific settings {{{
:if filereadable( $VIM . "/vimfiles/arista.vim" )
   source $VIM/vimfiles/arista.vim
:elseif filereadable( $HOME . "/.vim/vimfiles/arista.vim" )
   source $HOME/.vim/vimfiles/arista.vim
:endif
"  }}}
" Global personalized settings {{{
" Default fallback for all buffers {{{
augroup default_fallback_settings
   autocmd!
   autocmd BufReadPre,BufNewFile * call s:setup_default_fallback_settings()
augroup END
function! s:insert_fold_marker()
   if stridx(&l:formatoptions, 'o') == -1 | let b:line_continue_edit = b:comment | else | let b:line_continue_edit='' | endif 
   let l:to_print = b:comment . '  ' . b:marker_start . "\n" . b:line_continue_edit . b:marker_end
   call feedkeys( l:to_print, 'in' )
endfunction
function! s:setup_default_fallback_settings() abort
   if !exists('b:comment') | let b:comment = '#' | endif
   if !exists('b:marker_start') | let b:marker_start = '{{{' | endif
   if !exists('b:marker_end') | let b:marker_end = '}}}' | endif
   let l:sid = matchstr(expand('<sfile>'), '<SNR>\d\+_')
   " Build the mapping string with proper escaping
   let l:map = '<C-o>:setlocal foldmethod=manual<CR>'
   let l:map .= '<C-o>:call ' . l:sid . 'insert_fold_marker()<CR>'
   let l:map .= "\<Esc>ki"
   let l:map .= '<C-o>:setlocal foldmethod=marker<CR>'
   let l:map .= "\<Esc>za0f{hi"
   " Define the buffer-local insert-mode mapping
   execute 'inoremap <buffer> <localleader>mf ' . l:map
endfunction
" }}}
" Plugins {{{
" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Add your plugins here, for example:
" Plug 'tpope/vim-fugitive'
" Plug 'wannesm/wmgraphviz.vim'
"
"" End of plugin section
call plug#end()
"  }}}
" Other {{{
" Remap <Space> to <C-w>
nnoremap <Space> <C-w>
" Remap 'o' to modify behavior based on whether we're inside a fold
nnoremap o :<C-U>call FoldCheck()<CR>i
function! FoldCheck()
    let l:inside_fold = foldclosed(line('.')) != -1
    normal! o
    if l:inside_fold            " There'll be parenthesis. Delete.
        normal! cc
    endif
endfunction
syntax on
set background=dark
filetype plugin indent on
augroup common_shellfile_syntax
   autocmd!
   autocmd BufRead,BufNewFile ~/.common_rc set filetype=sh
augroup END
let mapleader="," | let maplocalleader="\\"
set number colorcolumn=85
colorscheme elflord
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Copy selected lines or complete file to Arista pb (http://pb/)
command! -range=% Pb :<line1>,<line2>w !curl -F c=@- pb
"

" Remap jk to <Esc>
inoremap jk <Esc>
vnoremap jk <Esc>
"  }}}
"  }}}
" .dot settings {{{
augroup dot_settings
   autocmd!
   autocmd BufRead,BufNewFile *.dot call s:setup_dot()
augroup END
function! s:setup_dot() abort
   " Folds
   let b:comment="//"
   setlocal foldenable foldmethod=marker
   set filetype=dot
endfunction "  }}}
" .md settings {{{
augroup markdown_settings
   autocmd!
   autocmd FileType markdown call s:setup_markdown()
augroup END
function! s:setup_markdown() abort
   " Folds
   let b:comment="<!--  -->"
   setlocal foldenable foldmethod=marker
   inoremap <buffer> <localleader>mf <!-- {{{  --><CR><!-- }}} --><Esc>k$F{la
   " Insert image (figure)
   inoremap <buffer> <localleader>f ![]()<Esc>F[a
   " Insert bold/italic
   inoremap <buffer> <localleader>b ****<Esc>hi
   inoremap <buffer> <localleader>i __<Esc>i
   " Blockquote and horizontal rule
   inoremap <buffer> <localleader>bq > <Space>
   inoremap <buffer> <localleader>hr ---<CR><CR>
   " Headings
   inoremap <buffer> <localleader>h1 # <Esc>A
   inoremap <buffer> <localleader>h2 ## <Esc>A
   inoremap <buffer> <localleader>h3 ### <Esc>A
   inoremap <buffer> <localleader>h4 #### <Esc>A
   inoremap <buffer> <localleader>h5 ##### <Esc>A
   inoremap <buffer> <localleader>h6 ###### <Esc>A
   " Code (inline and block)
   inoremap <buffer> <localleader>ci ``<Left>
   inoremap <buffer> <localleader>cb ```<CR>```<Esc>kA
   " Links
   inoremap <buffer> <localleader>l []()<Esc>F[ci[
   inoremap <buffer> <localleader>bb <Esc>ciwBUG[<Esc>pa](https://bb/<Esc>pa)
   inoremap <buffer> <localleader>cl <Esc>ciwcl[<Esc>pa](https://cl/<Esc>pa)
   "inoremap <buffer> <localleader>og <Esc>ciw[`<Esc>pa`](https://opengrok.infra.corp.arista.io/source/xref/eos-trunk/src/<Esc>pa)
   inoremap <buffer> <localleader>og <Esc>v?[a-zA-Z\./]\+<CR>c[`<Esc>pa`](https://opengrok.infra.corp.arista.io/source/xref/eos-trunk/src/<Esc>pa)<Esc>:nohlsearch<CR>a
endfunction "  }}}
" .py settings {{{
let g:python_recommended_style = 0 " Override default settings for .py files
augroup py_settings
   autocmd!
   autocmd FileType python nnoremap <buffer> <localleader>c $i# 
   autocmd FileType python inoremap <buffer> <localleader>c # 
augroup END "  }}}
" .vimrc settings {{{
augroup vimrc_settings
   autocmd!
   autocmd BufRead,BufNewFile $MYVIMRC call s:setup_vimrc()
augroup END
function! s:setup_vimrc() abort
   " Folds
   setlocal foldenable foldmethod=marker
   let b:comment = '"'
   "inoremap <buffer> <localleader>mf <C-o>:setlocal foldmethod=manual<CR>"  {{{<CR>}}}<Esc>ki<C-o>:setlocal foldmethod=marker<CR><Esc>za0f{hi
endfunction " }}}
