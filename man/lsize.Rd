\name{lsize}
\alias{lsize}
\title{Report objects and their memory sizes}
\description{\code{lsize} is like \code{ls}, except it returns a numeric vector whose names are the object names, and whose elements are the object sizes. The vector is sorted in order of increasing size. \code{lsize} avoids loading objects cached using \code{\link{mlazy}}; instead of their true size, it uses the size of the file that stores each cached object, which is shown as a \emph{negative} number. The file size is typically smaller than the size of the loaded object, because \code{\link{mlazy}} saves a compressed version. NB that \code{lsize} will scan \emph{all} objects in the environment, including ones with funny names, whereas \code{ls} does so only if its \code{all.names} argument is set to TRUE.
}
\usage{
lsize( envir=.GlobalEnv)
}
\arguments{\item{ envir}{where to look for the objects. Will be coerced to environment, so that e.g. \code{lsize( 2)} and \code{lsize( "package:mvbutils")} work. \code{envir} can be a \code{sys.frame}-- useful during debugging.}
}
\value{Named numeric vector.
}
\seealso{\code{ls}, \code{\link{mlazy}}
}
\author{Mark Bravington}
\examples{
# Current workspace
lsize()
# Contrived example to show objects in a function's environment
\{function(..., a, b, c) lsize( sys.frame( sys.nframe())) \}()
# a, b, c are all missing; this example might break in future R versions
# ...   a   b   c
#  28  28  28  28
}
\keyword{programming}
\keyword{misc
}
