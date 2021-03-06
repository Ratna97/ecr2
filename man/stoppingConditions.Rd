% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/terminators.R
\name{stoppingConditions}
\alias{stoppingConditions}
\alias{stopOnEvals}
\alias{stopOnIters}
\alias{stopOnOptY}
\title{Stopping conditions}
\usage{
stopOnEvals(max.evals = NULL)

stopOnIters(max.iter = NULL)

stopOnOptY(opt.y, eps)
}
\arguments{
\item{max.evals}{[\code{integer(1)}]\cr
Maximal number of function evaluations. Default ist \code{Inf}.}

\item{max.iter}{[\code{integer(1)}]\cr
Maximal number of iterations. Default ist \code{Inf}.}

\item{opt.y}{[\code{numeric(1)}]\cr
Optimal scalar fitness function value.}

\item{eps}{[\code{numeric(1)}]\cr
Stop if absolute deviation from \code{opt.y} is lower than \code{eps}.}
}
\value{
[\code{ecr_terminator}]
}
\description{
Stop the EA after a fixed number of fitness function evaluations, after
a predefined number of generations/itereations or if the known optimal function
value is approximated (only for single-objective optimization).
}
