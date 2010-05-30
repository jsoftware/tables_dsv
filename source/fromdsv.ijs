NB. =========================================================
NB. Convert from delimited strings to arrays of boxes

NB. ---------------------------------------------------------
NB.*fixdsv v Chop multiline delimited string to array of boxed strings
NB. returns: array of boxed literals
NB. form: [fd[;sd0[,sd1]]] fixdsv dat
NB. eg: ('|';'<>') fixdsv '<hello world>|4|84.3',LF,'<Big dig>|<hello world>|4',LF
NB. y is: multiline delimited string, lines delimited by LF
NB. x is: a literal or 1 or 2-item boxed list of optional delimiters.
NB.       0{:: single literal field delimiter (fd). Defaults to TAB
NB.   (1;0){:: (start) string delimiter (sd0). Defaults to '"'
NB.   (1;1){:: end string delimiter (sd1). Defaults to '"'
fixdsv=: 3 : 0
  (TAB;'""') fixdsv y
  :
  dat=. y
  'fd sd'=. 2{. boxopen x
  if. =/sd do. sd=. (-<:#sd)}.sd     NB. empty, one or two same
  else.
    s=. {.('|'=fd){ '|`'             NB. choose single sd
    dat=. dat rplc ({.sd);s;({:sd);s
    sd=. s
  end.
  b=. dat e. LF
  c=. ~:/\ dat e. sd
  msk=. b > c
  > msk <@(x&chopstring) ;._2 y
)

NB. ---------------------------------------------------------
NB.*readdsv v Reads delimiter-separated value file into a boxed array
NB. form: [fd[;sd0[,sd1]]] readdsv file
NB. returns: array of boxed literals
NB. y is: filename of file to read from
NB. x is: a literal or 1- or 2-item boxed list of optional delimiters.
NB.       0{:: single literal field delimiter (fd). Defaults to TAB
NB.   (1;0){:: (start) string delimiter (sd0). Defaults to '"'
NB.   (1;1){:: end string delimiter (sd1). Defaults to '"'
NB. eg: ('|';'<>') readdsv jpath '~temp/test.csv'
readdsv=: 3 : 0
  (TAB;'""') readdsv y
  :
  x=. 2{. boxopen x
  dat=. freads y
  if. dat -: _1 do. return. end.
  x fixdsv dat
)
