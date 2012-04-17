" Author: Marko Mahnič
" Created: April 2012
" License: GPL (http://www.gnu.org/copyleft/gpl.html)
" This program comes with ABSOLUTELY NO WARRANTY.
"
if exists("g:loaded_flipwords") && g:loaded_flipwords
   finish
endif
let g:loaded_flipwords = 1

" Flip          - flip two white-space delimited words
" Flip ,        - flip two items in a comma-delimited list 
" Flip , )      - flip two parameters (nested parens are not handled)
" Flip = ;      - flip two words delimited by '=' and ';' (c assignment)
" Flip = )\zs   - flip two words delimited by '=' where the second word ends with ')'
"
" The first word starts at the current position.
" Both words have to be on one line.
command! -nargs=* Flip call flipwords#Flip(<f-args>)
