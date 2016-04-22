\name{help2flatdoc}
\alias{help2flatdoc}
\title{Convert help files to flatdoc format.}
\description{Converts a vanilla R{} help file (as shown in the internal pager) to plain-text format. The output conventions are those in \code{\link{doc2Rd}}, so the output can be turned into Rd-format by running it through \code{\link{doc2Rd}}. This function is useful if you have existing Rd-format documentation and want to try out the \code{\link{flatdoc}} system of integrated code and documentation. It's good but not perfect (e.g. wrto spacing and automated nested sections); I could improve it if there is enough demand.
}
\usage{
 help2flatdoc( fun.name, pkg=NULL, text=NULL)
}
\arguments{
\item{ fun.name}{function name (a character string)}
\item{ pkg}{name of package}
\item{ text}{plain-text help}
The real argument is \code{text}; if missing, this is deduced from the help for \code{fun.name} (need not be a function) in the installed package \pkg{pkg}.
}
\details{
The package containing \code{fun.name} must be loaded first. If you write documentation using \code{\link{flatdoc}}, prepare the package with \code{\link{pre.install}}, build it with RCMD BUILD or INSTALL, and run \code{help2flatdoc} on the result, you should largely recover your original flat-format documentation.

Aliasses are deduced from function calls in the \bold{Usage} section.

(Link-triggering phrases aren't explicitly created-- could look thru lists of linkable things I guess.)
}
\examples{
cd.doc <- help2flatdoc( "cd", "mvbutils")
print( cd.doc)
cd.Rd <- doc2Rd( cd.doc)
}
\seealso{\code{\link{doc2Rd}}
}
\keyword{programming
}
