\name{mvbutils.operators}
\alias{mvbutils.operators}
\alias{\%&\%}
\alias{\%!in\%}
\alias{\%**\%}
\alias{\%except\%}
\alias{\%grepling\%}
\alias{\%is.not.a\%}
\alias{\%is.a\%}
\alias{\%is.not.an\%}
\alias{\%is.an\%}
\alias{\%matching\%}
\alias{\%not.in\%}
\alias{\%perling\%}
\alias{\%that.match\%}
\alias{\%that.dont.match\%}
\alias{\%that.are.in\%}
\alias{\%without.name\%}
\alias{\%in.range\%}
\alias{\%such.that\%}
\alias{\%SUCH.THAT\%}
\alias{\%upto\%}
\alias{\%downto\%}
\alias{\%where\%}
\alias{\%where.warn\%}
\title{Utility operators}
\description{Succinct or convenience operators
}
\usage{
a \%&\% b
x \%**\% y
a \%!in\% b
vector \%except\% condition
x \%grepling\% patt
x \%is.not.a\% what
x \%is.a\% what
x \%is.not.an\% what
x \%is.an\% what
x \%matching\% patt
a \%not.in\% b
x \%perling\% patt
x \%that.match\% patt
x \%that.dont.match\% patt
a \%that.are.in\% b
x \%without.name\% what
a \%in.range\% b
a \%such.that\% b
a \%SUCH.THAT\% b
from \%upto\% to
from \%downto\% to
x \%where\% cond
x \%where.warn\% cond
}
\arguments{\item{ a, b, vector, condition, x, y, what, patt, from, to, cond}{see \bold{Arguments by function}.}
}
\value{
\item{ \%&\%}{character vector. If either is zero-length, so is the result (unlike \code{paste}).}
\item{ \%**\%}{numeric, possibly a matrix}
\item{ \%upto\%, \%downto\%}{numeric}
\item{ \%is.a\% etc}{logical}
\item{ All others}{same type as first argument.}
}
\section{Arguments by function}{
\code{\%&\%} a, b: character vectors to be \code{paste}d with no separator. If either is zero-length, so is the result (unlike \code{paste}).

\code{\%**\%} x, y: matrices or vectors to be multiplied using \code{\%*\%} but with less fuss about dimensions

\code{\%!in\%}, \code{\%that.are.in\%} a, b: vectors (character, numeric, complex, or logical).

\code{\%except\%} vector, condition: character or numeric vectors

\code{\%in.range\%} a, b: numeric vectors.

\code{\%is.a\%}, etc. x: object whose class is to be checked

\code{\%is.a\%}, etc. what: class name

\code{\%matching\%}, \code{\%that.match\%}, \code{\%that.dont.match\%}, \code{\%grepling\%}, \code{\%perling\%} x: character vector

\code{\%matching\%}, \code{\%that.match\%}, \code{\%that.dont.match\%}, \code{\%grepling\%}, \code{\%perling\%} patt: character vector of regexps, with perl syntax for \code{\%perling\%}

\code{\%such.that\%}, \code{\%SUCH.THAT\%} a: vector

\code{\%such.that\%}, \code{\%SUCH.THAT\%} b: expression containing a \code{.}, to subscript \code{a} with

\code{\%upto\%}, \code{\%downto\%} from, to: numeric(1)

\code{\%where\%}, \code{\%where.warn\%} x: data.frame

\code{\%where\%}, \code{\%where.warn\%} cond: unquoted expression to be \code{eval}ed in context of \code{x}, then in the calling frame of \code{\%where\%} (or \code{.GlobalEnv}). Should evaluate to logical (or maybe numeric or character); NA is treated as FALSE. Wrap \code{cond} in parentheses to avoid trouble with operator precedence.

\code{\%without.name\%} x: object with \code{names} attribute

\code{\%without.name\%} what: character vector of names to drop
}
\author{Mark Bravington}
\seealso{bquote
}
\examples{
"a" \%&\% "b" # "ab"
matrix( 1:4, 2, 2) \%**\% matrix( 1:2, 2, 1) # c( 7, 10); '\%*\%' gives matrix result
matrix( 1:2, 2, 1) \%**\% matrix( 1:4, 2, 2) # c( 5, 11); '\%*\%' gives error
1:2 \%**\% matrix( 1:4, 2, 2) # '\%*\%' gives matrix result
1:5 \%!in\% 3:4 # c( TRUE, TRUE, FALSE, FALSE, TRUE)
1:5 \%that.are.in\% 3:4 # c( 3, 4)
trf <- try( 1+"nonsense")
if( trf \%is.not.a\% "try-error") cat( "OK\\n") else cat( "not OK\\n")
1:5 \%except\% c(2,4,6) # c(1,3,5)
c( alpha=1, beta=2) \%without.name\% "alpha" # c( beta=2)
1:5 \%in.range\% c( 2, 4) # c(F,T,T,T,F)
c( "cat", "hat", "dog", "brick") \%matching\% c( "at", "ic") # cat hat brick
c( "cat", "hat", "dog", "brick") \%that.match\% c( "at", "ic") # cat hat brick; synonym for '\%matching\%'
c( "cat", "hat", "dog", "brick") \%that.dont.match\% c( "at", "ic") # dog; like '\%except\%' but for regexps
1 \%upto\% 2 # 1:2
1 \%upto\% 0 # numeric( 0); use \%upto\% rather than : in for-loops to avoid unintended errors
1 \%downto\% 0 # 1:0
1 \%downto\% 2 # numeric( 0)
ff <- function( which.row) \{
x <- data.frame( a=1:3, b=4:6)
x \%where\% (a==which.row)
\}
ff( 2) # data.frame( a=2, b=5)
x <- data.frame( start=1:3, end=c( 4, 5, 0))
x \%where.warn\% (start < end) # gives warning about row 3
(1:5) \%such.that\% (.>2) # 3,4,5
listio <- list( a=1,  b=2)
chars <- cq( a, b)
chars \%SUCH.THAT\% (listio[[.]]==2) # 'b'; \%such.that\% won't work because [[]] can't handle xtuples
}
\keyword{misc}
