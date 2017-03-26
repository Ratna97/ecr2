library(devtools)

load_all(".")

# OPTIMIZATION OF THE ONEMAX FUNCTION
# f(x) = sum(x) with x being a bitstring, i.e.,
# a vector of zeros and ones.
fitness.fun = function(x) sum(x)

# reproducibility
set.seed(1)

# WHITE BOX APPROACH
# ==================
# Explicit implementation of the evolutionary loop

# evolutionary setup
n.bits = 50L
MU = 25L
LAMBDA = 25L
MAX.ITER = 100L

# initialize toolbox
control = initECRControl(fitness.fun, n.objectives = 1L, minimize = FALSE)
control = registerECROperator(control, "mutate", setupBitflipMutator(p = 1 / n.bits))
control = registerECROperator(control, "selectForMating", setupTournamentSelector(k = 2L))
control = registerECROperator(control, "selectForSurvival", setupGreedySelector())

# initialize population of MU random bitstring
population = genBin(MU, n.bits)
fitness = evaluateFitness(population, control)

# now do the evolutionary loop
for (i in seq_len(MAX.ITER)) {
  # generate offspring by mutation only.
  #offspring = mutate(control, population, p.mut = 1)
  offspring = generateOffspring(control, population, fitness, lambda = LAMBDA, p.recomb = 0, p.mut = 1L)

  # calculate costs of new schedules
  fitness.o = evaluateFitness(offspring, control)

  # apply (MU + MU) selection
  sel = replaceMuPlusLambda(control, population, offspring, fitness, fitness.o)
  population = sel$population
  fitness = sel$fitness
}

print(population[[which.max(fitness)]])
print(max(fitness))

set.seed(1)

# BLACK-BOX APPROACH
# ==================
# Now the same procedure with the ecr black-box, i.e., "plug and play"
# style.
res = ecr(fitness.fun = fitness.fun, n.objectives = 1L, minimize = FALSE,
  representation = "binary", n.bits = n.bits,
  mu = MU, lambda = LAMBDA, survival.strategy = "plus",
  mutator = setupBitflipMutator(p = 1 / n.bits),
  survival.selector = setupGreedySelector(),
  p.mut = 1L, p.recomb = 0L, terminators = list(stopOnIters(MAX.ITER)))

print(res$best.y)
print(res$best.x)