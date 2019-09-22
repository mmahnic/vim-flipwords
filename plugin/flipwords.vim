" Author: Marko Mahnič
" Created: April 2012
" License: GPL (http://www.gnu.org/copyleft/gpl.html)
" This program comes with ABSOLUTELY NO WARRANTY.

" Use VxLib plugin registration without loading VxLib
let g:loadedPlugins = get(g:, 'loadedPlugins', {})
if get(g:loadedPlugins, 'flipwords', 0)
   finish
endif
let g:loadedPlugins['flipwords'] = 1

" Flip          - flip two white-space delimited words
" Flip ,        - flip two items in a comma-delimited list 
" Flip , )      - flip last two parameters (nested parens are not handled)
" Flip = ;      - flip two words delimited by '=' and ';' (c assignment)
" Flip = )\zs   - flip two words delimited by '=' where the second word ends with ')'
"
" The first word starts at the current position.
" Both words have to be on one line.
command! -nargs=* Flip call flipwords#Flip(<f-args>)
