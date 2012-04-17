
##Flipwords

The plugin Flipwords provides the command Flip that changes the order of two 
delimited words on a single line.

##Examples

    Flip	- flip two white-space delimited words
    Flip ,	- flip two items in a comma-delimited list 
    Flip , )	- flip two parameters (nested parens are not handled)
    Flip = ;	- flip two words delimited by '=' and ';' (c assignment)
    Flip = )	- flip two words delimited by '=' where the second 
  		  word ends with and includes ')'

Some effects of the Flip command (the coursor is at the character following '|'):

    ~~ let |b = a
    :Flip =
    ~~ let |a = b

    ~~ call doThis(|"one", "two", "three")
    :Flip ,
    ~~ call doThis(|"two", "one", "three")

    ~~ call doThis("one", |"two", "three")
    :Flip ,
    ~~ call doThis("one", |"three"), "two"

    ~~ call doThis("one", |"two", "three")
    :Flip , )
    ~~ call doThis("one", |"three", "two")

    ~~ if |result == getValue() " some comment
    :Flip == )\zs
    ~~ if |getValue() == result " some comment

