population = for _ <- 1..100, do: for(_ <- 1..1000, do: Enum.random(0..1))

evaluate = fn population ->
  Enum.sort_by(population, &Enum.sum/1, &>=/2)
end

selection = fn population ->
  population
  # the /3 version lets us handle left overs
  |> Enum.chunk_every(2)
  |> Enum.map(&List.to_tuple(&1))
end

crossover = fn population ->
  Enum.reduce(population, [], fn {p1, p2}, acc ->
    cx_point = :rand.uniform(1000)
    {{h1, t1}, {h2, t2}} = {Enum.split(p1, cx_point), Enum.split(p2, cx_point)}
    [h1 ++ t2, h2 ++ t1 | acc]
  end)
end

mutation = fn population ->
  population
  |> Enum.map(fn chromasone ->
    if :rand.uniform() < 0.05 do
      Enum.shuffle(chromasone)
    else
      chromasone
    end
  end)
end

algorithm = fn population, algorithm ->
  best = Enum.max_by(population, &Enum.sum/1)
  sum_of_best = Enum.sum(best)
  IO.write("\rCurrentBest: " <> Integer.to_string(sum_of_best))

  if sum_of_best == 1000 do
    best
  else
    # Rest of algorthim
    population
    |> evaluate.()
    |> selection.()
    |> crossover.()
    |> mutation.()
    |> algorithm.(algorithm)
  end
end

solution = algorithm.(population, algorithm)

IO.write("\n Answer is \n")
IO.inspect(solution)
