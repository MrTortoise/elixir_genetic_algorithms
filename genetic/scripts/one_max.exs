soln = Genetic.run(OneMax)

IO.write("\n")
IO.inspect(soln)
# genotype = fn -> for _ <- 1..1000, do: Enum.random(0..1) end

# IO.inspect(:erlang.fun_info(genotype)[:arity])

# fitness_function = fn chromasone -> Enum.sum(chromasone) end
# max_fitness = 1000

# soln = Genetic.run(genotype, fitness_function, max_fitness)

# IO.write("\n")
# IO.inspect(soln)
