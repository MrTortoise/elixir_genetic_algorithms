defmodule Cargo do
  @behaviour Problem
  alias Types.Chromasome

  @size 10
  @profits [6, 5, 8, 9, 6, 7, 3, 1, 2, 6]
  @weights [10, 6, 8, 7, 10, 9, 7, 11, 6, 8]
  @weight_limit 40

  @impl true
  def genotype do
    genes = for _ <- 1..@size, do: Enum.random(0..1)
    %Chromasome{genes: genes, size: @size}
  end

  @impl true
  def fitness_function(chromasome) do
    # takes the profits - multiples them by on / off and sums the result
    potential_profits =
      @profits
      |> Enum.zip(chromasome.genes)
      |> Enum.map(fn {profit, gene} -> profit * gene end)
      |> Enum.sum()

    over_limit? =
      chromasome.genes
      |> Enum.zip(@weights)
      |> Enum.map(fn {c, w} -> c * w end)
      |> Enum.sum()
      |> Kernel.>(@weight_limit)

    if over_limit? do
      0
    else
      potential_profits
    end
  end

  @impl true
  def terminate?(population) do
    # for some reason we know the answer but not the way
    Enum.max_by(population, &Cargo.fitness_function/1).fitness == 53
  end
end
