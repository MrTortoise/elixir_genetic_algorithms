soln = Genetic.run(Cargo, population_size: 50)

IO.write("\n")
IO.inspect(soln)

weight =
  soln.genes
  |> Enum.zip([10, 6, 8, 7, 10, 9, 7, 11, 6, 8])
  |> Enum.map(fn {g, w} -> w * g end)
  |> Enum.sum()

IO.write("\nWeight is: #{weight}\n")
