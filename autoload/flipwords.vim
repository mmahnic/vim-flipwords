" Author: Marko Mahnič
" Created: April 2012
" License: GPL (http://www.gnu.org/copyleft/gpl.html)
" This program comes with ABSOLUTELY NO WARRANTY.
"
" See the the comments in the Flip command.
function! flipwords#Flip(...)
   let eolTerm = 1
   if a:0 == 0
      let delimA = '\s\+'
      let delimB = delimA
   elseif a:0 == 1
      let delimA = '\s*' . a:1 . '\s*'
      let delimB = delimA
   elseif a:0 == 2
      let delimA = '\s*' . a:1 . '\s*'
      let delimB = '\s*' . a:2 . '\s*'
   endif
   "echom delimA
   "echom delimB
   let posStart = getpos('.') " current position
   let lastLine = posStart[1]

   let rv = search(delimA, 'W', lastLine)
   if rv < 1 | return | endif
   let posWAe = getpos('.') " end of first word, start of delimiter
   "echom "AE " . string(posWAe)

   call setpos('.', posStart)
   let rv = search(delimA, 'We', lastLine)
   if rv < 1 | return | endif
   norm! l
   let posWBs = getpos('.') " start of second word, past the end of delimiter
   "echom "BS " . string(posWBs)

   let rv = search(delimB, 'W', lastLine)
   if rv > 0
      let posWBe = getpos('.') " end of second word, start of second delimiter
   else
      if !eolTerm
         return
      endif
      norm $
      let posWBe = getpos('.') " end of second word, EOL
      let posWBe[2] = posWBe[2] + 1
   endif
   "echom "BE " . string(posWBe)

   call setpos('.', posStart)
   let rx = @x
   exec 'norm ' . (posWAe[2] - posStart[2]) . '"xyl'
   call setpos('.', posWBs)
   let ry = @y
   exec 'norm ' . '"xPl' . (posWBe[2] - posWBs[2]) . '"ydl'
   call setpos('.', posStart)
   exec 'norm ' . (posWAe[2] - posStart[2]) . '"xdl"yP'

   let @x = rx
   let @y = ry
endfunc

