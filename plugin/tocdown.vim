" ============================================================================
" File:        tocdown.vim
" Description: cim plugin to display the headlines of a markdown document in
               " an extra window
" Maintainer:  Matthias Guenther <matthias.guenther@wikimatze.de>
" License:     GPLv2+ -- look it up.
" Notes:       Inspired be gundo.vim and nerdtree.vim
" ============================================================================

" global commands
command TocdownToggle call s:TocdownToggle()

" defining the path of the plugin
" :p modifier makes the pathname absolute
" :h suffix drops the last pathname component
let g:plugin_path = escape(expand('<sfile>:p:h'), '\')

function! s:TocdownToggle()
  if s:TocdownToggleVisible()
    " quit the buffer
    exe ':bdelete! _Tocdown_'
  else
    " open a new window for the toclist of the markdown headings and go to
    exe ':!ruby ' . g:plugin_path . '/tocdown.rb ' . g:plugin_path . '/.tocdown.txt'
    " the window
    exe ':botright vnew _Tocdown_'
    " read the parsed headlines into the file
    exe ':r ' . g:plugin_path . '/.tocdown.txt'
    " set the buffer to this window
    " tbd.
  endif
endfunction

function! s:TocdownToggleVisible()
  if bufwinnr(bufnr('_Tocdown_')) != -1
    return 1
  else
    return 0
  endif
endfunction
