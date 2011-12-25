" ============================================================================
" File:        tocdown.vim
" Description: Display the headlines of a markdown document in an extra window
" Maintainer:  Matthias Guenther <matthias.guenther@wikimatze.de>
" License:     MIT
" Notes:       Inspired be gundo.vim, nerdtree.vim, and taglist.vim
" ============================================================================

" check if the plugin is available and avoids loading the plugin twice
if exists('loaded_tocdown')
  finish " stops vim from loading the rest of the file
endif
let g:loaded_tocdown = 1

" global command to call the function
command TocdownToggle call s:TocdownToggle()

" defining the path of the plugin
" :p modifier makes the pathname absolute
" :h suffix drops the last pathname component
let g:plugin_path = escape(expand('<sfile>:p:h'), '\')

" get the current edited file
" % says the current file and
let g:current_file = fnamemodify("%", ":p")

function! s:TocdownToggle()
  if s:TocdownToggleVisible()
    " quit the buffer for headlines
    exe ':bdelete! _Tocdown_'
  else
    " open a new window for the toclist of the markdown headings
    " silent press enter when external command demands it
    exe 'silent :!ruby ' . g:plugin_path . '/tocdown.rb ' . g:current_file . ' ' . g:plugin_path . '/.tocdown.txt '
    " open a new window with the buffername _Tocdown_
    exe 'botright vnew _Tocdown_'
    " read the parsed headlines into the the buffer with the _Tocdown_
    exe 'r ' . g:plugin_path . '/.tocdown.txt'
    " go the current edited file window
    exe 1 . "wincmd w"
  endif
endfunction

function! s:TocdownToggleVisible()
  if bufwinnr(bufnr('_Tocdown_')) != -1
    return 1
  else
    return 0
  endif
endfunction
