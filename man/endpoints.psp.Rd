\name{endpoints.psp}
\alias{endpoints.psp}
\title{Endpoints of Line Segment Pattern}
\description{
  Extracts the endpoints of each line segment
  in a line segment pattern.
}
\usage{
  endpoints.psp(x, which="both")
}
\arguments{
  \item{x}{
    A line segment pattern (object of class \code{"psp"}).
  }
  \item{which}{
    String specifying which endpoint or endpoints should be
    returned. See Details.
  }
}
\value{
  Point pattern (object of class \code{"ppp"}).
}
\details{
  This function extracts one endpoint, or both endpoints,
  from each of the line segments in \code{x},
  and returns these points as a point pattern object.
  
  The argument \code{which} determines which endpoint or endpoints
  of each line segment should be returned:
  \describe{
    \item{\code{which="both"}}{
      (the default): both endpoints
      of each line segment are returned. The result is a point pattern
      with twice as many points as there are line segments in \code{x}.
    }
    \item{\code{which="first"}}{
      select the first endpoint
      of each line segment (returns the points with coordinates
      \code{x$ends$x0, x$ends$y0}).
    }
    \item{\code{which="second"}}{
      select the second endpoint
      of each line segment (returns the points with coordinates
      \code{x$ends$x1, x$ends$y1}).
    }
    \item{\code{which="left"}}{
      select the left-most endpoint
      (the endpoint with the smaller \eqn{x} coordinate)
      of each line segment.
    }
    \item{\code{which="right"}}{
      select the right-most endpoint
      (the endpoint with the greater \eqn{x} coordinate)
      of each line segment.
    }
    \item{\code{which="lower"}}{
      select the lower endpoint
      (the endpoint with the smaller \eqn{y} coordinate)
      of each line segment.
    }
    \item{\code{which="upper"}}{
      select the upper endpoint
      (the endpoint with the greater \eqn{y} coordinate)
      of each line segment.
    }
  }
  The result is a point pattern. It also has an attribute
  \code{"id"} which is an integer vector identifying
  the segment which contributed each point.
}
\seealso{
  \code{\link{psp.object}},
  \code{\link{ppp.object}},
  \code{\link{marks.psp}},
  \code{\link{summary.psp}},
  \code{\link{midpoints.psp}},
  \code{\link{lengths_psp}},
  \code{\link{angles.psp}},
  \code{\link{extrapolate.psp}}.
}
\examples{
  a <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  plot(a)
  b <- endpoints.psp(a, "left")
  plot(b, add=TRUE)
}
\author{
  \adrian
  
  
  and \rolf
  
}
\keyword{spatial}
\keyword{manip}

