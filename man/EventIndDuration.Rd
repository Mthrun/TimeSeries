\name{EventIndDuration}
\alias{EventIndDuration}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculates the Duration of Event
}
\description{
Low level function that calculates the Duration of Event
}
\usage{
EventIndDuration(Timevector,BeginInd,EndInd,Resolution='mins',Silent=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Timevector}{[1:n] POSIXlt vecttor of time
}
  \item{BeginInd}{[1:m]         Beginning Indices
}
  \item{EndInd}{[1:m]         Ending Indices
}

  \item{Resolution}{Resolution of difference like 'mins','hours','days'
}
  \item{Silent}{default (TRUE), if FALSE, error warnings amd stops disabled
}

}
\details{
Timevector uses POSIXlt, which stores a list of day, month, year, hour, minute, second, etc.
EventIndDuration() assumes for Timevector, that all list-values within are in the same time zone.
}
\value{
diff[1:m]            Duration of Event
}

\author{
Michael Thrun
}
\note{
POSIXct stores seconds since UNIX epoch (+some other data), the conversion to POSIXlt can be done by this function only if UTC time zone is assumed.
}
\keyword{Timeduration}% use one of  RShowDoc("KEYWORDS")
\keyword{duration}% __ONLY ONE__ keyword per line
\keyword{Event}% __ONLY ONE__ keyword per line
\keyword{POSIXlt}% __ONLY ONE__ keyword per line
\keyword{CEP}
\keyword{Complex event processing}
\keyword{event processing}
\keyword{time series}
\keyword{categorial time series}