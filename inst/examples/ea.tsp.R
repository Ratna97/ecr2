library(methods)
library(testthat)
library(devtools)
library(BBmisc)
library(tspmeta)
library(ggplot2)

load_all(".")

# EA FOR THE TRAVELLING SALESPERSON PROBLEM
# =========================================
# Here we use the ecr2 package to optimize the TSP tour for a
# random TSP instance with n = 20 cities. For sure there are
# better solvers for this optimization problem, but here it
# serves to demonstrate the packages ability to operate on
# permutations, since a TSP tour is a permutation of the cities.

# reproducability
set.seed(1)

# generate instance
n.nodes = 20L
inst = random_instance(size = n.nodes)

# The target fun is the length of a given tour
fitness.fun = function(tour) {
  tour_length(x = TSP(inst$dists), order = as.integer(tour))
}

res = ecr(fitness.fun = fitness.fun,
  n.objectives = 1L, minimize = TRUE,
  representation = "permutation", perm = n.nodes,
  mu = 50L, lambda = 50L,
  survival.strategy = "plus", n.elite = 25L,
  survival.selector = selGreedy,
  recombinator = recPMX,
  terminators = list(stopOnIters(1000L)))
print(res)

# plot computed tour
print(autoplot(inst, opt_tour = res$best.x[[1L]]))
