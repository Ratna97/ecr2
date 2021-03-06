% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/approximatePoints.R
\name{approximateNadirPoint}
\alias{approximateNadirPoint}
\alias{approximateIdealPoint}
\title{Reference point approximations.}
\usage{
approximateNadirPoint(..., sets = NULL)

approximateIdealPoint(..., sets = NULL)
}
\arguments{
\item{...}{[\code{matrix}]\cr
Arbirary number of matrizes.}

\item{sets}{[\code{list}]\cr
List of matrizes. This is an alternative way of passing the sets. Can be used
exclusively or combined with \code{...}.}
}
\value{
[\code{numeric}] Reference point.
}
\description{
Helper functions to compute nadir or ideal point from sets of
points, e.g., multiple approximation sets.
}
