\name{bugfixes}
\alias{bugfixes}
\title{
  List Recent Bug Fixes
}
\description{
  List all bug fixes in a package, starting from a certain date or
  version of the package. Fixes are sorted alphabetically by the name of the
  affected function. The default is to list bug fixes in the latest
  version of the \pkg{spatstat} package.  
}
\usage{
  bugfixes(sinceversion = NULL, sincedate = NULL,
           package = "spatstat", show = TRUE)
}
\arguments{
  \item{sinceversion}{
    Earliest version of \code{package}
    for which bugs should be listed.
    The default is the current installed version.
  }
  \item{sincedate}{
    Earliest release date of \code{package}
    for which bugs should be listed.
    A character string or a date-time object.
  }
  \item{package}{
    Character string. The name of the package for which bugs are to be listed.
  }
  \item{show}{
    Logical value indicating whether to display the bug table
    on the terminal.
  }
}
\details{
  Bug reports are extracted from the NEWS file
  of the specified \code{package}.
  Only those after a specified date, or after a specified version
  of the package, are retained.
  The bug reports are then sorted alphabetically, so that all bugs affecting a
  particular function are listed consecutively. Finally the table of bug
  reports is displayed (if \code{show=TRUE}) and returned invisibly.
  
  The argument \code{sinceversion} should be a character string
  like \code{"1.2-3"}. The default is the current installed version of the
  package.

  The argument \code{sincedate} should be a 
  character string like \code{"2015-05-27"}, or a date-time object.

  If \code{sinceversion="all"} or \code{sincedate="all"}
  then all recorded bugs will be listed.
  
  If \code{package="spatstat"} (the default) then
  \code{sinceversion="book"} and \code{sincedate="book"}
  are interpreted to mean \code{sinceversion="1.42-1"},
  which gives all bugs reported after publication of
  the book by Baddeley, Rubak and Turner (2015).

  Typing \code{bugfixes} without parentheses will display a table of
  all bugs that were fixed in the current installed version of \pkg{spatstat}.
}
\value{
  A data frame, belonging to the class \code{"bugtable"},
  which has its own print method. 
}
\author{
  \adrian.
}
\seealso{
  \code{\link{latest.news}},
  \code{\link[utils]{news}}.  
}
\references{
  Baddeley, A., Rubak, E. and Turner, R. (2015)
  \emph{Spatial Point Patterns: Methodology and Applications with R}.
  Chapman and Hall/CRC Press.
}
\examples{
   bugfixes
   ## show all bugs reported after publication of the spatstat book
   if(interactive()) bugfixes(sinceversion="1.42-1")
   ## equivalent to bugfixes(sinceversion="book")
}
\keyword{documentation}
