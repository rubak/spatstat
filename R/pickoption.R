#
#  pickoption.R
#
#  $Revision: 1.7 $  $Date: 2019/06/30 07:49:10 $
#

pickoption <- function(what="option", key, keymap, ...,
                       exact=FALSE, list.on.err=TRUE, die=TRUE, multi=FALSE,
                       allow.all=TRUE)
{
  keyname <- short.deparse(substitute(key))

  if(!is.character(key))
    stop(paste(keyname, "must be a character string",
               if(multi) "or strings" else NULL))
  if(length(key) == 0)
    stop(paste("Argument", sQuote(keyname), "has length zero"))
  key <- unique(key)
  if(!multi && length(key) > 1)
    stop(paste("Must specify only one", what, sQuote(keyname)))
  allow.all <- allow.all && multi

  id <-
    if(allow.all && "all" %in% key) {
      seq_along(keymap)
    } else if(exact) {
      match(key, names(keymap), nomatch=NA)
    } else {
      pmatch(key, names(keymap), nomatch=NA)
    }
  
  if(any(nbg <- is.na(id))) {
    # no match
    whinge <- paste("unrecognised", what,
                    paste(dQuote(key[nbg]), collapse=", "),
                    "in argument", sQuote(keyname))
    if(list.on.err) {
      cat(paste(whinge, "\n", "Options are:"),
          paste(dQuote(names(keymap)), collapse=","), "\n")
    }
    if(die) 
      stop(whinge, call.=FALSE)
    else
      return(NULL)
  }

  key <- unique(keymap[id])
  names(key) <- NULL
  return(key)
}

