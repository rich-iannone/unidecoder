\name{get.transliterations}
\alias{get.transliterations}
\title{Obtain table of transliterations}
\description{This function returns a data frame with transliterations for a specific language, or, a large default set of transliterations that is language agnostic. The function is primarly called by the 'unidecode' function.
}
\usage{
get.transliterations(language)
}
\arguments{
  \item{language}{

}
\author{
Richard Iannone
}
\examples{
# Get the rules for transliterating German into US-ASCII
get.transliterations("German")
}
